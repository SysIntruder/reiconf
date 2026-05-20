#!/bin/sh

for i in {40..47}; do
  printf "\033[%dm   \033[0m" "$i"
done
printf "\n"
for i in {100..107}; do
  printf "\033[%dm   \033[0m" "$i"
done
printf "\n"
