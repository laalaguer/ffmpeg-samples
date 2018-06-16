# 0 = 90 anti-clockwise and vertical flip
# 1 = 90 clockwise
# 2 = 90 anti-clockwise
# 3 = 90 clockwise and vertical flip
ffmpeg -i in.mp4 -vf "transpose=1" -codec:a copy out.mp4
