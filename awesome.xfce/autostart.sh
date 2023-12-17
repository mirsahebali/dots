#!/bin/bash

function run {
	if ! pgrep $1; then
		$@ &
	fi
}
# run dex $HOME/.config/autostart/print-applet.desktop
#run xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#run xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal
# run picom -b
# run nm-applet
#run caffeine
# run variety
# run xfce4-power-manager
# run blueberry-tray
# run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
# run dbus-update-activation-environment --all
# run gnome-keyring-daemon --start --components=secrets

# run numlockx on
# run volumeicon
run nitrogen --restore
# run killall -9 xfce4-panel
# run conky -c $HOME/.config/awesome/system-overview
# run /usr/bin/kdeconnect-indicator
# run xinput set-prop 10 317 1
# run xfce4-clipman

#you can set wallpapers in themes as well
# feh --bg-fill /usr/share/backgrounds/archlinux/arch-wallpaper.jpg &
# run feh --bg-fill /usr/share/backgrounds/arcolinux/koi-fishes-1920x1080.png &
#run applications from startup
#run firefox
#run atom
#run dropbox
#run insync start
#run spotify
#run ckb-next -b
#run discord
#run telegram-desktop
