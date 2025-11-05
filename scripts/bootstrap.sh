#!/bin/bash
set -e

echo "🚀 Bootstrapping dotfiles..."

stow -R -v -t ~ .

echo "✅ Dotfiles deployed!"
