#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias ..="cd .."
alias ...="cd ../.."


# Bug with todoist app at Arch Linux
export DESKTOPINTEGRATION=false

export PATH="/home/mateusz/dotfiles/path-utils:$PATH"
export PATH="/home/mateusz/src/anki-2.1.54-linux-qt6:$PATH"
export PATH="/home/mateusz/BurpSuiteCommunity:$PATH"

fish

