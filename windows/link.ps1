if (Test-Path "C:\Users\mateu\.glzr\") {
    rm "C:\Users\mateu\.glzr\"
}

New-Item -ItemType SymbolicLink -Target "C:\Users\mateu\dotfiles\windows\env\.glzr" -Path "C:\Users\mateu\.glzr"

New-Item -ItemType Directory -Path "C:\Users\mateu\Documents\WindowsPowerShell" -Force | Out-Null
if (Test-Path "C:\Users\mateu\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1") {
    rm "C:\Users\mateu\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
}
New-Item -ItemType SymbolicLink -Target "C:\Users\mateu\dotfiles\windows\env\powershell\Microsoft.PowerShell_profile.ps1" -Path "C:\Users\mateu\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
