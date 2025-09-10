# MQTT-Based 3D Printing Timelapse (Bambu Lab Only)

An automated camera trigger system for creating timelapse videos of your 3D prints.  
This script listens for MQTT layer notifications from **Bambu Lab printers** and triggers your camera to capture photos at each layer.  

✅ **Tested on Bambu Lab A1**  
⚠️ Currently **only supports Bambu Lab printers**. Other printers may require message format adjustments.

---

## ✨ Features

- 📸 Automatic photo capture triggered by MQTT layer-change events  
- 📷 Works with any **gPhoto2-compatible camera** (DSLR, mirrorless, etc.)  
- 🛠️ Automatically pauses print if camera capture fails  
- 📁 Saves images with timestamps for easy timelapse generation  

---

## 📋 Requirements

- **Python** 3.7+  
- **gPhoto2** (for camera control)  
- **MQTT broker** with TLS support  
- **Bambu Lab printer** (tested on A1, other models unverified)  

---

## 🚀 Installation

1. **Clone this repo**:
   ```bash
   git clone https://github.com/AlexanderBiba/cam-trigger.git
   cd cam-trigger
   ```

2. **Install Python dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

3. **Install gPhoto2**:

   **macOS**:
   ```bash
   brew install libgphoto2
   ```

   **Ubuntu/Debian**:
   ```bash
   sudo apt-get install libgphoto2-dev
   ```

   **Other systems**: See [gPhoto2 install guide](http://www.gphoto.org/proj/libgphoto2/support.php)

4. **Verify camera connection**:
   ```bash
   gphoto2 --auto-detect
   ```

---

## ▶️ Usage

Basic run:

```bash
python mqtt_trigger.py   --destination ./captures   --cafile ./blcert.pem   --username YOUR_MQTT_USER   --password YOUR_MQTT_PASS   --broker YOUR.MQTT.BROKER   --port 8883   --device_id YOUR_PRINTER_ID
```

### Arguments

| Argument | Required | Description |
|----------|----------|-------------|
| `--destination` | ✅ | Folder where images are stored |
| `--cafile` | ✅ | Path to CA cert for MQTT TLS |
| `--username` | ✅ | MQTT username |
| `--password` | ✅ | MQTT password |
| `--broker` | ✅ | MQTT broker hostname/IP |
| `--port` | ✅ | MQTT broker port (usually `8883`) |
| `--device_id` | ✅ | Bambu Lab printer ID |

---

## ⚙️ Setup Steps

### 1. Export Broker Certificate
```bash
openssl s_client -showcerts -connect YOUR_BROKER_IP:8883 </dev/null  | sed -n -e '/-.BEGIN/,/-.END/ p' > blcert.pem
```

### 2. Bambu Lab MQTT Messages

This project expects payloads like:
```json
{
  "print": {
    "layer_num": 5,
    "msg": 1
  }
}
```

Trigger condition:
- `print.layer_num` present  
- `print.msg == 1`  

### 3. Create Capture Folder
```bash
mkdir captures
```

---

## 🎞️ Post-Processing

### Add Layer Pauses (Optional)

Insert wait commands into G-code so the camera has time to shoot:
```bash
sed -i '' -r "/^M991 S0 P[0-9]+.*$/s/.*/&
M400 S8/" your_file.gcode
```
Adds `M400 S8` (8 sec wait) after each layer notification.

### Generate Timelapse
```bash
ffmpeg -framerate 30 -pattern_type glob -i "captures/*.jpg"  -c:v libx264 -r 30 -pix_fmt yuv420p output.mp4
```

---

## 🛠️ Troubleshooting

**Camera**  
- Not detected → check USB & `gphoto2 --auto-detect`  
- Permission errors → add user to `plugdev` (Linux)  
- Camera busy → close other apps (e.g., photo apps)  

**MQTT**  
- Connection refused → verify broker/port/creds  
- JSON decode error → check payload format  
- Pause publish failed → broker issue  

---

## 🤝 Contributing
PRs welcome! Extend support for other printers or improve handling.

---

## 📜 License
MIT License.

---

## 🧑‍💻 Support
Open an issue on GitHub if you encounter problems.
