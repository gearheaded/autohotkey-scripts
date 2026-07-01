/*

    CapsLock Navigation & Productivity Script
    Original navigation concept by Philipp Otto (Germany)
    http://lifehacker.com/5277383/use-caps-lock-for-hand+friendly-text-navigation

    Extended and maintained by gearheaded
    https://github.com/gearheaded

    CapsLock acts as a modifier key for all bindings below.
    Holding Shift alongside CapsLock extends selections (as if holding Shift normally).
    Shift + CapsLock activates real CapsLock. Tapping CapsLock alone deactivates it.

    // ########  NAVIGATION

    h          Left
    j          Down
    k          Up
    l          Right

    y          Word left  (Ctrl+Left)
    o          Word right (Ctrl+Right)

    i          Paragraph up   (Ctrl+Up)
    u          Paragraph down (Ctrl+Down)

    n          Home
    m          End

    Backspace  Delete (forward)

    // ########  EDITING

    x          Cut
    c          Copy
    v          Paste

    e          Cycle case: lower -> UPPER -> Title Case -> lower
    w          Wrap selected text: press w, then press any wrap character
                   Symmetric: * _ ` ~ ' "
                   Paired:    () [] {} <>

    // ########  INSERT

    d          Insert date      (YYYY-MM-DD)
    t          Insert timestamp (HH:mm:ss)

    // ########  TOOLS

    a          Google search selected text (opens URL directly if selected text is a URL)
    q          Toggle always-on-top for current window

*/


; ########  SETUP

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetCapsLockState, AlwaysOff


; ########  NAVIGATION

CapsLock & h::
    if getkeystate("Shift") = 0
        Send, {Left}
    else
        Send, +{Left}
return

CapsLock & j::
    if getkeystate("Shift") = 0
        Send, {Down}
    else
        Send, +{Down}
return

CapsLock & k::
    if getkeystate("Shift") = 0
        Send, {Up}
    else
        Send, +{Up}
return

CapsLock & l::
    if getkeystate("Shift") = 0
        Send, {Right}
    else
        Send, +{Right}
return

CapsLock & y::
    if getkeystate("Shift") = 0
        Send, ^{Left}
    else
        Send, +^{Left}
return

CapsLock & o::
    if getkeystate("Shift") = 0
        Send, ^{Right}
    else
        Send, +^{Right}
return

CapsLock & i::
    if getkeystate("Shift") = 0
        Send, ^{Up}
    else
        Send, +^{Up}
return

CapsLock & u::
    if getkeystate("Shift") = 0
        Send, ^{Down}
    else
        Send, +^{Down}
return

CapsLock & n::
    if getkeystate("Shift") = 0
        Send, {Home}
    else
        Send, +{Home}
return

CapsLock & m::
    if getkeystate("Shift") = 0
        Send, {End}
    else
        Send, +{End}
return

CapsLock & BS::Send, {Del}


; ########  EDITING

CapsLock & x::Send ^x
CapsLock & c::Send ^c
CapsLock & v::Send ^v

; Cycle case of selected text: lower -> UPPER -> Title Case -> lower
CapsLock & e::
{
    ClipSaved := ClipboardAll
    Clipboard := ""
    Send, ^c
    ClipWait, 0.5

    if (Clipboard != "")
    {
        text := Clipboard

        isAllUpper := 1
        isAllLower := 1
        Loop, Parse, text
        {
            if A_LoopField is Lower
                isAllUpper := 0
            if A_LoopField is Upper
                isAllLower := 0
        }

        if (isAllLower)
        {
            ; lower -> UPPER
            StringUpper, ModifiedText, text
        }
        else if (isAllUpper)
        {
            ; UPPER -> Title Case
            StringLower, ModifiedText, text
            StringUpper, ModifiedText, ModifiedText, T
        }
        else
        {
            ; Title Case (or mixed) -> lower
            StringLower, ModifiedText, text
        }

        Clipboard := ModifiedText
        Sleep, 50
        Send, ^v
    }

    Sleep, 50
    Clipboard := ClipSaved
    return
}

