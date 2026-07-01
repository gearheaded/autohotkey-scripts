/*

Use Caps Lock for Hand-Friendly Text Navigation
httplifehacker.com5277383use-caps-lock-for-hand+friendly-text-navigation
Written by Philipp Otto, Germany

Script Function
Template script (you can customize this template by editing ShellNewTemplate.ahk in your Windows folder)

    Normal usage with capslock as a modifier

    h left
    j down
    l right
    k up

    y simulates CTRL+left (jumps to the next word)
    o simulates CTRL+right

    u simulates CTRL+Down
    i simulates CTRL+Up

    n simulates Home
    m simulates End

    Backspace simulates Delete

    x cut
    c copy
    v paste
	
    q always on top
	
    a google search highlighted text

    If you keep pressing "Shift" in addition to Capslock it works as if you are pressing Shift — you highlight the text. Shift + Capslock activates the actual Capslock functionality (normal capslock-hitting deactivates it again).

*/


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetCapsLockState, AlwaysOff

CapsLock & k::
       if getkeystate("Shift") = 0 
               Send,{Up} 
     else 
               Send,+{Up} 
return


CapsLock & l::
       if getkeystate("Shift") = 0
               Send,{Right}
       else
               Send,+{Right}
return


CapsLock & h::
       if getkeystate("Shift") = 0
               Send,{Left}
       else
               Send,+{Left}
return


CapsLock & j::
       if getkeystate("Shift") = 0
               Send,{Down}
       else
               Send,+{Down}
return


CapsLock & u::
       if getkeystate("Shift") = 0
               Send,^{Down}
       else
               Send,+^{Down}
return


CapsLock & i::
       if getkeystate("Shift") = 0
               Send,^{Up}
       else
               Send,+^{Up}
return


CapsLock & n::
       if getkeystate("Shift") = 0
               Send,{Home}
       else
               Send,+{Home}
return


CapsLock & m::
       if getkeystate("Shift") = 0
               Send,{End}
       else
               Send,+{End}
return


CapsLock & y::
       if getkeystate("Shift") = 0
               Send,^{Left}
       else
               Send,+^{Left}
return

 
CapsLock & o::                                  
       if getkeystate("Shift") = 0
              Send,^{Right}
       else
              Send,+^{Right}
return


CapsLock & BS::Send,{Del}
CapsLock & x::Send ^x
CapsLock & c::Send ^c
CapsLock & v::Send ^v
CapsLock & q::Winset, Alwaysontop, , A

;Google lookup
Capslock & a::
	Keywait, Capslock
	prevClipboard := ClipboardAll
	Clipboard :=
	SendInput, ^c 
	ClipWait, 1
	if !(ErrorLevel)  { 
		Clipboard := RegExReplace(RegExReplace(Clipboard, "\r?\n"," "), "(^\s+|\s+$)")
	if SubStr(ClipBoard,1,7)="http://"
		Run, % Clipboard
	else 
	Run, % "http://www.google.com/search?hl=en&q=" Clipboard
	} 
	Clipboard := prevClipboard
return


;Prevents CapsState-Shifting
CapsLock & Space::Send,{Space}


*Capslock::SetCapsLockState, AlwaysOff
+Capslock::SetCapsLockState, On

