# AutoHotkey Scripts

A collection of AutoHotkey scripts for Windows.

---

## VimNav (`vimnav.ahk`)

Remaps CapsLock as a modifier key for hand-friendly text navigation and productivity shortcuts, inspired by Vim's movement keys.

**Navigation**
- `CapsLock + h/j/k/l` — Arrow keys (left/down/up/right)
- `CapsLock + y/o` — Jump word left/right (Ctrl+Left/Right)
- `CapsLock + i/u` — Jump paragraph up/down (Ctrl+Up/Down)
- `CapsLock + n/m` — Home/End

**Editing**
- `CapsLock + x/c/v` — Cut/Copy/Paste
- `CapsLock + e` — Cycle case: lower → UPPER → Title Case
- `CapsLock + w` — Wrap selected text with any character or bracket pair
- `CapsLock + Backspace` — Forward delete

**Insert**
- `CapsLock + d` — Insert date (YYYY-MM-DD)
- `CapsLock + t` — Insert timestamp (HH:mm:ss)

**Tools**
- `CapsLock + a` — Google search selected text (or open if it's a URL)
- `CapsLock + q` — Toggle always-on-top for the active window

---

## Dolphin Dive (`dolphindive.ahk`)

Automates dolphin diving in Metal Gear Solid V: The Phantom Pain.

Press **Mouse4** (side button) to toggle the macro on and off. While active it sends a timed sequence of inputs — sprint, aim, and dive — that would otherwise require precise manual timing to execute consistently.

Original script from the [MGSV Steam community discussions](https://steamcommunity.com/app/287700/discussions/0/1473095331502626947/?ctp=2).

---

## Requirements

- [AutoHotkey v1.x](https://www.autohotkey.com/)
