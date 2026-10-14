# VimNav

Vim-inspired keyboard navigation and productivity shortcuts for Windows, built with AutoHotkey.

VimNav transforms `CapsLock` into a modifier key for navigating, selecting, and editing text without moving your hands away from the home row. It also provides shortcuts for text manipulation, inserting dates and timestamps, searching the web, and managing windows.

Inspired by [Philipp Otto's original CapsLock navigation concept](https://lifehacker.com/5277383/use-caps-lock-for-hand-friendly-text-navigation), VimNav has been extended with additional navigation and productivity features.

## Keybindings

Hold `CapsLock` together with the following keys.

### Navigation

| Key | Action |
|---|---|
| `h` / `j` / `k` / `l` | Left / Down / Up / Right |
| `y` / `o` | Previous / Next word |
| `i` / `u` | Previous / Next paragraph |
| `n` / `m` | Home / End |
| `[` / `]` | Page Up / Page Down |
| `Backspace` | Forward Delete |

**Text selection:** Hold `Shift` alongside `CapsLock` and a navigation key to extend the selection. For example, `CapsLock + Shift + l` selects text to the right, while `CapsLock + Shift + o` selects the next word.

### Editing

| Key | Action |
|---|---|
| `x` | Cut |
| `c` | Copy |
| `v` | Paste |
| `e` | Cycle selected text through lowercase → UPPERCASE → Title Case |
| `w` | Wrap selected text with a character or matching bracket pair |

**Wrapping text:** Select text, press `CapsLock + w`, then type the character you want to wrap it with.

- Symmetric characters: `*`, `_`, `` ` ``, `~`, `'`, `"`
- Matching pairs: `()`, `[]`, `{}`, `<>`
- Either opening or closing bracket can be used.
- Press `Escape` to cancel.

For example, selecting `hello` and wrapping it with `(` produces `(hello)`.

### Text Insertion

| Key | Action |
|---|---|
| `d` | Insert current date (`YYYY-MM-DD`) |
| `t` | Insert current time (`HH:mm:ss`) |

### Utilities

| Key | Action |
|---|---|
| `a` | Search selected text on Google, or open an HTTP URL directly |
| `q` | Toggle always-on-top for the active window |

## CapsLock Behavior

VimNav replaces the normal CapsLock behavior to prevent accidental capitalization while navigating.

| Shortcut | Action |
|---|---|
| `CapsLock` | Turn CapsLock off |
| `Shift + CapsLock` | Turn CapsLock on |

## Requirements

- Windows
- [AutoHotkey v1.x](https://www.autohotkey.com/)

## Installation

1. Install AutoHotkey v1.x.
2. Clone or download this repository.
3. Run `vimnav.ahk`.

The script runs in the background and provides system-wide shortcuts while active.

## Customization

All keybindings and functionality are defined in `vimnav.ahk`. Open the script in a text editor to modify existing shortcuts or add new functionality.

## Credits

The original CapsLock navigation concept was developed by **Philipp Otto**, as described in [this Lifehacker article](https://lifehacker.com/5277383/use-caps-lock-for-hand-friendly-text-navigation).

Extended and maintained by [gearheaded](https://github.com/gearheaded).
