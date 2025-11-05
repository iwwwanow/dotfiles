#!/bin/bash
set -e

echo "Setting up all git-sync services..."

$(dirname "$0")/setup-dotfiles-sync.sh
echo "---"
$(dirname "$0")/setup-git-sync-service.sh pass ~/.password-store iwwwanow/pass

echo "All sync services installed!"
echo "Check status: systemctl status dotfiles-sync pass-sync"
