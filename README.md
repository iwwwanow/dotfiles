# dotfiles

```bash
stow -R -v -t ~ .
```

Or via bootstrap script (also sets up sync services):

```bash
./scripts/bootstrap.sh
```

Make zsh default (first time):

```bash
chsh -s $(which zsh)
```
