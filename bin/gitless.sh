#!/usr/bin/env zsh

less -i
exit
set -x
lines=`tee >(wc -l)`

if [[ "$lines" -gt "`tput lines`" ]]; then
    less -i
else
    less -iXF
fi
