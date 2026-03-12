#!/bin/bash
set -e

SERVICE_NAME="$1"
REPO_PATH="$2"
GITHUB_REPO="$3"
SSH_KEY_FILE="$4"

if [ -z "$SERVICE_NAME" ] || [ -z "$REPO_PATH" ] || [ -z "$GITHUB_REPO" ]; then
    echo "Usage: $0 <service-name> <repo-path> <github-repo> [ssh-key-file]"
    echo "Example: $0 dotfiles ~/dotfiles iwwwanow/dotfiles"
    echo "Example: $0 dotfiles ~/dotfiles iwwwanow/dotfiles ~/.ssh/git-sync-dotfiles"
    exit 1
fi

echo "Setting up $SERVICE_NAME-sync service..."

DOTFILES_ROOT=$(cd "$(dirname "$0")/.." && pwd)

if [ ! -f /usr/local/bin/git-sync ]; then
    echo "📦 Installing git-sync..."
    sudo cp "$DOTFILES_ROOT/packages/git-sync/git-sync" /usr/local/bin/
    sudo chmod +x /usr/local/bin/git-sync
fi

echo "🔧 Configuring repository: $REPO_PATH"
cd "$REPO_PATH"

if [ -n "$SSH_KEY_FILE" ]; then
    SSH_HOST="github-${SERVICE_NAME}"
    SSH_CONFIG="$HOME/.ssh/config"

    if ! grep -q "Host $SSH_HOST" "$SSH_CONFIG" 2>/dev/null; then
        echo "🔧 Adding SSH config entry for $SSH_HOST..."
        cat >> "$SSH_CONFIG" <<SSHEOF

Host $SSH_HOST
  HostName github.com
  User git
  IdentityFile $SSH_KEY_FILE
  IdentitiesOnly yes
SSHEOF
    fi

    git remote set-url origin git@${SSH_HOST}:${GITHUB_REPO}.git
else
    if [ -f ~/.zshrc.local ]; then
        source ~/.zshrc.local
    fi

    if [ -z "$GITHUB_SYNC_TOKEN" ]; then
        echo "❌ GITHUB_SYNC_TOKEN is not set"
        echo "Please create ~/.zshrc.local with:"
        echo "export GITHUB_SYNC_TOKEN=\"ghp_xxx\""
        exit 1
    fi

    git remote set-url origin https://${GITHUB_SYNC_TOKEN}@github.com/${GITHUB_REPO}.git
fi

GIT_SYNC_SCRIPT="$DOTFILES_ROOT/packages/git-sync/contrib/git-sync-on-inotify"

echo "🔐 Configuring GPG signing..."
git config user.name "git-sync-bot"
git config user.email "iwwwanow.work@yandex.ru"
git config user.signingkey C619DE94CFC940FA46B284C759EC6299C890B405
git config commit.gpgsign true
git config --bool branch.master.sync true
git config --bool branch.master.syncNewFiles true

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
