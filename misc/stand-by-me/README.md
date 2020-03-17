```bash
# channel
# reference: https://trac.ffmpeg.org/wiki/AudioChannelManipulation
ffmpeg -i ok.m4a -af "pan=stereo|c0=c1|c1=c1" ok-fix.m4a

# cut
ffmpeg -ss 00:00:00.30 -i originial.m4a -t 00:00:48.90 -acodec copy ok.m4a
ffmpeg -ss 00:00:15.18 -i originial.m4a -t 00:00:33.78 -acodec copy ring.m4a

# convert
ffmpeg -i ok.m4a -c:a flac ok.flac
ffmpeg -i ok.m4a -acodec libmp3lame -ab 320k ok.mp3
```
