function g  { git @args }
function gs { git status @args }
function ga { git add @args }
function gc { git commit @args }
function gp { git push @args }
function gl { git log --oneline -10 @args }
function gd { git diff @args }

function ..  { Set-Location .. }
function ... { Set-Location ../.. }

function ll { Get-ChildItem -Force @args }
function la { Get-ChildItem -Force -Hidden @args }

function Reload-Profile { . $PROFILE }

function n { nvim @args }
function cc { opencode @args }
