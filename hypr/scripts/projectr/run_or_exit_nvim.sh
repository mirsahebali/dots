run() {
	if [[ $1 ]]; then
		input="$1"
		session_name="$(echo "$input" | awk '{print $NF}')"
		kitty --execute tmuxinator "$session_name"
	else
		echo "$1" error
		echo || return
	fi
}
run "$*"
