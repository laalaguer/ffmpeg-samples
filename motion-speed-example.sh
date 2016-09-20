ffmpeg -y -i coffe-beans-origin.mp4 \
-filter_complex \
"  [0]trim=start=0:duration=5[clipone];
   [0]trim=start=5:duration=10,setpts=PTS-STARTPTS[cliptwo];
   [0]trim=start=15:duration=17.5,setpts=PTS-STARTPTS[clipthree];
   [cliptwo]setpts=0.5*PTS[faster];
   [clipthree]setpts=2*PTS[slower];
   [clipone][faster][slower]concat=n=3[videoout]
" \
-map "[videoout]" motion-speed-example.mp4

# trim --> cut the video
# setpts=0.5*PTS --> make the video play faster
# setpts=2*PTS --> make the video play slower
