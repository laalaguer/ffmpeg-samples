ffmpeg -i source_video.mp4 -acodec copy -f segment -segment_time 600 -vcodec copy -reset_timestamps 1 -map 0 source_video%d.mp4
