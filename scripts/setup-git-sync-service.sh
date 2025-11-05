#!/bin/bash
set -e

SERVICE_NAME="$1"
REPO_PATH="$2"
GITHUB_REPO="$3"

if [ -z "$SERVICE_NAME" ] || [ -z "$REPO_PATH" ] || [ -z "$GITHUB_REPO" ]; then
    echo "Usage: $0 <service-name> <repo-path> <github-repo>"
    echo "Example: $0 dotfiles ~/dotfiles iwwwanow/dotfiles"
    exit 1
fi

echo "Setting up $SERVICE_NAME-sync service..."

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

if [ -z "$GITHUB_SYNC_TOKEN" ]; then
    echo "❌ GITHUB_SYNC_TOKEN is not set"
    echo "Please create ~/.zshrc.local with:"
    echo "export GITHUB_SYNC_TOKEN=\"ghp_xxx\""
    exit 1
fi

if [ ! -f /usr/local/bin/git-sync ]; then
    echo "📦 Installing git-sync..."
    sudo cp $(dirname "$0")/../packages/git-sync/git-sync /usr/local/bin/
    sudo chmod +x /usr/local/bin/git-sync
fi

echo "🔧 Configuring repository: $REPO_PATH"
cd "$REPO_PATH"
git remote set-url origin https://${GITHUB_SYNC_TOKEN}@github.com/${GITHUB_REPO}.git

echo "🔐 Configuring GPG signing..."
cd "$REPO_PATH"
git config user.name "git-sync-bot"
git config user.email "username@users.noreply.github.com"
git config user.signingkey F29D1461EFA65DF9E766150591D3F7A0888109A5
git config commit.gpgsign true
git config --bool branch.master.sync true
git config --bool branch.master.syncNewFiles true

SCRIPT_DIR=$(cd "$(dirname "$0")/.." && pwd)
GIT_SYNC_SCRIPT="$SCRIPT_DIR/packages/git-sync/contrib/git-sync-on-inotify"

echo "Creating systemd service: ${SERVICE_NAME}-sync"
sudo tee /etc/systemd/system/${SERVICE_NAME}-sync.service > /dev/null <<EOF
[Unit]
Description=Git Sync for ${SERVICE_NAME}
After=network.target

[Service]
Type=simple
User=$USER
Group=$USER
WorkingDirectory=$REPO_PATH
ExecStart=$GIT_SYNC_SCRIPT
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable ${SERVICE_NAME}-sync
sudo systemctl start ${SERVICE_NAME}-sync

echo "${SERVICE_NAME}-sync service installed and started"
echo "Monitoring: $REPO_PATH"
echo "Check status: systemctl status ${SERVICE_NAME}-sync"
