#!/bin/bash

function gen_workspaces()
{
    i3-msg -t get_workspaces | tr ',' '\n' | grep "name" | sed 's/"name":"\(.*\)"/\1/g' | sort -n
}


WORKSPACE=$( (echo empty; gen_workspaces)  | rofi -location 2 -yoffset 100 -hide-scrollbar -auto-select -i -width -14 -dmenu -p "Select:")

if [ x"empty" = x"${WORKSPACE}" ]
then
    ~/dotfiles/scripts/i3_empty_workspace.sh
elif [ -n "${WORKSPACE}" ]
then
    i3-msg workspace "${WORKSPACE}"
fi
