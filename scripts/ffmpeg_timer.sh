print_usage(){
    echo "usage: ffmpeg_timer.sh [HH:MM:SS.xxx] [HH:MM:SS.xxx]"
}
if [[ $# -ne 2 ]]; then
    print_usage
    exit 1
fi

W=960
H=125
fsize=150
opacity=0.5
fps=30

ffmpeg \
-r ${fps} \
-f lavfi \
-i color=black@${opacity}:s=${W}x${H},format=rgba \
-ss $1 \
-to $2 \
-vf "drawtext=\
:text='%{pts\:hms}'\
:fontcolor=white\
:fontsize=${fsize}\
:x=(w-tw)/2\
:y=(h-th)/2" \
-vcodec prores_ks \
"${1//[\:\.]/_}"_"${2//[\:\.]/_}".mov

ffmpeg \
-r 100 \
-f lavfi \
-i color=black@${opacity}:s=${W}x${H},format=rgba \
-ss $1 \
-frames 1 \
-vf "drawtext=\
:text='%{pts\:hms}'\
:fontcolor=white\
:fontsize=${fsize}\
:x=(w-tw)/2\
:y=(h-th)/2" \
%01d.png

mv 1.png ${1//[\:\.]/_}.png

ffmpeg \
-r 100 \
-f lavfi \
-i color=black@${opacity}:s=${W}x${H},format=rgba \
-ss $2 \
-frames 1 \
-vf "drawtext=\
:text='%{pts\:hms}'\
:fontcolor=white\
:fontsize=${fsize}\
:x=(w-tw)/2\
:y=(h-th)/2" \
%01d.png

mv 1.png ${2//[\:\.]/_}.png

#https://www.rickmakes.com/ffmpeg-notes/

#normal background
#https://www.youtube.com/watch?v=aC6GDbeQsY0
#https://www.rickmakes.com/creating-an-elapsed-timer-using-ffmpeg/

#View Timer
#ffplay -f lavfi -i color=c=black:s=240x96 -ss 00:00:00 -t 00:48:00 -vf "drawtext=fontfile=/System/Library/Fonts/Monaco.dfont:text='%{pts\:gmtime\:0\:%M\\\\\:%S}':fontcolor=white:fontsize=64:x=(w-tw)/2:y=(h-th)/2:box=1:boxcolor=green@0.5:boxborderw=10,format=yuv420p"

#Save as File
#ffmpeg -f lavfi -i color=c=black:s=240x96 -ss 00:00:00 -t 00:48:00 -vf "drawtext=fontfile=/System/Library/Fonts/Monaco.dfont:text='%{pts\:gmtime\:0\:%M\\\\\:%S}':fontcolor=white:fontsize=64:x=(w-tw)/2:y=(h-th)/2:box=1:boxcolor=green@0.5:boxborderw=10,format=yuv420p" timer.mp4

#transparent background
#https://www.youtube.com/watch?v=jbpGv_VO69w&t=24s
#https://www.rickmakes.com/creating-an-elapsed-timer-with-transparent-background-using-ffmpeg/

#Create Timer with Transparent Background (Apple ProRes codec, prores_ks)
#ffmpeg -f lavfi -i color=white@0.0:s=240x96,format=rgba -ss 00:00:00 -t 00:48:00 -vf "drawtext=fontfile=/System/Library/Fonts/Monaco.dfont:text='%{pts\:gmtime\:0\:%M\\\\\:%S}':fontcolor=white:fontsize=64:x=(w-tw)/2:y=(h-th)/2" -vcodec prores_ks timer_prores.mov

#Create Timer with Transparent Background (Apple Animation Codec, qtrle)
#ffmpeg -f lavfi -i color=white@0.0:s=240x96,format=rgba -ss 00:00:00 -t 00:48:00 -vf "drawtext=fontfile=/System/Library/Fonts/Monaco.dfont:text='%{pts\:gmtime\:0\:%M\\\\\:%S}':fontcolor=white:fontsize=64:x=(w-tw)/2:y=(h-th)/2" -vcodec qtrle timer_qtrle.mov
