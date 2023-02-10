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

#+!:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe move-to-workspace 1",, "Hide")
}
#1:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe switch-to-workspace 1",, "Hide")
}

#+@:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe move-to-workspace 2",, "Hide")
}
#2:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe switch-to-workspace 2",, "Hide")
}
#+#:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe move-to-workspace 3",, "Hide")
}
#3:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe switch-to-workspace 3",, "Hide")
}
#+$:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe move-to-workspace 4",, "Hide")
}
#4:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe switch-to-workspace 4",, "Hide")
}
#+%:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe move-to-workspace 5",, "Hide")
}
#5:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe switch-to-workspace 5",, "Hide")
}
#+^:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe move-to-workspace 6",, "Hide")
}
#6:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe switch-to-workspace 6",, "Hide")
}

!o:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe debug-workspace",, "Hide")
}

#t:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe clear-workspace",, "Hide")
}
!c:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe set-layout columns",, "Hide")
}
!r:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe set-layout rows",, "Hide")
}
!n:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe set-layout next",, "Hide")
}
!p:: {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe set-layout previous",, "Hide")
}
!l:: {
  RunWait("circulate.exe focus next",, "Hide")
}
!h:: {
  RunWait("circulate.exe focus previous",, "Hide")
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

circulateID := WinExist("ahk_exe circulate.exe")
if !circulateID {
  RunWait("C:\Users\mateu\projects\circulate\circulate.exe start")
} 



