;------------------------------------------------------------------------------------------------
;Mabinogi AHK tool
;Made by Tommy Stewart
;Description:
;   I wanted to make an AHK tool for mabi that could help players with tedious tasks
;   such as leveling skills, fishing, alchemy, cooking, etc. To be honest, this all started
;   with me leveling my music skills and wishing I could use my PC while I do it...So here we
;   go!

;Inspired by Xisumavoid's Minecraft AHK tool
;------------------------------------------------------------------------------------------------

;AHK settings/parameters
#NoEnv
#SingleInstance, Force

SetBatchLines -1
SetTitleMatchMode 2
SetWorkingDir %A_WorkingDir%

version := "v1.0.0`-alpha"
windowTitle := "M.U.A.H.K.U " version

;This array is used to populate the different tools for AHK to leverage.
;These tools are external AHK scripts. This allows for me or other users
;to create their own modules and add them to the main script with little
;hassle. **IDEA** Make the array easier to populate with a detector or something
;that can prompt the user to fill in friendlyname and script name or something like that.
toolMenuArray := {"Music Trainer": "musictrainer", "TESTING": "testing"}
runningProcessArray := []

;Hotkey Declarations
Hotkey ^w, SelectWindow
Hotkey ^x, EmergencyExit



;Menu Declaration
;This will be where the Menu items are defined and created.
;*̶*̶I̶D̶E̶A̶*̶*̶ ̶M̶a̶k̶e̶ ̶t̶h̶e̶ ̶s̶c̶r̶i̶p̶t̶s̶ ̶p̶o̶p̶u̶l̶a̶t̶e̶ ̶v̶i̶a̶ ̶a̶n̶ ̶a̶r̶r̶a̶y̶ ̶s̶o̶ ̶t̶h̶a̶t̶ ̶t̶h̶e̶y̶ ̶c̶a̶n̶ ̶e̶a̶s̶i̶l̶y̶ ̶b̶e̶ ̶a̶d̶d̶e̶d̶ ̶a̶n̶d̶ ̶c̶r̶e̶a̶t̶e̶d̶.̶
mainMenu:
{
Menu, Help, Add, GitHub, githubMenu
Menu, Help, Add, About, aboutMenu
for friendlyName, scriptName in toolMenuArray
    {
    handler := Func("toolSelector").Bind(scriptName, windowID, runningProcessArray)
    Menu, Tools, Add, %friendlyName%, % handler,
    }
Menu, menuBar, Add, Help, :Help
Menu, menuBar, Add, Tools, :Tools
Menu, menuBar, Disable, Tools
GUI, Menu, menuBar
GUI, Add, Text, w380 +Center, Welcome to the Ultimate Mabinogi AutoHotKey Utility`!
if %windowID%
{
    Menu, menuBar, Enable, Tools
    GUI, Add, Text,w380 +Center cGreen, You have selected the %targetWindowTitle% window! %windowID%
    GUI, Add, Text,w380 +Center, You can now choose from the list of tools!`nHappy automating!
}
else
{
GUI, Add, Text, w380 Center cRed, You have not selected a window yet!`nPlease hover over the Mabinogi window with your mouse cursor and press ctrl+w.
}
GUI, Margin, 5, 5
GUI, Show, w400 NoActivate, %windowTitle%
return
}
;Submenu Definitions

githubMenu:
{
    return
}

aboutMenu:
{
    return
}

toolSelector(scriptName, windowID, runningProcessArray, menuIndex)
{
    ;GUI, Hide
    Run %A_WorkingDir%/Resources/Scripts/%scriptName%.ahk %windowID%, WorkingDir, ,runningPID
    if !runningProcessArray.HasKey(runningPID)
    {
        runningProcessArray.Push(runningPID)
    }

    return
}

;Hotkey Functionality Defintions

SelectWindow:
{
    MouseGetPos, , ,windowID, control
    WinGetTitle, targetWindowTitle, ahk_id %windowID%
    MsgBox, You have selected the %targetWindowTitle% window`nIts ID is %windowID%
    GUI, Destroy
    gosub mainMenu
    return
}
EmergencyExit:
{
    for index, PID in runningProcessArray
    {
        Process, Close, %PID%
    }
    ExitApp
}