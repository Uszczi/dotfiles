@echo off
:: To enable this script open regedit
:: Go to: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor
:: Create String Value with name `AutoRun` and path `%USERPROFILE%\dotfiles\windows\keybindings.cmd`

::
DOSKEY ls=dir $*

:: Text editor
DOSKEY vi=nvim $*
