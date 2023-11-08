sudo modprobe v4l2loopback video_nr=4,5 card_label="obs virtual cam","droidcam"

droidcam -dev=/dev/video5
