from datetime import datetime as dt
import json
import paho.mqtt.client as mqtt
import argparse
import gphoto2 as gp
import os

DESTINATION_FOLDER = "./captures"

parser = argparse.ArgumentParser(description="MQTT Client with TLS and CA file")
parser.add_argument("--cafile", type=str, help="Path to CA certificate file")
parser.add_argument("--username", type=str, help="MQTT username")
parser.add_argument("--password", type=str, help="MQTT password")
parser.add_argument("--broker", type=str, help="MQTT broker")
parser.add_argument("--port", type=int, help="MQTT port")
parser.add_argument("--device_id", type=str, help="MQTT device ID")
args = parser.parse_args()


def on_message(client, userdata, msg):
    get_timestamp = lambda: dt.now().strftime("%Y%m%d%H%M%S")
    msg = json.loads(msg.payload.decode())
    print(f"{get_timestamp()} - {msg}")
    if msg.get("print") and msg["print"].get("layer_num"):
        start = dt.now()
        camera = gp.Camera()
        camera.init()
        file_path = camera.capture(gp.GP_CAPTURE_IMAGE)
        camera_file = camera.file_get(
            file_path.folder, file_path.name, gp.GP_FILE_TYPE_NORMAL
        )
        target_path = f"{DESTINATION_FOLDER}/photo_{get_timestamp()}.jpg"
        if not os.path.exists(DESTINATION_FOLDER):
            os.makedirs(DESTINATION_FOLDER)
        camera_file.save(target_path)
        camera.exit()
        print(
            f"{get_timestamp()} - Photo captured and saved at: {target_path}, time: {dt.now() - start}"
        )


client = mqtt.Client()
client.on_message = on_message
client.username_pw_set(username=args.username, password=args.password)
client.tls_set(ca_certs=args.cafile, tls_version=mqtt.ssl.PROTOCOL_TLSv1_2)
client.tls_insecure_set(True)
client.connect(args.broker, args.port, 60)
client.subscribe(f"device/{args.device_id}/report")
client.loop_forever()