; Wrap selected text with any character or pair
; Usage: select text, press CapsLock+w, then press the desired wrap character
; Symmetric characters (e.g. * _ ` ~ ' ") wrap identically on both sides
; Bracket characters (e.g. ( [ { <) wrap with their matching closer
; Either the opener or closer can be pressed - both produce the same result
CapsLock & w::
{
    ClipSaved := ClipboardAll
    Clipboard := ""
    Send, ^c
    ClipWait, 0.5
    SelectedText := Clipboard

    if (SelectedText != "")
    {
        Input, RawKey, L1, {Escape}

        if (ErrorLevel = "EndKey:Escape" or RawKey = "")
        {
            Clipboard := ClipSaved
            return
        }

        ; Remap shifted keys to their actual characters
        ShiftHeld := GetKeyState("Shift", "P")
        if (ShiftHeld)
        {
            if (RawKey = "9")
                WrapChar := "("
            else if (RawKey = "0")
                WrapChar := ")"
            else if (RawKey = "[")
                WrapChar := "{"
            else if (RawKey = "]")
                WrapChar := "}"
            else if (RawKey = ",")
                WrapChar := "<"
            else if (RawKey = ".")
                WrapChar := ">"
            else if (RawKey = "8")
                WrapChar := "*"
            else if (RawKey = "-")
                WrapChar := "_"
            else if (RawKey = "`")
                WrapChar := "~"
            else if (RawKey = "'")
                WrapChar := """"
            else
                WrapChar := RawKey
        }
        else
            WrapChar := RawKey

        ; Normalize closers to their openers so either can be pressed
        if (WrapChar = ")")
            WrapChar := "("
        else if (WrapChar = "]")
            WrapChar := "["
        else if (WrapChar = "}")
            WrapChar := "{"
        else if (WrapChar = ">")
            WrapChar := "<"

        ; Assign the closing character for paired brackets
        if (WrapChar = "(")
            WrapClose := ")"
        else if (WrapChar = "[")
            WrapClose := "]"
        else if (WrapChar = "{")
            WrapClose := "}"
        else if (WrapChar = "<")
            WrapClose := ">"
        else
            WrapClose := WrapChar

        Clipboard := WrapChar . SelectedText . WrapClose
        Sleep, 50
        Send, ^v
    }

    Sleep, 50
    Clipboard := ClipSaved
    return
}


; ########  INSERT

; Insert today's date as YYYY-MM-DD
CapsLock & d::
    FormatTime, CurrentDate,, yyyy-MM-dd
    SendInput, %CurrentDate%
return

; Insert current time as HH:mm:ss
CapsLock & t::
    FormatTime, CurrentTimestamp,, HH:mm:ss
    SendInput, %CurrentTimestamp%
return


; ########  TOOLS

; Google search selected text, or open directly if it's a URL
CapsLock & a::
    Keywait, Capslock
    prevClipboard := ClipboardAll
    Clipboard :=
    SendInput, ^c
    ClipWait, 1
    if !(ErrorLevel)
    {
        Clipboard := RegExReplace(RegExReplace(Clipboard, "\r?\n", " "), "(^\s+|\s+$)")
        if SubStr(ClipBoard, 1, 7) = "http://"
            Run, % Clipboard
        else
            Run, % "http://www.google.com/search?hl=en&q=" Clipboard
    }
    Clipboard := prevClipboard
return

; Toggle always-on-top for the active window
CapsLock & q::Winset, Alwaysontop, , A


; ########  CAPSLOCK BEHAVIOUR

; Prevent accidental space input while using CapsLock as modifier
CapsLock & Space::Send, {Space}

; Tapping CapsLock always turns it off
*Capslock::SetCapsLockState, AlwaysOff

; Shift+CapsLock activates real CapsLock
+Capslock::SetCapsLockState, On