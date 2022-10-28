#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#MaxThreadsPerHotkey, 3
#UseHook, On
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;The idea for this module is to help with training music skills. This means basically spamming specific keys to keep a skill going without attention 
;***IDEA*** use imagesearch to automaitcally find the skill in the skills list.
;***IDEA*** Allow the user to specify which skill to train.

;Hotkey Declaration
Hotkey $^!s, startStopSpam


;Sets the window ID to the ID that was selected in the main script, ideally the mabinogi window
windowID := %0%
MsgBox, TRAINER ID %windowID%
Menu, Skills, Add, Buff Skills, songFunction
Menu, menuBar, Add, Skills, :Skills
GUI, Menu, menuBar
GUI, Add, Text,w300, Welcome to the Music Leveling tool! Select the skill you would like to level from the menu bar.
GUI, Show,, "Music Trainer"
return

songFunction:
{
    GUI, Destroy
    GUI, Menu, menuBar
    GUI, add, Text,,Please hover over the skill you would like to spam with your mouse and then press ctrl-s. 
    GUI, add, Text,cRed,**WARNING** Your mouse will be stuck to the position you were hovering over for the duration of the macro!
    ;GUI, +AlwaysOnTop
    GUI, Show
    return
}

startStopSpam:
{
    image := BO.png
    WinActivate, ahk_id %windowID%
    Sleep, 200
    MouseGetPos, mouseX, mouseY,,
    ImageSearch, imageX, imageY,0 ,0 ,A_ScreenWidth ,A_ScreenHeight , *10 %A_ScriptDir%\expanded.png
    if (ErrorLevel = 2)
        MsgBox Could not conduct the search.
    else if (ErrorLevel = 1)
        MsgBox Icon could not be found on the screen.
    else
        MsgBox The icon was found at %imageX%x,%imageY%y.
    MsgBox, %imageX% %imageY% %A_ScriptDir%\BO.png
    Toggle := !Toggle
    loop
    {
        If not Toggle
            break
        Click, %mouseX% %mouseY% Left
        Sleep, 500
        Send {Escape}
    }
    return
}