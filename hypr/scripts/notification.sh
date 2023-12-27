#!/usr/bin/env sh

ICON_FOLDER="/usr/share/icons/ePapirus/16x16/actions/"

if pgrep kdeconnectd; then
    killall kdeconnectd
    killall kdeconnect-indicator
    dunstify "Phone Notification Disabled" -t 2000 -a "KDE Connect"
else
    /usr/lib/kdeconnectd
    kdeconnect-indicator
    dunstify "Phone Notification Enabled" -t 2000 -a "KDE Connect"
fi
