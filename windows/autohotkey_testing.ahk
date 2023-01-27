#SingleInstance Force

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

#7:: {
    toggleViewWindow(".* Todoist")
}