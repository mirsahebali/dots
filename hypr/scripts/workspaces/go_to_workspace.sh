#! /usr/bin/bash

hyprctl dispatch workspace "$*"
hyprctl notify 2 500 "rgb(ff1ea3)" "Workspace: $*"
