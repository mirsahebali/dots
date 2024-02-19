# hyprctl notify 2 5000 "rgb(89B4FA)" " $(date | awk '{$4=""; print $0}')  $(date | awk '{print $4}')"
hyprctl notify 2 5000 "rgb(89B4FA)" "$(when)"
