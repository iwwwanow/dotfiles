#!/bin/bash
set -e

echo "🚀 Setting up all git-sync services..."

$(dirname "$0")/setup-git-sync-service.sh dotfiles ~/dotfiles iwwwanow/dotfiles
echo "---"
$(dirname "$0")/setup-git-sync-service.sh pass ~/.password-store iwwwanow/pass
# Добавь другие репозитории по необходимости

echo "🎉 All sync services installed!"
echo "📋 Check status: systemctl status dotfiles-sync pass-sync"
