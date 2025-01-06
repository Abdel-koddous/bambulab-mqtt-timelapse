import os
import json
import signal
from datetime import datetime as dt
import argparse
import logging
import gphoto2 as gp
import paho.mqtt.client as mqtt
from logging.handlers import RotatingFileHandler


DESTINATION_FOLDER = "./captures"

# Configure logging
log_formatter = logging.Formatter("%(asctime)s - %(levelname)s - %(message)s")

# File handler
file_handler = RotatingFileHandler(
    "mqtt_camera.log", maxBytes=5 * 1024 * 1024, backupCount=3
)
file_handler.setLevel(logging.INFO)
file_handler.setFormatter(log_formatter)

# Stream handler (stdout)
stream_handler = logging.StreamHandler()
stream_handler.setLevel(logging.INFO)
stream_handler.setFormatter(log_formatter)

# Root logger
logging.basicConfig(level=logging.INFO, handlers=[file_handler, stream_handler])


parser = argparse.ArgumentParser(description="MQTT Client with TLS and CA file")
parser.add_argument(
    "--cafile", type=str, required=True, help="Path to CA certificate file"
)
parser.add_argument("--username", type=str, required=True, help="MQTT username")
parser.add_argument("--password", type=str, required=True, help="MQTT password")
parser.add_argument("--broker", type=str, required=True, help="MQTT broker")
parser.add_argument("--port", type=int, required=True, help="MQTT port")
parser.add_argument("--device_id", type=str, required=True, help="MQTT device ID")
args = parser.parse_args()


def on_message(client, userdata, msg):
    try:
        payload = json.loads(msg.payload.decode())
        logging.info(f"Received message: {payload}")
        if payload.get("print") and payload["print"].get("layer_num"):
            capture_photo()
    except json.JSONDecodeError:
        logging.error("Failed to decode message payload as JSON")


def capture_photo():
    try:
        start = dt.now()
        camera = gp.Camera()
        camera.init()

        file_path = camera.capture(gp.GP_CAPTURE_IMAGE)
        camera_file = camera.file_get(
            file_path.folder, file_path.name, gp.GP_FILE_TYPE_NORMAL
        )

        if not os.path.exists(DESTINATION_FOLDER):
            os.makedirs(DESTINATION_FOLDER)

        target_path = (
            f"{DESTINATION_FOLDER}/photo_{dt.now().strftime("%Y%m%d%H%M%S")}.jpg"
        )
        camera_file.save(target_path)
        camera.exit()

        logging.info(
            f"Photo captured and saved at: {target_path}, time: {dt.now() - start}"
        )
    except gp.GPhoto2Error as e:
        logging.error(f"Camera error: {e}")


def handle_exit(sig, frame):
    logging.info("Shutting down...")
    client.disconnect()
    client.loop_stop()
    exit(0)


# Test camera connection
try:
    camera = gp.Camera()
    camera.init()
    camera.exit()
    logging.info("Camera connected successfully")
except gp.GPhoto2Error as e:
    logging.error(f"Error connecting to camera: {e}")
    exit(1)

# Setup MQTT
client = mqtt.Client()
client.on_message = on_message
client.username_pw_set(username=args.username, password=args.password)
client.tls_set(ca_certs=args.cafile, tls_version=mqtt.ssl.PROTOCOL_TLSv1_2)
client.tls_insecure_set(True)
client.connect(args.broker, args.port, 60)
client.subscribe(f"device/{args.device_id}/report")

# Signal handling
signal.signal(signal.SIGINT, handle_exit)
signal.signal(signal.SIGTERM, handle_exit)

# Start MQTT loop
client.loop_forever()
