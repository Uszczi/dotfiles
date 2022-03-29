if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_mode_prompt
end

function fish_right_prompt
end

function fish_greeting
end

set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
set -gx PDF_OPEN_COMMAND "firefox"

#### Aliases
alias ve="source .env_fish"
alias vv=". ./.venv/bin/activate.fish & set VIRTUAL_ENV ".venv""
alias va="ve; vv"

alias vi="nvim"


alias ..="cd .."
alias ...="cd ../.."

alias ls="exa -la"
alias la="exa -la"
alias ll="exa -la"

alias emacs="emacsclient -c -a emacs"
alias fd="fdfind"

alias aa=". ./.env.fish"

# Python
alias pa="autoflake --in-place --recursive --remove-all-unused-imports --ignore-init-module-imports --remove-duplicate-keys --remove-unused-variables"
alias pi="isort"
alias pb="black"
alias pm="mypy --ignore-missing-imports"

####
alias lg="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(red)%h%C(r) —— %C(bold blue)%an%C(r): %C(white)%s%C(r) %C(dim white) %C(bold green)(%ar)%C(r) %C(bold yellow)%d%C(r)' --all"

#### Some python settings
set -gx VIRTUAL_ENV_DISABLE_PROMPT false
set -ge _OLD_FISH_PROMPT_OVERRIDE
set -ge _OLD_VIRTUAL_PYTHONHOME
set -ge _OLD_VIRTUAL_PATH
####

#### Load functions that have to run automatically.
.  ~/.config/fish/functions/autoenv.fish

fish_add_path ~/azure-functions-cli/
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/neovim/bin
