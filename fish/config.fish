function fish_mode_prompt
end

function fish_right_prompt
end

function fish_greeting
end

set -gx EDITOR nvim
set -gx VISUAL nvim

# path
fish_add_path ~/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/go/bin
fish_add_path ~/neovim/bin
fish_add_path ~/dotfiles/path-utils
fish_add_path ~/dotfiles/dotfiles-private/bin
fish_add_path /usr/local/go/bin
fish_add_path ~/BurpSuiteCommunity
fish_add_path ~/src/xpdf-tools-linux-4.04/bin64


###
set -gx VIRTUAL_ENV_DISABLE_PROMPT false
set -ge _OLD_FISH_PROMPT_OVERRIDE
set -ge _OLD_VIRTUAL_PYTHONHOME
set -ge _OLD_VIRTUAL_PATH
####

#### Load functions that have to run automatically.
. ~/.config/fish/functions/autoenv.fish


### nnn
alias nnn "nnn -eH"
# alias ls "nnn -edH"
set --export NNN_FIFO "/tmp/nnn.info"
set -gx NNN_PLUG "p:preview-tui;i:imgview;f:fzopen"

function n --wraps nnn --description 'support nnn quit and change directory'
    if test -n "$NNNLVL"
        if [ (expr $NNNLVL + 0) -ge 1 ]
            echo "nnn is already running"
            return
        end
    end

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "-x" from both lines below,
    # without changing the paths.
    if test -n "$XDG_CONFIG_HOME"
        set NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    else
        set NNN_TMPFILE "$HOME/.config/nnn/.lastd"
    end

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn $argv

    if test -e $NNN_TMPFILE
        source $NNN_TMPFILE
        rm $NNN_TMPFILE
    end
end

function rga-fzf
    set RG_PREFIX 'rga --files-with-matches'
    if test (count $argv) -gt 1
        set RG_PREFIX "$RG_PREFIX $argv[1..-2]"
    end
    set -l file $file
    set file (
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$argv[-1]'" \
        fzf --sort \
            --preview='test ! -z {} && \
                rga --pretty --context 5 {q} {}' \
            --phony -q "$argv[-1]" \
            --bind "change:reload:$RG_PREFIX {q}" \
            --preview-window='50%:wrap'
    ) && echo "opening $file" && nvim "$file"
end

thefuck --alias | source

alias anki="~/src/anki-2.1.54-linux-qt6/anki"

bind \cbf ~/dotfiles/scripts/tmux-sessionizer.sh
bind \cbe ~/dotfiles/scripts/tmux-sessionizer-git-worktree.sh

#### Aliases
alias ..="cd .."
alias ...="cd ../.."

alias ls="exa -la"
alias la="exa -la"
alias ll="exa -la"

alias ve="source .env_fish"
alias vv=". ./.venv/bin/activate.fish & set VIRTUAL_ENV ".venv""
alias va="ve; vv"

alias vi="nvim"
alias emacs="emacsclient -c -a emacs"
alias fd="fdfind"
alias pa="autoflake --in-place --recursive --remove-all-unused-imports --ignore-init-module-imports --remove-duplicate-keys --remove-unused-variables"
alias lg="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(red)%h%C(r) —— %C(bold blue)%an%C(r): %C(white)%s%C(r) %C(dim white) %C(bold green)(%ar)%C(r) %C(bold yellow)%d%C(r)' --all"
alias icat="/home/mateusz/.local/kitty.app/bin/kitty +kitten icat"
alias kittydiff="/home/mateusz/.local/kitty.app/bin/kitty +kitten diff"

# WSL
alias wsln="/mnt/c/MinGW/bin/wsl-notify-send.exe "



function switch_make
    set -l cmd (commandline -b)
    if string match -r "make scrape" "$cmd" &>/dev/null
        fish_commandline_prepend "make scrape"
        fish_commandline_prepend "make deploy"

    else if string match -r "make deploy" "$cmd" &>/dev/null
        fish_commandline_prepend "make deploy"
        fish_commandline_prepend "make scrape"
    else
        fish_commandline_prepend "make scrape"
    end

end

bind \eq switch_make

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source

# Docker
alias docker-compose "docker compose"
