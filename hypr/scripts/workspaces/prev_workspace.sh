number=$(hyprctl activeworkspace | grep "workspace ID" | awk '{print $3}')
prev=$((number - 1))

if [ $prev -le 0 ]; then
	echo
else
	hyprctl dispatch workspace $prev
	hyprctl notify 2 500 "rgb(ff1ea3)" "Workspace: $prev"
fi
