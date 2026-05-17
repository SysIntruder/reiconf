# Distro
Arch Linux

# Explicitly Installed Only

## Core
- amd-ucode                         : Microcode
- base
- btrfs-progs                       : Manage BTRFS
- git
- grub
- less                              : Pager
- linux-lts
- linux-firmware
- networkmanager
- os-prober                         : Detect another OS
- pipewire                          : Audio
- power-profiles-daemon             : Manage power
- sof-firmware                      : Audio
- sudo
- vulkan-radeon                     : Graphics
- wireplumber                       : Audio
- wpa_supplicant                    : Network
- xf86-video-amdgpu                 : Graphics
- xf86-video-ati                    : Graphics
- xorg-server                       : Display server
- xorg-xinit                        : Display server
- yay                               : Install AUR
- zram-generator

## Application
- bash                              : Shell
- brightnessctl                     : Control backlight
- dunst                             : Notification
- firefox-developer-edition         : Browser
- htop                              : System monitor
- hsetroot                          : Wallpaper setter
- lazygit                           : Git TUI
- neovim                            : Text editor
- nm-connection-editor              : GUI for network manager
- nsxiv                             : Image viewer
- pavucontrol                       : Control volume
- scrot                             : Screenshot
- tmux                              : Terminal multiplexer
- ufw                               : Firewall
- unzip
- vifm                              : File manager
- xclip                             : Copy paste
- xorg-xkill                        : Kill window
- xorg-xrandr                       : Display settings

## Suckless
- base-devel                        : For building packages
- gcc                               : build suckless (dwm, dmenu, st, slock)
- libxft                            : X11 font rendering
- make                              : Handle Makefile

## Misc
- acpid                             : Listen ACPI events
- bash-completion
- easyeffects                       : Better sound
- efibootmgr                        : Manage UEFI boot entries
- gnu-free-fonts                    : Fonts
- picom                             : Compositor
- terminus-font                     : Fonts
- ttf-dejavu                        : Fonts
- ttf-hanazono                      : CJK Fonts
- ttf-liberation                    : Fonts

## Deps
- gst-plugin-pipewire               : pipewire
- pipewire-alsa                     : pipewire
- pipewire-jack                     : pipewire
- pipewire-pulse                    : pipewire

## Optional Deps
- calf                              : easyeffects
- libnotify                         : dunst
- lsp-plugins-lv2                   : easyeffects
- mda.lv2                           : easyeffects
- zam-plugins                       : easyeffects

## Scripts and Neovim Plugins Deps
- cmd-polkit-git                    : Custom polkit UI
- fd                                : Modern find
- fzf                               : Fuzzy-finder
- jmtpfs                            : Mount android
- jq                                : Parse JSON
- ripgrep                           : Modern grep

## Development

### System
- lua-language-server
- stylua

### PNPM
```
pnpm uses hashing, will be differ in each installation

location: $HOME/.local/share/pnpm/global/<pnpm_version>
```
- pnpm                              : 2240-19e2f070543
    - node                          : 23c4-19e2f0958b4
    - @vue/language-server          : 5fe-19e341b63c1
    - @vtsls/language-server        : bc8-19e34241a35
    - @tailwindcss/language-server  : c10-19e34248a34
    - eslint_d                      : d16-19e3425f795
