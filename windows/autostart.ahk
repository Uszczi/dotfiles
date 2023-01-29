#SingleInstance Force

^#!r::Reload

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

#t:: {
  WinSetStyle("^0xC00000", "A")
  MsgBox("ttt", "asdfsdf")
}

toggleViewWindow(regex) {
  SetTitleMatchMode "RegEx"
  UniqueID := WinActive(regex)

  if (UniqueID == 0) {
    WinShow(regex)
    WinActivate(regex)
  } else {
    WinHide(UniqueID)
  }
}

#8:: {
  toggleViewWindow(".* Todoist")
}

#9:: {
  toggleViewWindow(".*- Obsidian v.*")
}
