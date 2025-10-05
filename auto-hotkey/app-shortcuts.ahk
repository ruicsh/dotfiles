#Requires AutoHotkey v2.0

; INSTALL
; 1. winget install AutoHotkey.AutoHotkey --scope=user
; 2. Save this file as app-shortcuts.ahk in ~/.config/auto-hotkey/
; 3. Create a shortcut of this file 
; 4. Open Run dialog (Win+R), type shell:startup, and press Enter
; 5. Move the shortcut created in 3. to the opened folder

; CONFIGURATION
CHAT_APP := "teams"

; SHORTCUTS
^1::OpenOrActivateApp("msedge.exe", "ahk_exe msedge.exe", "Edge")
^2::OpenOrActivateApp("wt.exe", "ahk_exe WindowsTerminal.exe", "Terminal")
^3::OpenChatApp()
^4::OpenOutlook()
^+m::Run("wt.exe -- `"C:\Program Files\Git\bin\bash.exe`" -c `"~/.scripts/bookmarks.sh`"")

; Chat application configurations
ChatApps := Map(
  "teams", {exe: "ms-teams.exe", exist: "ahk_exe ms-teams.exe", winTitle: "Microsoft Teams"},
  "slack", {exe: "slack.exe", exist: "ahk_exe slack.exe", winTitle: "Slack"},
  "symphony", {exe: "Symphony.exe", exist: "ahk_exe Symphony.exe", winTitle: "Symphony"}
)

; HELPERS
OpenOrActivateApp(exe, exist, winTitle) {
  if WinExist(exist) {
    WinActivate
  } else {
    Run exe
    WinWaitActive(winTitle)
    WinMaximize(winTitle)
  }
}

OpenChatApp() {
  if ChatApps.Has(CHAT_APP) {
    app := ChatApps[CHAT_APP]
    OpenOrActivateApp(app.exe, app.exist, app.winTitle)
  } else {
    MsgBox("Chat application not configured correctly.")
  }
}

OpenOutlook() {
  outlook := FindOutlookExe()
  OpenOrActivateApp(outlook.exe, outlook.exist, "Outlook")
}

FindOutlookExe() {
  ; Common Outlook executable names to check
  outlookExes := ["OUTLOOK.EXE", "olk.exe"]

  for exe in outlookExes {
    ; Check if process is running
    if ProcessExist(exe) {
      return { exe: exe, exist: "ahk_exe " . exe }
    }
  }

  ; If not running, check common installation paths
  officePaths := [
    "C:\Program Files\Microsoft Office\root\Office16\",
    "C:\Program Files (x86)\Microsoft Office\root\Office16\",
    "C:\Program Files\Microsoft Office\Office16\",
    "C:\Program Files (x86)\Microsoft Office\Office16\",
  ]
  
  for path in officePaths {
    for exe in outlookExes {
      fullPath := path . exe
      if FileExist(fullPath) {
        return { exe: fullPath, exist: "ahk_exe " . exe }
      }
    }
  }
  
  ; Default fallback
  return { exe: "olk.exe", exist: "ahk_exe olk.exe" }
}
