linkConfigs=(alacritty emacs xfce4 awesome rofi tmux hypr walpapers dunst kitty picom swaylock waybar)

for arr in "${linkConfigs[@]}"; do

	ln -s "$HOME"/dots/"$arr" "$HOME"/.config/

done
