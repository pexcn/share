```bash
ffmpeg -ss 00:00:15.18 -i standbyme.m4a -t 00:00:33.78 -acodec copy standbyme-ring.m4a
ffmpeg -ss 00:00:00.20 -i standbyme.m4a -t 00:00:49.00 -acodec copy standbyme-cut.m4a
```
