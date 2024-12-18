# MQTT Based 3d printing timelapse

## Get blcert

```
openssl s_client -showcerts -connect 192.168.86.38:8883 </dev/null | sed -n -e '/-.BEGIN/,/-.END/ p' > blcert.pem
```

## Post processing command

```
sed -i '' -r "/^M73 L[0-9]+$/s/.*/M400 U1\n&/"
```

## Generate output

```
ffmpeg -framerate 30 -pattern_type glob -i "captures/*.jpg" -c:v libx264 -r 30 -pix_fmt yuv420p output.mp4
```
