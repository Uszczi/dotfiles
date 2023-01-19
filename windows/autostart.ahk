#SingleInstance Force

#w:: {
 WinClose("A")
}

#Enter:: {
 RunWait('wt.exe -p "Windows PowerShell"')
}

#+Enter:: {
 RunWait("wt.exe wt -p 'Ubuntu'")
}

#q:: {
  RunWait("powershell ~\dotfiles\windows\bluetooh_headphones.ps1",,"Hide")
}

;;^W:: {
;;Send("^{Backspace}")
;;Return
;;}
