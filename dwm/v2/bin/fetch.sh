#!/bin/sh

user=$(whoami)
hostname=$(hostnamectl hostname)
distro=$(head -n1 /etc/os-release | awk -F"=" '{print $2}' | tr -d '"')
kernel=$(uname -r)
pkg=$(pacman -Qne | wc -l)
aur_pkg=$(pacman -Qm | wc -l)
deps_pkg=$(pacman -Qd | wc -l)
pnpm_global=$(pn list -g --depth 0 | grep -c '^[├└]')
shell=$(echo $SHELL | awk -F'/' '{print $NF}')
if [ "$shell" == "bash" ]; then
  shell=$(bash --version | head -n1 | awk '{gsub(/,/, "", $2); print $2, $4}')
fi

cmd_pid=$(ps -p $$ -o ppid= | tr -d ' ')
cmd_ppid=$(ps -p "$cmd_pid" -o ppid= | tr -d ' ')
terminal=$(ps -p "$cmd_ppid" -o args= | awk -F' ' '{print $1}')
if [ "$terminal" == "st" ]; then
  terminal=$(st -v 2>&1)
fi
if [ "$terminal" == "tmux" ]; then
  terminal=$(tmux -V)
fi

xorg_wm=$(xprop -root _NET_SUPPORTING_WM_CHECK 2>/dev/null | awk -F'#' '{print $2}' | xargs -r xprop -id 2>/dev/null | awk -F'\"' '/_NET_WM_NAME/ {print $2}')
if [ "$xorg_wm" == "dwm" ]; then
  xorg_wm=$(dwm -v 2>&1)
fi

printf "%s@%s\n" "$user" "$hostname"
printf "========================================\n"
printf "DISTRO         : %s\n" "$distro"
printf "KERNEL         : %s\n" "$kernel"
printf "PACKAGES       : (Ex %s) (Aur %s) (Dep %s)\n" "$pkg" "$aur_pkg" "$deps_pkg"
printf "OTHER PACKAGES : (Pnpm %s)\n" "$pnpm_global"
printf "SHELL          : %s\n" "$shell"
printf "TERMINAL       : %s\n" "$terminal"
printf "WINDOW MANAGER : %s\n" "$xorg_wm"
printf "========================================\n"

for i in {40..47}; do
  printf "\033[%dm     \033[0m" "$i"
done
printf "\n"
for i in {100..107}; do
  printf "\033[%dm     \033[0m" "$i"
done
printf "\n"
