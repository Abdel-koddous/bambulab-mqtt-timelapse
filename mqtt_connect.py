#!/usr/bin/env python3
"""Minimal TLS MQTT client for a Bambu Lab printer (Cloud broker)."""

import argparse
import json
import logging
import signal
import sys
import ssl
import paho.mqtt.client as mqtt

from load_mqtt_settings import config_path, load_mqtt_settings

# Non-sensitive defaults in source (sensitive: username, password, device_id via mqtt_local_config.json).
DEFAULT_BROKER = "mqtt://us.mqtt.bambulab.com"
DEFAULT_PORT = 8883

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


def parse_args():
    p = argparse.ArgumentParser(
        description="Connect to Bambu Lab printer MQTT (LAN TLS on port 8883)."
    )
    p.add_argument(
        "--broker",
        default=DEFAULT_BROKER,
        help=f"MQTT broker hostname or printer LAN IP (default: {DEFAULT_BROKER!r})",
    )
    p.add_argument(
        "--port",
        type=int,
        default=DEFAULT_PORT,
        help=f"MQTT port (default: {DEFAULT_PORT})",
    )
    p.add_argument(
        "--username",
        default=_SETTINGS.get("username", ""),
        help="MQTT username (default: username in mqtt_local_config.json)",
    )
    p.add_argument(
        "--password",
        default=_SETTINGS.get("password", ""),
        help="MQTT password / cloud token (default: password in mqtt_local_config.json)",
    )
    p.add_argument(
        "--device_id",
        default=_SETTINGS.get("device_id", ""),
        help="Printer serial number (default: device_id in mqtt_local_config.json)",
    )
    return p.parse_args()


def on_message(_client, _userdata, msg):
    try:
        payload = json.loads(msg.payload.decode())
        logging.info("%s %s", msg.topic, json.dumps(payload)[:500])
    except json.JSONDecodeError:
        logging.info("%s %s", msg.topic, msg.payload[:200])


def main():
    args = parse_args()
    broker = _broker_hostname(args.broker)
    if not broker or not args.username or not args.password or not args.device_id:
        logging.error(
            "Missing broker, username, password, or device_id. "
            "Set username, password, device_id in %s (see mqtt_local_config.example.json), "
            "or pass CLI flags.",
            config_path(),
        )
        sys.exit(1)
    topic = f"device/{args.device_id}/report"

    try:
        client = mqtt.Client(callback_api_version=mqtt.CallbackAPIVersion.VERSION2)
    except (AttributeError, TypeError):
        client = mqtt.Client()
    client.username_pw_set(args.username, args.password)
    # TLS without verifying server certificate (same as MQTT Explorer “Validate certificate” off).
    client.tls_set(cert_reqs=ssl.CERT_NONE, tls_version=mqtt.ssl.PROTOCOL_TLSv1_2)
    client.tls_insecure_set(True)
    client.on_message = on_message

    def shutdown(_sig=None, _frame=None):
        logging.info("Disconnecting...")
        try:
            client.disconnect()
            client.loop_stop()
        except Exception as e:
            logging.debug("shutdown: %s", e)
        sys.exit(0)

    signal.signal(signal.SIGINT, shutdown)
    signal.signal(signal.SIGTERM, shutdown)

    logging.info("Connecting to %s:%s ...", broker, args.port)
    client.connect(broker, args.port, keepalive=60)
    logging.info("Subscribing to %s (Ctrl+C to quit)", topic)
    client.subscribe(topic)
    client.loop_forever()


if __name__ == "__main__":
    main()
