[[ $- != *i* ]] && return

#### Aliases
alias ..="cd .."
alias ...="cd ../.."
alias sd="cd ~ && cd (find * -type d | fzf)"

alias gs="git status"
alias gc="git commit"

alias ls="exa"
alias la="exa -la"
alias ll="exa -la"

alias dc="docker compose"
alias fd="fdfind"

alias nvim-big="nvim -u $HOME/dotfiles/nvim/large-file.vim"
####

export PATH="~/.local/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/dotfiles/tools:$PATH"
export PATH="$HOME/dotfiles/dotfiles-private/tools:$PATH"

# Bug with google chrome and todoist.
# Without that left down corner is covered by a part of app logo
export DESKTOPINTEGRATION=false

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# fnm
# export PATH="$HOME/.local/share/fnm:$PATH"
# eval "`fnm env`"

# Cargo
. "$HOME/.cargo/env"

# SSH
eval $(ssh-agent) > /dev/null
ssh-add ~/.ssh/bitbucket_work 2> /dev/null
ssh-add ~/.ssh/id_ed25519 2> /dev/null

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

setxkbmap pl

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/.dotnet/tools"

xmodmap ~/.Xmodmap

fish
