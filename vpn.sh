#!/bin/bash
res=$(echo "start|tor" | rofi -sep "|" -dmenu -i -p 'VPN ' "" -width 10 -hide-scrollbar -location 3 -padding 15 -sidebar-mode -yoffset 36 -font "Ubuntu Condensed 16" -auto-select)

if [ $res = "start" ]; then
    urxvt -e sudo openvpn ~/airvpn/airvpn.ovpn
fi
if [ $res = "tor" ]; then
    urxvt -e sh ~/dotfiles/blocklets/vpntor
fi
exit 0