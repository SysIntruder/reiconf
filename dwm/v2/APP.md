# Distro
Arch Linux

# Explicitly Installed Only

## Core
- amd-ucode                         : Microcode
- base
- btrfs-progs                       : Manage BTRFS
- efibootmgr                        : Manage UEFI boot entries
- git
- less                              : Pager
- linux-lts
- linux-firmware
- networkmanager
- pipewire                          : Audio
- tlp                               : Manage power
- sof-firmware                      : Audio
- sudo
- udisks2                           : Mount usb
- vulkan-radeon                     : Graphics
- wireplumber                       : Audio
- wpa_supplicant                    : Wireless backend
- xf86-video-amdgpu                 : Graphics
- xf86-video-ati                    : Graphics
- xorg-server                       : Display server
- xorg-xinit                        : Display server
- yay                               : Install AUR
- zram-generator

## Application
- bash                              : Shell
- bc                                : Calculator
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
- nftables                          : Firewall
- unzip
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
- noto-fonts-cjk                    : CJK Fonts
- picom                             : Compositor
- terminus-font                     : Fonts
- ttf-dejavu                        : Fonts
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
- pnpm
    - node
    - @vue/language-server
    - @vue/typescript-plugin
    - typescript
    - @vtsls/language-server
    - @tailwindcss/language-server
    - eslint_d
    - serve
