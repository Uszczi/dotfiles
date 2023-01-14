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


;;^W:: {
;;Send("^{Backspace}")
;;Return
;;}
