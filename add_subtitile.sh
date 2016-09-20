ffmpeg -i 1.mp4 -f srt -i boat.srt -c:v copy -c:a copy -c:s mov_text subtitled.mp4
# 1.mp4 --> a video
# boat.srt --> srt file
# -c:v copy --> copy the source video stream codec as the output codec
# -c:a copy --> copy the source audio stream codec as the output codec
# -c:s mov_text --> use mov_text codec as the subtitle codec
# subtitled.mp4 --> the output file
