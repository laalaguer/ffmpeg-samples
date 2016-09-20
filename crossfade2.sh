ffmpeg -i 1.mp4 -i 2.mp4 -an \
-filter_complex \
"   [0:v]trim=start=0:end=13.47,setpts=PTS-STARTPTS[firstclip];
    [1:v]trim=start=1,setpts=PTS-STARTPTS[secondclip];
    [0:v]trim=start=13.47:end=14.47,setpts=PTS-STARTPTS[fadeoutsrc];
    [1:v]trim=start=0:end=1,setpts=PTS-STARTPTS[fadeinsrc];
    [fadeinsrc]format=pix_fmts=yuva420p,
                fade=t=in:st=0:d=1:alpha=1[fadein];
    [fadeoutsrc]format=pix_fmts=yuva420p,
                fade=t=out:st=0:d=1:alpha=1[fadeout];
    [fadein]fifo[fadeinfifo];
    [fadeout]fifo[fadeoutfifo];
    [fadeoutfifo][fadeinfifo]overlay[crossfade];
    [firstclip][crossfade][secondclip]concat=n=3[output];
    [0:a][1:a] acrossfade=d=1 [audio]
" \
-map "[output]" -map "[audio]" result.mp4

# Other filters see blend-example.sh for reference
# format --> format the video into normal RGB space so we can use alpha channel
# fade --> a fade filter to decide alpha channel decrease or increase.
# fifo --> a buffer, you can pretend it doesn't exist.
# overlay --> simply put one video stream over another. ( a lesser filter comparing to blend filter )
