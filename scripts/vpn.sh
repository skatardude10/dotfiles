#!/bin/bash
res=$(echo "start|tor" | rofi -sep "|" -dmenu -i -p 'VPN ' "" -width 10 -hide-scrollbar -location 3 -sidebar-mode)

if [ $res = "start" ]; then
    urxvt -e sudo openvpn ~/airvpn/airvpn.ovpn
fi
if [ $res = "tor" ]; then
    urxvt -e sh ~/dotfiles/scripts/blocklets/vpntor
fi
exit 0