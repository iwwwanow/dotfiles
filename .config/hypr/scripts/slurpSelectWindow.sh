#!/usr/bin/env bash

# https://github.com/Gustash/Hyprshot/blob/main/hyprshot#L166

function grab_window() {
	local monitors=`hyprctl -j monitors`
	local clients=`hyprctl -j clients | jq -r '[.[] | select(.workspace.id | contains('$(echo $monitors | jq -r 'map(.activeWorkspace.id) | join(",")')'))]'`
	local boxes="$(echo $clients | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1]) \(.title)"' | cut -f1,2 -d' ')"
	slurp -r <<< "$boxes"
}

grab_window
