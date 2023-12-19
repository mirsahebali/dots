#! /usr/bin/env bash

sudo pacman -S --needed base-devel

git clone https://aur.archlinux.org/yay.git

cd ~/yay || echo

makepkg -si

sudo pacman -s git clang neovim gvim emacs curl \
	iwd networkmanager fd ripgrep fzf tmux hyprpaper \
	nodejs npm python go rust kitty alacritty wlroots zsh \
	kvantum qt6ct qt6ct waybar rofi xterm wayland wl-mirror wev \
	v4l2loopback-dkms v4l-utils tree-sitter tree-sitter-cli qt6-wayland \
	qt5-wayland polkit polkit-gnome pam pamixer pambase openssh nm-connection-editor \
	ninja lxappearance linux-headers hyprpicker gtk3 \
	gtk2 dolphin dkms dbus bluedevil base \
	autorandr arandr alligator sddm okular network-manager-applet ncurses figlet

yay -S hyprland-git gopls goimports gofumpt yank wireplumber \
	unzip swaybg swaync rustywind hyprpicker brave-bin \
	ttf-apple-emoji ttf-nerd-fonts-symbols-common ttf-jetbrains-mono-nerd \
	goimports-reviser go-impl nwg-look-bin redshift-wayland-git \
	dracula-gtk-theme dracula-icons-git wayclip cliphist fluent-reader \
	hyprpicker tmuxinator bibata-cursor-theme ark-gtk-theme

cd ~ || echo

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

mkdir ~/bin

curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin
