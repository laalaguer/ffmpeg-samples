ffmpeg -i coffe-beans-origin.mp4 \
-filter_complex \
"split [main][tmp];
[tmp] reverse [reversed];
[main]fifo[mainfifo];
[reversed]fifo[reversedfifo];
[mainfifo][reversedfifo]blend=all_expr='if(gte(X,W*T/20),A,B)'" reversed.mp4

# reverse --> a filter to reverse the video, use with caution: too long can cause memory explode.
