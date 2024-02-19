
number=$(hyprctl activeworkspace | grep "workspace ID" | awk '{print $3}')

next=$((number + 1))

if [ $next -gt 9 ]; then
	hyprctl dispatch workspace 10
	hyprctl notify 2 500 "rgb(ff1ea3)" "Workspace 10"
else
	hyprctl dispatch workspace $next
	hyprctl notify 2 500 "rgb(ff1ea3)" "Workspace: $next"
fi
