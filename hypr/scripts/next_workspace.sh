number=$(hyprctl activeworkspace | grep "workspace ID" | awk '{print $3}')
next=$((number + 1))
if [ $next -gt 9 ]; then
	echo
else
	hyprctl dispatch workspace $next
fi
