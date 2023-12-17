if [ "$(brightnessctl get)" -le 1920 ]; then
	return
else
	brightnessctl set 10%-
fi
