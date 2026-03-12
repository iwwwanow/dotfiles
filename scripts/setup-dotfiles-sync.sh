#!/bin/bash
set -e

SSH_KEY="$HOME/.ssh/git-sync-dotfiles"

if [ ! -f "$SSH_KEY" ]; then
    echo "🔑 Generating SSH deploy key..."
    ssh-keygen -t ed25519 -f "$SSH_KEY" -N "" -C "git-sync-dotfiles@$(hostname)"
    echo ""
    echo "⚠️  Add this deploy key to GitHub repo Settings → Deploy keys (with write access):"
    echo ""
    cat "${SSH_KEY}.pub"
    echo ""
    read -p "Press Enter once you've added the key to GitHub..."
else
    echo "✅ SSH key already exists: $SSH_KEY"
fi

$(dirname "$0")/setup-git-sync-service.sh dotfiles ~/Projects/iwwwanow_dotfiles iwwwanow/dotfiles "$SSH_KEY"
