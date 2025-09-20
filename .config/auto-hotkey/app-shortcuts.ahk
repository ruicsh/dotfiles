#Requires AutoHotkey v2.0

; INSTALL
; 1. winget install AutoHotkey.AutoHotkey --scope=user
; 2. Save this file as app-shortcuts.ahk in ~/.config/auto-hotkey/
; 3. Create a shortcut of this file 
; 4. Open Run dialog (Win+R), type shell:startup, and press Enter
; 5. Move the shortcut created in 3. to the opened folder

OpenOrActivateApp(exe, exist, winTitle) {
  if WinExist(exist) {
    WinActivate
  } else {
    Run exe
    WinWaitActive(winTitle)
    WinMaximize(winTitle)
  }
}

^1::OpenOrActivateApp("msedge.exe", "ahk_exe msedge.exe", "Edge")
^2::OpenOrActivateApp("wt.exe", "ahk_exe WindowsTerminal.exe", "Terminal")
^3::OpenOrActivateApp("ms-teams.exe", "ahk_exe ms-teams.exe", "Microsoft Teams")
^4::OpenOrActivateApp("olk.exe", "ahk_exe olk.exe", "Outlook")

