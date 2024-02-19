if pidof wofi;then
	echo
else
	selected="$(cat </home/mirsahebali/dots/projects.txt | wofi --dmenu)"
	/home/mirsahebali/dots/hypr/scripts/projectr/run_or_exit_nvim.sh "$selected"
fi

