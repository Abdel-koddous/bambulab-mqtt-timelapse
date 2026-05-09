import os
import json
import signal
import sys
import ssl
import argparse
import logging
from datetime import datetime as dt

import gphoto2 as gp
import paho.mqtt.client as mqtt

from load_mqtt_settings import config_path, load_mqtt_settings

# Non-sensitive defaults in source (sensitive: username, password, device_id via mqtt_local_config.json).
DEFAULT_BROKER = "mqtt://us.mqtt.bambulab.com"
DEFAULT_PORT = 8883
DEFAULT_DESTINATION = "./captures"

_SETTINGS = load_mqtt_settings()

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
)


def _broker_hostname(broker: str) -> str:
    """Strip common URL schemes so paho gets a hostname (paho does not accept mqtt://…)."""
    broker = broker.strip()
    for prefix in ("mqtts://", "mqtt://", "ssl://", "tcp://"):
        if broker.lower().startswith(prefix):
            broker = broker[len(prefix) :]
    return broker.split("/")[0].split(":")[0]


parser = argparse.ArgumentParser(
    description="MQTT timelapse trigger (TLS to Bambu broker; server cert not verified)"
)
parser.add_argument(
    "--destination",
    type=str,
    default=DEFAULT_DESTINATION,
    help=f"Destination folder for photos (default: {DEFAULT_DESTINATION!r})",
)
parser.add_argument(
    "--username",
    type=str,
    default=_SETTINGS.get("username", ""),
    help="MQTT username (default: username in mqtt_local_config.json)",
)
parser.add_argument(
    "--password",
    type=str,
    default=_SETTINGS.get("password", ""),
    help="MQTT password (default: password in mqtt_local_config.json)",
)
parser.add_argument(
    "--broker",
    type=str,
    default=DEFAULT_BROKER,
    help=f"MQTT broker hostname, IP, or mqtt:// URL (default: {DEFAULT_BROKER!r})",
)
parser.add_argument(
    "--port",
    type=int,
    default=DEFAULT_PORT,
    help=f"MQTT port (default: {DEFAULT_PORT})",
)
parser.add_argument(
    "--device_id",
    type=str,
    default=_SETTINGS.get("device_id", ""),
    help="Printer serial / MQTT device ID (default: device_id in mqtt_local_config.json)",
)
args = parser.parse_args()

broker_host = _broker_hostname(args.broker)

if not args.username or not args.password or not args.device_id:
    logging.error(
        "Missing username, password, or device_id. "
        "Set them in %s (see mqtt_local_config.example.json) or pass CLI flags.",
        config_path(),
    )
    sys.exit(1)

if not broker_host:
    logging.error("Broker hostname is empty after parsing (--broker).")
    sys.exit(1)


def on_message(client, userdata, msg):
    try:
        payload = json.loads(msg.payload.decode())
        logging.info(f"Received message: {payload}")
        if payload.get("print") and (
            payload["print"].get("layer_num") and payload["print"].get("msg") == 1
        ):
            try:
                capture_photo(args.destination)
            except Exception as e:
                logging.error(f"Pausing print job due to error: {e}")
                try:
                    client.publish(
                        f"device/{args.device_id}/request",
                        json.dumps(
                            {
                                "print": {
                                    "command": "pause",
                                }
                            }
                        ),
                    )
                except Exception as publish_error:
                    logging.error(f"Failed to publish pause command: {publish_error}")
    except json.JSONDecodeError:
        logging.error("Failed to decode message payload as JSON")


def capture_photo(destination_folder):
    try:
        start = dt.now()
        camera = gp.Camera()
        camera.init()

        file_path = camera.capture(gp.GP_CAPTURE_IMAGE)
        camera_file = camera.file_get(
            file_path.folder, file_path.name, gp.GP_FILE_TYPE_NORMAL
        )

        if not os.path.exists(destination_folder):
            os.makedirs(destination_folder)

        timestamp = dt.now().strftime("%Y%m%d%H%M%S")
        target_path = f"{destination_folder}/photo_{timestamp}.jpg"
        camera_file.save(target_path)
        camera.exit()

        logging.info(
            f"Photo captured and saved at: {target_path}, time: {dt.now() - start}"
        )
    except gp.GPhoto2Error as e:
        logging.error(f"Camera error: {e}")
        raise e


def handle_exit(sig, frame):
    logging.info("Shutting down...")
    try:
        client.disconnect()
        client.loop_stop()
    except Exception as e:
        logging.error(f"Error during shutdown: {e}")
    sys.exit(0)


# Test camera connection
camera_test = None
try:
    camera_test = gp.Camera()
    camera_test.init()
    camera_test.exit()
    logging.info("Camera connected successfully")
except gp.GPhoto2Error as e:
    logging.error(f"Error connecting to camera: {e}")
    sys.exit(1)

try:
    client = mqtt.Client(callback_api_version=mqtt.CallbackAPIVersion.VERSION2)
except (AttributeError, TypeError):
    client = mqtt.Client()
client.on_message = on_message
client.username_pw_set(username=args.username, password=args.password)
# TLS without verifying server certificate (same as MQTT Explorer “Validate certificate” off).
client.tls_set(cert_reqs=ssl.CERT_NONE, tls_version=mqtt.ssl.PROTOCOL_TLSv1_2)
client.tls_insecure_set(True)

logging.info("Connecting to %s:%s ...", broker_host, args.port)
client.connect(broker_host, args.port, 60)
client.subscribe(f"device/{args.device_id}/report")

signal.signal(signal.SIGINT, handle_exit)
signal.signal(signal.SIGTERM, handle_exit)

client.loop_forever()
