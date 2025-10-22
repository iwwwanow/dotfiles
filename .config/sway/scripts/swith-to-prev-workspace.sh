#!/bin/bash

current_workspace=$(swaymsg -t get_workspaces | jq '.[] | select(.focused == true) | .num')
new_workspace=$((current_workspace - 1))
swaymsg workspace $new_workspace
