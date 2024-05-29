# ReiZero's custom mappings

## Legend
- C = ctrl
- S = shift (for alphapbet, S-z == Z)
- M = meta
- A = alt

## OS

_Most common used os binding_

-----------------------------------------
| Keymap      | Action                  |
-----------------------------------------
| Application                           |
-----------------------------------------
| Super-Enter  | open terminal          |
| Super-F2     | open browser           |
| Super-F3     | open file manager      |
| Super-d      | open search app        |
-----------------------------------------
| Action                                |
-----------------------------------------
| Super-f       | fullscreen app        |
| Super-q       | close app             |
| Super-PrtSc   | screenshot            |
| Super-S-PrtSc | selection screenshot  |
| Super-C-PrtSc | screenrecord          |
-----------------------------------------
| Navigation                            |
-----------------------------------------
| Super-`      | switch app             |
| Super-(1-9)  | switch workspace (1-9) |
| Super-h      | focus window left      |
| Super-j      | focus window down      |
| Super-k      | focus window up        |
| Super-l      | focus window right     |
-----------------------------------------

## Tmux

_Most common used tmux binding_

`leader = C-a`

----------------------------------------
| Keymap      | Action                 |
----------------------------------------
| System                               |
----------------------------------------
| leader ?    | keybind list           |
| leader d    | detach client          |
----------------------------------------
| Mode                                 |
----------------------------------------
| leader :    | command mode           |
| leader w    | window select mode     |
| leader s    | session select mode    |
| leader [    | copy mode              |
| leader ]    | paste from copy mode   |
----------------------------------------
| Pane                                 |
----------------------------------------
| leader "    | split horizontal       |
| leader %    | split vertical         |
| leader !    | break pane to window   |
----------------------------------------
| Custom                               |
----------------------------------------
| M-Up        | new window             |
| M-Down      | close window           |
| M-Left      | prev window            |
| M-Right     | next window            |
| leader R    | reload tmux config     |
| leader g    | display lazygit        |
| leader q    | close pane             |
| C-h         | focus pane left        |
| C-j         | focus pane down        |
| C-k         | focus pane up          |
| C-l         | focus pane right       |
----------------------------------------
| Copy Mode                            |
----------------------------------------
| v           | start visual mode      |
| y           | copy text to           |
----------------------------------------

## Neovim

_Most common used neovim binding_

`leader = space`

------------------------------------------------------
| Keymap     | Action                                |
------------------------------------------------------
| Movement                                           |
------------------------------------------------------
| h          | left                                  |
| j          | down                                  |
| k          | up                                    |
| l          | right                                 |
| C-u        | page up                               |
| C-d        | page down                             |
| w          | next first word                       |
| e          | next last word                        |
| b          | prev first word                       |
| ge         | prev last word                        |
| {          | jump to prev newline                  |
| }          | jump to next newline                  |
| %          | jump to matching character            |
| gg         | jump to top of file                   |
| G          | jump to bottom of file                |
| 0          | jump to first line                    |
| $          | jump to last line                     |
------------------------------------------------------
| Mode                                               |
------------------------------------------------------
| :          | command mode                          |
| v          | visual mode                           |
| V          | visual line mode                      |
| C-v        | visual block mode                     |
| r          | replace character                     |
| R          | replace line mode                     |
| V          | visual line mode                      |
| i          | insert mode prev word                 |
| I          | insert mode first line                |
| a          | insert mode next word                 |
| A          | insert mode last line                 |
| o          | start insert below                    |
| O          | start insert above                    |
------------------------------------------------------
| Window                                             |
------------------------------------------------------
| C-w s      | split window horizontal               |
| C-w v      | split window vertical                 |
------------------------------------------------------
| Action                                             |
------------------------------------------------------
| d          | cut                                   |
| dd         | cut line                              |
| D          | cut until last line                   |
| x          | cut                                   |
| X          | cut prev                              |
| y          | yank                                  |
| Y          | yank until last line                  |
| p          | paste below/next                      |
| P          | paste above/prev                      |
| .          | redo last action                      |
| u          | undo                                  |
| C-r        | redo                                  |
| >          | increase indent                       |
| <          | decrease indent                       |
------------------------------------------------------
| Search                                             |
------------------------------------------------------
| f          | forward line search character         |
| F          | backward line search character        |
| ;          | next line search character result     |
| ,          | prev line search character result     |
| /          | search word forward                   |
| ?          | search word backward                  |
| *          | forward search word under cursor      |
| #          | backward search word under cursor     |
| n          | next search result                    |
| N          | prev search result                    |
------------------------------------------------------
| Misc                                               |
------------------------------------------------------
| q          | start/stop record macro               |
| @          | apply recorded macro                  |
| zM         | close all fold                        |
| zR         | open all fold                         |
| za         | toggle fold                           |
| gcc        | toggle comment                        |
------------------------------------------------------
| Custom                                             |
------------------------------------------------------
| ESC        | remove search highlight               |
| -          | open netrw                            |
| C-Up       | new empty buffer                      |
| C-Down     | close buffer                          |
| C-Left     | prev buffer                           |
| C-Right    | next buffer                           |
| U          | redo                                  |
| H          | ^ (bol)                               |
| J          | } (next newline)                      |
| K          | { (prev newline)                      |
| L          | $ (eol)                               |
| !          | ~ (toggle case)                       |
| =          | find word under cursor                |
| X          | replace word under cursor             |
| M          | ` (goto mark)                         |
------------------------------------------------------
| Plugins                                            |
------------------------------------------------------
| Tmux                                               |
------------------------------------------------------
| C-h        | focus window left/tmux pane left      |
| C-j        | focus window down/tmux pane down      |
| C-k        | focus window up/tmux pane up          |
| C-l        | focus window right/tmux pane right    |
------------------------------------------------------
| LSP                                                |
------------------------------------------------------
| gd         | goto definition                       |
| gr         | rename symbol                         |
| ga         | code action                           |
| gD         | diagnostics                           |
| C-w d      | diagnostics                           |
| ]d         | next diagnostic                       |
| [d         | prev diagnostic                       |
------------------------------------------------------
| Telescope                                          |
------------------------------------------------------
| leader ff  | find files                            |
| leader fo  | recent files                          |
| leader fw  | find word                             |
| leader fz  | buffer fuzzy find                     |
| leader fb  | list buffers                          |
| leader fd  | list lsp diagnostics                  |
| leader fc  | list incoming fn call                 |
| leader fC  | list outgoing fn call                 |
| leader fs  | list symbols                          |
| leader fS  | list symbols (treesitter)             |
| leader fk  | keymap cheatsheet                     |
------------------------------------------------------
| Golang                                             |
------------------------------------------------------
| leader gtj | add json struct tag                   |
| leader gtq | add query struct tag                  |
| leader gtf | add form struct tag                   |
| leader gtd | add db struct tag                     |
------------------------------------------------------
| Flash
------------------------------------------------------
| s          | jump                                  |
| S          | jump, do operation, then return       |
------------------------------------------------------
| Undotree                                           |
------------------------------------------------------
| leader u   | toggle undotree                       |
------------------------------------------------------
| Git                                                |
------------------------------------------------------
| leader hr  | reset hunk                            |
| leader hp  | preview hunk                          |
| leader hb  | git blame                             |
------------------------------------------------------
