# MQTT Based 3d printing timelapse

## Get blcert

```
openssl s_client -showcerts -connect 192.168.86.38:8883 </dev/null | sed -n -e '/-.BEGIN/,/-.END/ p' > blcert.pem
```

## Post processing command

```
sed -i '' -r "/^M991 S0 P[0-9]+.*$/s/.*/&\nM400 S8/"
```

## Generate output

```
ffmpeg -framerate 30 -pattern_type glob -i "captures/*.jpg" -c:v libx264 -r 30 -pix_fmt yuv420p output.mp4
```
