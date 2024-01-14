runOrKill() {
	if [[ $1 ]]; then
		setsid emacsclient -cn "$1"
	else
		echo || return
	fi
}

runOrKill "$@"
