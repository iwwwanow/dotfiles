#!/bin/bash

current_workspace=$(swaymsg -t get_workspaces | jq '.[] | select(.focused == true) | .num')
new_workspace=$((current_workspace - 1))

if [ $new_workspace -lt 1 ]; then
    new_workspace=1
fi

swaymsg move container to workspace $new_workspace
swaymsg workspace $new_workspace
