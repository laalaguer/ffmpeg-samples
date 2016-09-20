## Functions

`split.sh` --> chop videos into parts, every 600 seconds.

`reverse-example.sh` --> split video into two identical streams, reverse one stream, then blend the normal
one and reversed time one with a blend filter into same screen.

`motion-speed-example.sh` --> chop the video into 3 parts, mutate the part into fast speed and slow speed. Then concat together.

`left-right.sh` --> let the first movie transition to second movie by left-erase-to-right motion.

`crossfade2.sh` --> let the first movie transition to the second movie by crossfade. ( we cut the last 1 second and first 1 second of the two movies, then let them have fade effect on alpha channel. Blend the 2 seconds into 1 second as the transition part. Then cancat the first video, transition, and second video together)

`concat-example.sh` --> input two videos and concat them together

`blend-example.sh`--> a higher level demonstration with left-right transition. You can write your own fomular to decide the erase speed.

`add_subtitle.sh` --> muxing the video+audio stream with `srt` subtitle stream to create a subtitled video.
