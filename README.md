# MQTT Based 3D Printing Timelapse

An automated camera trigger system that captures photos during 3D printing based on MQTT layer notifications. This tool listens for MQTT messages from your 3D printer and automatically captures photos at each layer to create timelapse videos.

## Features

- 📸 Automatic photo capture triggered by MQTT layer notifications
- 📷 Compatible with gPhoto2-supported cameras (DSLR, mirrorless, etc.)
- 🛠️ Automatic print job pause on camera errors
- 📁 Organized photo storage with timestamped filenames

## Prerequisites

- Python 3.7 or higher
- A camera compatible with gPhoto2 (most DSLR and mirrorless cameras)
- MQTT broker with TLS support
- 3D printer firmware that sends MQTT layer notifications

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/AlexanderBiba/cam-trigger.git
   cd cam-trigger
   ```

2. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

3. **Install gPhoto2 system dependencies:**
   
   **On macOS:**
   ```bash
   brew install libgphoto2
   ```
   
   **On Ubuntu/Debian:**
   ```bash
   sudo apt-get install libgphoto2-dev
   ```
   
   **On other systems:** See the [gPhoto2 installation guide](http://www.gphoto.org/proj/libgphoto2/support.php)

4. **Connect your camera** via USB and ensure it's recognized by gPhoto2:
   ```bash
   gphoto2 --auto-detect
   ```

## Usage

### Basic Usage

```bash
python mqtt_trigger.py \
  --destination ./captures \
  --cafile ./blcert.pem \
  --username your_mqtt_username \
  --password your_mqtt_password \
  --broker your.mqtt.broker.com \
  --port 8883 \
  --device_id your_printer_id
```

### Command Line Arguments

| Argument | Required | Description |
|----------|----------|-------------|
| `--destination` | Yes | Directory where photos will be saved |
| `--cafile` | Yes | Path to CA certificate file for MQTT TLS |
| `--username` | Yes | MQTT broker username |
| `--password` | Yes | MQTT broker password |
| `--broker` | Yes | MQTT broker hostname or IP address |
| `--port` | Yes | MQTT broker port (typically 8883 for TLS) |
| `--device_id` | Yes | Unique identifier for your 3D printer |

### Example Configuration

```bash
python mqtt_trigger.py \
  --destination ./timelapse_photos \
  --cafile ./mqtt_cert.pem \
  --username printer_user \
  --password secure_password123 \
  --broker mqtt.example.com \
  --port 8883 \
  --device_id ender3_v2
```

## Setup Instructions

### 1. Get MQTT Certificate

To establish a secure connection to your MQTT broker, you'll need to obtain the CA certificate:

```bash
openssl s_client -showcerts -connect YOUR_BROKER_IP:8883 </dev/null | sed -n -e '/-.BEGIN/,/-.END/ p' > blcert.pem
```

Replace `YOUR_BROKER_IP` with your actual MQTT broker IP address.

### 2. Configure Your 3D Printer

Ensure your 3D printer firmware is configured to send MQTT messages with the following structure:

```json
{
  "print": {
    "layer_num": 5,
    "msg": 1
  }
}
```

The script triggers photo capture when:
- `print.layer_num` is present (any layer number)
- `print.msg` equals `1`

### 3. Create Output Directory

```bash
mkdir captures
```

## Post Processing Commands

### Add Pause Commands to G-code

To ensure the camera has time to capture photos, you may want to add pause commands to your G-code:

```bash
sed -i '' -r "/^M991 S0 P[0-9]+.*$/s/.*/&\nM400 S8/" your_print_file.gcode
```

This adds an `M400 S8` (wait 8 seconds) command after each layer change notification.

### Generate Timelapse Video

After your print is complete, create a timelapse video from the captured photos:

```bash
ffmpeg -framerate 30 -pattern_type glob -i "captures/*.jpg" -c:v libx264 -r 30 -pix_fmt yuv420p output.mp4
```

## Troubleshooting

### Camera Issues

- **Camera not detected:** Ensure your camera is connected via USB and recognized by gPhoto2
- **Permission errors:** On Linux, you may need to add your user to the `plugdev` group
- **Camera busy:** Make sure no other applications are using the camera

### MQTT Connection Issues

- **Connection refused:** Verify broker address, port, and credentials

### Common Error Messages

- `Camera error: [Error code]` - Check camera connection and gPhoto2 installation
- `Failed to decode message payload as JSON` - Verify MQTT message format from your printer
- `Failed to publish pause command` - Check MQTT broker connection

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open source. Please check the license file for details.

## Support

If you encounter any issues or have questions, please open an issue on GitHub.
