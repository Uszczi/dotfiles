#SingleInstance Force

^#!r::Reload

#w:: {
  WinClose("A")
}

#Enter:: {
RunWait('wt.exe -p "Windows PowerShell"')
}

#+Enter:: {
  RunWait("wt C:\Windows\system32\wsl.exe -d Ubuntu")
}

#q:: {
  RunWait("powershell ~\dotfiles\windows\bluetooh_headphones.ps1",,"Hide")
}

