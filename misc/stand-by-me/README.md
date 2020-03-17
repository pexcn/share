```bash
# cut
ffmpeg -ss 00:00:00.30 -i origin.m4a -t 00:00:48.90 -acodec copy sing.m4a
ffmpeg -ss 00:00:15.18 -i origin.m4a -t 00:00:33.78 -acodec copy ring.m4a

# channel
# reference: https://trac.ffmpeg.org/wiki/AudioChannelManipulation
ffmpeg -i sing.m4a -af "pan=stereo|c0=c1|c1=c1" sing-fix.m4a
ffmpeg -i ring.m4a -af "pan=stereo|c0=c1|c1=c1" ring-fix.m4a

# convert
ffmpeg -i sing-fix.m4a -c:a flac ok.flac
ffmpeg -i sing-fix.m4a -acodec libmp3lame -ab 320k ok.mp3
```
