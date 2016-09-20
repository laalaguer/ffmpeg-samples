ffmpeg -y -i 1.mp4 -i 2.mp4 -an \
-filter_complex \
"  [0][1]concat[videoout]
" \
-map "[videoout]" concact-example.mp4