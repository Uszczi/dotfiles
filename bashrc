[[ $- != *i* ]] && return

#### Aliases
alias ..="cd .."
alias ...="cd ../.."
alias sd="cd ~ && cd (find * -type d | fzf)"

alias gs="git status"
alias gc="git commit"

alias ls="eza"
alias la="eza -la"
alias ll="eza -la"

alias dc="docker compose"
alias fd="fdfind"

alias nvim-big="nvim -u $HOME/dotfiles/nvim/large-file.vim"

####

export PATH="~/.local/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/dotfiles/tools:$PATH"
export PATH="$HOME/dotfiles/dotfiles-private/tools:$PATH"

alias brightnesscli="sudo $HOME/dotfiles/tools/brightness-cli"
alias br="sudo $HOME/dotfiles/tools/brightness-cli"

alias brightnesscli="sudo $HOME/dotfiles/tools/brightness-cli"
alias br2="sudo $HOME/dotfiles/tools/brightness-cli"
# Bug with google chrome and todoist.
# Without that left down corner is covered by a part of app logo
export DESKTOPINTEGRATION=false

# fnm
FNM_PATH="/home/mat/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# SSH
eval $(ssh-agent) > /dev/null
ssh-add ~/.ssh/bitbucket_work 2> /dev/null
ssh-add ~/.ssh/id_ed25519 2> /dev/null

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/.dotnet/tools"

# xmodmap ~/.Xmodmap

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

fish
