ffmpeg -i 1.mp4 -i 2.mp4 -filter_complex [0:v][1:v]overlay=x=if(lte(-w+(t)*100,w/2),-w+(t)*100,w/2):y=0[out] -map '[out]' -y left-right.mp4
# A simpler version of 'blend-example.sh'
# it only uses the overlay filter, but produce the same effect of left-to-right erase transition
