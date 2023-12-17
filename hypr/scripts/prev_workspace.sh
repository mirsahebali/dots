number=$(hyprctl activeworkspace | grep "workspace ID" | awk '{print $3}')
prev=$((number - 1))
if [ $prev -lt 0 ]; then
	echo
else
	hyprctl dispatch workspace $prev
fi
