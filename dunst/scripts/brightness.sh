ICON_FOLDER="/usr/share/icons/ePapirus/16x16/actions/brightnesssettings.svg"

send_notification() {
	brightness="$(brightnessctl g)"
	dunstify -a "Change Brightness" -u low -r 9992 -h int:value:"$((brightness / 192))" -i $ICON_FOLDER "Brightness: $((brightness / 192)) " -t 2000
}

case "$1" in
up)
	brightnessctl set +10%
	send_notification $1
	;;
down)
	echo 2 or 3
	# Avoid going the brightness to 0
	/home/mirsahebali/.config/hypr/scripts/brightness_down.sh
	send_notification $1
	;;
*)
	echo error
	;;
esac
