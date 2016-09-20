ffmpeg -y -i 1.mp4 -i 2.mp4 -an \
-filter_complex \
"  [0:v]trim=start=0:end=12.47,setpts=PTS-STARTPTS[firstclip];
   [1:v]trim=start=2,setpts=PTS-STARTPTS[secondclip];
   [0:v]trim=start=12.47:end=14.47,setpts=PTS-STARTPTS[leftrightoversrc];
   [1:v]trim=start=0:end=2,setpts=PTS-STARTPTS[leftrightbacksrc];
   [leftrightoversrc][leftrightbacksrc]blend=all_expr='if(gte(X,W*T/2*T/2*T/2),A,B)'[leftrighttransition];
   [firstclip][leftrighttransition][secondclip]concat=n=3[output];
   [0:a][1:a] acrossfade=d=1 [audio]
" \
-map "[output]" -map "[audio]" left-right-erase.mp4

# 1.mp4 --> input source represented as [0]
# 2.mp4 --> input source represented as [1]
# -an --> mute the input audio ( we do it seperately )
# [0:v] --> only the [0] source video is in the operation.
# trim --> filter trim, to get part of stream
# setpts --> reset the absolute time stamp back to 0 of operated clip.
# blend --> use the blend filter to use an expression to change the transition from A to B
# concat --> cancat multiple vidoes into one video
# [0:a] only operate on the audio stream of video input [0]
# -map , -map --> map the video and audio stream into the final product.
