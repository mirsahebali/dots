cat /home/mirsahebali/dots/projects.txt | wofi --dmenu | awk '{print $(NF)}' | xargs zsh ~/.config/hypr/scripts/run_or_exit_nvim.sh

