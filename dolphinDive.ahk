/* 

AHK DOLPHIN DIVE MACRO
https://steamcommunity.com/app/287700/discussions/0/1473095331502626947/?ctp=2 

Use for Metal Gear Solid: Phantom Pain to "Dolphin Dive"

Press Mouse4 to use

*/

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

toggle = 0
#MaxThreadsPerHotkey 2

XButton1::
    Toggle := !Toggle
     While Toggle{
Send, {Space}
Sleep, 422
Click, Right, Down
Sleep, 295
Send, {c}
Click, Right, Up
Sleep, 78
	}
return 