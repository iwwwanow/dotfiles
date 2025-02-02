#!/bin/bash

# Получаем номер текущего рабочего пространства
current_workspace=$(swaymsg -t get_workspaces | jq '.[] | select(.focused == true) | .num')

# Увеличиваем номер на 1
new_workspace=$((current_workspace + 1))

# Переключаемся на новое рабочее пространство (создается, если не существует)
swaymsg workspace $new_workspace
