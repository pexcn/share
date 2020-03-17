```bash
ffmpeg -ss 00:00:00.30 -i originial.m4a -t 00:00:48.90 -acodec copy ok.m4a
ffmpeg -ss 00:00:15.18 -i originial.m4a -t 00:00:33.78 -acodec copy ring.m4a
```

```
ffmpeg -i ok.webm -c:a flac ok.flac
ffmpeg -i ok.webm -acodec libmp3lame -ab 320k ok.mp3
```
