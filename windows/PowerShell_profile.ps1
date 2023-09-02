Set-PSReadLineOption -EditMode Emacs   

Set-Alias -Name vi -Value nvim


function goUpDir { Set-Location ".." }
function goUpUpDir { Set-Location "../.." }
Set-Alias -Name .. -Value goUpDir
Set-Alias -Name ... -Value goUpUpDir

Set-Alias -Name python3 -Value py.exe
Set-Alias -Name python -Value py.exe
Set-Alias -Name python310 -Value C:\Users\mateu\AppData\Local\Programs\Python\Python310\python.exe
