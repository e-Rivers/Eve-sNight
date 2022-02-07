#!/bin/bash

# Author: Emilio Rivers (e-Rivers)
# Simplified version of the code made by Aditya Shakya (adi1090x)

# Options
shutdown="襤"
reboot="累"
lock=""
suspend=""
logout="﫼"

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | rofi -theme themes/eves-night-rofi_powermenu -dmenu )"
case $chosen in
    $shutdown)
        shutdown now
        ;;
    $reboot)
        reboot
        ;;
    $lock)
        light-locker-command -l
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        echo "awesome.quit()" | awesome-client
        ;;
esac
