#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;The idea for this module is to help with training music skills. This means basically spamming specific keys to keep a skill going without attention 
;***IDEA*** use imagesearch to automaitcally find the skill in the skills list.
;***IDEA*** Allow the user to specify which skill to train.

windowID := %1%
MsgBox, THIS IS A PAUSE