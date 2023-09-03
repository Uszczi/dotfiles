Set-PSReadLineOption -EditMode Emacs   

Set-Alias -Name vi -Value nvim


function goUpDir { Set-Location ".." }
function goUpUpDir { Set-Location "../.." }
Set-Alias -Name .. -Value goUpDir
Set-Alias -Name ... -Value goUpUpDir

Set-Alias -Name python3 -Value py.exe
Set-Alias -Name python -Value py.exe
Set-Alias -Name python310 -Value C:\Users\mateu\AppData\Local\Programs\Python\Python310\python.exe

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
