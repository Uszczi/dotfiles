oh-my-posh init pwsh --config ~/dotfiles/windows/oh-my-posh-theme.omp.json | Invoke-Expression

Set-Alias -Name vi -Value nvim


function goUpDir { Set-Location ".." }
function goUpUpDir { Set-Location "../.." }
Set-Alias -Name .. -Value goUpDir
Set-Alias -Name ... -Value goUpUpDir
