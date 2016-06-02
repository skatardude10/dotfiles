#!/bin/bash
res=$(echo "logout|reboot|suspend|shutdown" | rofi -sep "|" -dmenu -i -p 'Power: ' "" -hide-scrollbar -width 10 -location 5 -sidebar-mode)

if [ $res = "logout" ]; then
    i3-msg exit
fi
if [ $res = "reboot" ]; then
    systemctl reboot
fi
if [ $res = "suspend" ]; then
    systemctl suspend
fi
if [ $res = "shutdown" ]; then
    systemctl poweroff
fi
exit 0
