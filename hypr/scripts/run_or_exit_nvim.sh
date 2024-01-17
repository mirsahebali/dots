home="$HOME"

runOrKill() {
	if [[ $1 ]]; then
		alacritty --working-directory "$home/$1" -e tmux -c "nvim ."
	else
		echo || return
	fi
}

runOrKill "$@"
