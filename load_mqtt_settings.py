"""Load sensitive MQTT credentials from mqtt_local_config.json (gitignored)."""

import json
from pathlib import Path

CONFIG_FILENAME = "my_mqtt_config.json"
# Example of the my_mqtt_config.json file:
# {
#   "username": "NumericUID",
#   "password": "AccessToken",
#   "device_id": "PrinterSerialNumber"
# }

_CONFIG_DIR = Path(__file__).resolve().parent


def config_path() -> Path:
    return _CONFIG_DIR / CONFIG_FILENAME


def load_mqtt_settings() -> dict:
    path = config_path()
    if not path.is_file():
        return {}
    with path.open(encoding="utf-8") as f:
        return json.load(f)
