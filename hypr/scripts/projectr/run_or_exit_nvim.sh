run() {
	if [[ $1 ]]; then
		input="$1"
		project_directory="$(echo "$input" | awk '{print $NF}')"
		# session_name="$(echo "$input" | awk '{$NF="";$1=""; print $0 }')"
		IFS="/"

		newarr=$project_directory

		last_idx="$((${#newarr[@]} - 1))"

		kitty --working-directory "$HOME/$project_directory" --execute tmuxinator "${newarr[$last_idx]}"
	else
		echo "$1" error
		echo || return
	fi
}
run "$*"
