#!/bin/bash
#Connect BT Speaker
echo -e 'power on' | bluetoothctl
sleep 1
echo -e 'connect FC\t' | bluetoothctl
sleep 3
echo -e 'quit' | bluetoothctl
