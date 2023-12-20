#! /usr/bin/env bash

echo "cloning nvim config..."

git clone git@github.com:mirsahebali/emacs_config.git ~/.config/emacs

echo "cloning nvim config..."

git clone git@github.com:mirsahebali/LazyVim.git ~/.config/nvim

linkConfigs=(alacritty xfce4 awesome rofi tmux hypr walpapers dunst kitty picom swaylock waybar redshift)

for arr in "${linkConfigs[@]}"; do

	ln -s "$HOME"/dots/"$arr" "$HOME"/.config/

done
