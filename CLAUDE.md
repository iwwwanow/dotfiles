# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles managed with **GNU Stow**. Running `./scripts/bootstrap.sh` deploys all configs as symlinks into `~` using `stow -R -v -t ~`.

## Deployment

```bash
# Deploy all dotfiles
./scripts/bootstrap.sh

# Deploy manually (from repo root)
stow -R -v -t ~ .

# Set zsh as default shell (first-time setup)
chsh -s $(which zsh)
```

## Stow Ignore Rules

Files/dirs excluded from symlinking (not deployed to `~`):
- `cron/`, `docs/`, `scripts/`, `packages/` — tooling/meta, not user config
- `.git`, `.gitignore`, `README.*` — repo housekeeping

These exclusions live in `.stow-local-ignore`. Adding new meta directories requires updating this file.

## Sync Services

`scripts/setup-git-sync-service.sh` installs a systemd service that runs `git-sync-on-inotify` for a given repo. Three pre-configured setups:

```bash
./scripts/setup-all-sync.sh          # dotfiles + passwords + notes
./scripts/setup-dotfiles-sync.sh     # this repo only
```

Requires `GITHUB_SYNC_TOKEN` set in `~/.zshrc.local`. Commits are GPG-signed.

## Architecture

### Shell (`.zshrc`)
- Oh My Zsh with plugins: git, zsh-autosuggestions, zsh-syntax-highlighting
- Pure prompt from `.zsh/pure/`
- Machine-local overrides in `~/.zshrc.local` (not tracked)
- PATH entries for: NVM, Bun, RVM, Cargo, SDKMAN, Android SDK, Go, PNPM, Homebrew

### Neovim (`.config/nvim/`)
- Plugin manager: **Lazy.nvim** (bootstrapped in `init.lua`)
- Plugin list: `lua/plugins/init.lua` (~40 plugins)
- Keymaps split by concern: `lua/keymaps/{core,oil,telescope,lsp,utils}.lua`
- LSP config: `lua/plugins/lsp/` (capabilities, diagnostics, server configs, mason setup)
- Theme system: `lua/plugins/theme/` (monochrome.nvim, coolgray light)
- Formatters via conform.nvim: prettier, gofumpt, stylua

### Window Managers
Both Sway and Hyprland use modular include-based configs:

**Sway** (`.config/sway/`): `config` sources `configs/`, `keymaps/`, `styles/` subdirs
**Hyprland** (`.config/hypr/`): `hyprland.conf` sources `constants/`, `config/`, `keymaps/` subdirs

### Waybar (`.config/waybar/`)
- `config` — JSON5 format with custom modules: timew (time tracking), recorder, workspaces
- `scripts/timew.sh` — Timewarrior integration script
- `scripts/recorder-icon-processor.mjs` — Screen recording status (Node.js)

### Git (`.gitconfig`)
- Default editor: nvim
- GPG signing enabled
- Push defaults: current branch with auto-setup remote
