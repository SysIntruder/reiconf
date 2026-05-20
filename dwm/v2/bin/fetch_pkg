#!/bin/sh

pkg=$(pacman -Qne | wc -l)
aur_pkg=$(pacman -Qm | wc -l)
deps_pkg=$(pacman -Qd | wc -l)
pnpm_global=$(fd . $HOME/.local/share/pnpm/global/v11 --type d --max-depth 1 | wc -l)

printf "EXPLICIT INSTALL : %s\n" "$pkg"
printf "AUR              : %s\n" "$aur_pkg"
printf "DEPENDENCIES     : %s\n" "$deps_pkg"
printf "PNPM GLOBAL      : %s\n" "$pnpm_global"
