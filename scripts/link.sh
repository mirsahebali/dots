#! /usr/bin/env bash

echo "cloning nvim config..."

git clone git@github.com:mirsahebali/LazyVim.git ~/.config/nvim

echo "select doom emacs or vanilla config"

read -r choice

case "$choice" in
1)
	echo "Selected vanilla config"

	echo "cloning emacs config..."

	git clone git@github.com:mirsahebali/emacs_config.git ~/.config/emacs

	;;
*)
	echo "Selected doom config"

	echo "Removing prexisting folders"

	rm -rf ~/.config/doom
	rm -rf ~/.config/emacs
	rm -rf ~/.emacs.d
	rm -rf ~/.doom.d

	git clone git@github.com:mirsahebali/doom.git ~/.config/doom

	git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs

	~/.config/emacs/bin/doom install

	;;
esac

linkConfigs=(alacritty xfce4 awesome rofi tmux hypr walpapers dunst kitty picom swaylock waybar redshift lf)

for arr in "${linkConfigs[@]}"; do

	ln -s "$HOME"/dots/"$arr" "$HOME"/.config/

done
