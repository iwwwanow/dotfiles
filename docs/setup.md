# Setup on a new machine

## 1. Prerequisites

### Ubuntu
```sh
sudo apt install zsh git curl stow gpg
chsh -s $(which zsh)
```

### Arch
```sh
sudo pacman -S zsh git curl stow gnupg
chsh -s $(which zsh)
```

## 2. Clone and deploy dotfiles

```sh
git clone git@github.com:iwwwanow/dotfiles.git ~/Projects/iwwwanow_dotfiles
# или через https
# git clone https://github.com/iwwwanow/dotfiles.git ~/Projects/iwwwanow_dotfiles
cd ~/Projects/iwwwanow_dotfiles
./scripts/bootstrap.sh
```

## 3. Shell

### Oh My Zsh
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Plugins
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Pure prompt
```sh
mkdir -p ~/.zsh
git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure
```

## 4. Node.js

### NVM
```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install --lts
```

### Bun
```sh
curl -fsSL https://bun.sh/install | bash
```

### pnpm
```sh
curl -fsSL https://get.pnpm.io/install.sh | sh
```

## 5. Rust
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## 6. Zig + zls

Download zig from https://ziglang.org/download/ and extract to `~/Applications/zig`.

Download zls from https://github.com/zigtools/zls/releases and build or extract to `~/Applications/zls/zig-out/bin/zls`.

## 7. Neovim

### Ubuntu
```sh
sudo apt install neovim
# or download AppImage from https://github.com/neovim/neovim/releases for latest version
```

### Arch
```sh
sudo pacman -S neovim
```

## 8. Sway (Arch)

```sh
sudo pacman -S sway waybar swaylock swayidle
sudo pacman -S tofi dunst gammastep
```

For screenshot/screencast support:
```sh
sudo pacman -S grim slurp wf-recorder
```

## 9. Terminal (Ghostty)

Download from https://ghostty.org or build from source. Config is deployed via stow.

## 10. GPG key

Import your existing key or generate a new one:
```sh
gpg --import your-key.gpg
# or
gpg --full-generate-key
```

Get the key ID and update `.gitconfig`:
```sh
gpg --list-secret-keys --keyid-format=long
```

## 11. Git sync service (optional)

Set `GITHUB_SYNC_TOKEN` in `~/.zshrc.local`, then:
```sh
./scripts/setup-all-sync.sh
```

## Machine-specific settings

Put anything that differs between machines in `~/.zshrc.local` (not tracked in git):
- `GITHUB_SYNC_TOKEN`
- machine-specific PATH entries
- work credentials
