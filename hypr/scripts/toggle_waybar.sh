if pidof waybar; then
	killall waybar
else
	setsid waybar
fi
