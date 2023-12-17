if pgrep xfce4-panel; then
	pkill -f xfce4-panel
else
	xfce4-panel &
fi
