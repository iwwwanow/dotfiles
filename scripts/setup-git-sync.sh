#!/bin/bash
set -e

echo "Setting up dotfiles-sync.service"

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

if [ -z "$GITHUB_SYNC_TOKEN" ]; then
    echo "❌ GITHUB_SYNC_TOKEN is not set"
    echo "Please create ~/.zshrc.local with:"
    echo "export GITHUB_SYNC_TOKEN=\"ghp_xxx\""
    exit 1
fi

sudo cp $(pwd)/packages/git-sync/git-sync /usr/local/bin/
sudo chmod +x /usr/local/bin/git-sync

git remote set-url origin https://${GITHUB_SYNC_TOKEN}@github.com/iwwwanow/dotfiles.git

sudo tee /etc/systemd/system/dotfiles-sync.service > /dev/null <<EOF
[Unit]
Description=Git Sync with Inotify
After=network.target

[Service]
Type=simple
User=$USER
Group=$USER
WorkingDirectory=$HOME/dotfiles
ExecStart=$(pwd)/packages/git-sync/contrib/git-sync-on-inotify
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

# Включаем и запускаем
sudo systemctl daemon-reload
sudo systemctl enable dotfiles-sync
sudo systemctl start dotfiles-sync

echo "✅ dotfiles-sync.service installed and started"
echo "📁 Monitoring: $HOME/.password-store"
echo "🔄 Check status: systemctl status dotfiles-sync"
