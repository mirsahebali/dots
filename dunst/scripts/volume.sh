ICON_FOLDER="/usr/share/icons/ePapirus/16x16/actions/"

low="$ICON_FOLDER/audio-volume-low.svg"
high="$ICON_FOLDER/audio-volume-high.svg"
medium="$ICON_FOLDER/audio-volume-medium.svg"
muted="$ICON_FOLDER/audio-volume-muted.svg"

send_notification() {
	volume="$(pamixer --get-volume)"
	dunstify -a "Change Volume" -u low -r 9993 -h int:value:"$volume" -i "$2" "Volume: ${volume}" -t 2000
}

case "$1" in
up)
	pamixer -u
	pamixer -i 5 --allow-boost
	send_notification $1 $high
	;;
down)
	pamixer -u
	pamixer -d 5 --allow-boost
	send_notification $1 $low
	;;
mute)
	pamixer -t

	if $(pamixer --get-mute); then
		dunstify -i $muted -a "changevolume" -t 2000 -r 9993 -u low "Muted"
	else
		send_notification up $high
	fi
	;;
esac
