#!/bin/bash
set -e

echo "bootstrapping dotfiles..."

stow -R -v -t ~ .

echo "dotfiles deployed!"
