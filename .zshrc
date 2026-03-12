export ZSH="$HOME/.oh-my-zsh"
export GPG_TTY=$(tty)

# ZSH_THEME must be empty when using an external prompt (Pure)
ZSH_THEME=""

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:$HOME/Applications/zls/zig-out/bin
export PATH="$HOME/.cargo/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# java
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))

# sdkman (must be last)
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# jetbrains
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"
[ -f "${___MY_VMOPTIONS_SHELL_FILE}" ] && source "${___MY_VMOPTIONS_SHELL_FILE}"

# aliases
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias projects="cd ~/Projects"
alias scripts="cd ~/Scripts"
alias n="nvim ."
alias gb='git -c pager.branch=false branch --sort=-committerdate --format="%(color:yellow)%(refname:short)%(color:reset) %(contents:subject) %(color:green)(%(committerdate:relative))%(color:reset)"'

# prompt (Pure)
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# local overrides (not tracked in git)
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
