export PATH="/home/operator/.local/bin:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec Hyprland
fi

export XDG_PICTURES_DIR="/home/operator/Pictures"
