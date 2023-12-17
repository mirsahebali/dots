if pgrep xfce4-panel; then
	killall -9 xfce4-panel
else
	xfce4-panel &
fi

if pgrep polybar; then
	killall -9 polybar
else
	polybar &
fi
