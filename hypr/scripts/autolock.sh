swayidle -w \
	timeout 600 '/home/mirsahebali/.config/hypr/scripts/lock.sh' \
	timeout 1200 'swaymsg "output * dpms off"' \
	resume 'swaymsg "output * dpms on"' \
	before-sleep '/home/mirsahebali/.config/hypr/scripts/lock.sh'
