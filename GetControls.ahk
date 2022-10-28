#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

F1::
WinActivate, Mabinogi
Sleep 1000
winGet, cList, ControlList, A
Tooltip, The following controls are found...`n%cList%
Sleep 10000
Tooltip,
return
