#!/usr/bin/env python

import i3ipc
from string import digits
from string import ascii_letters

i3 = i3ipc.Connection()

def print_workspaces():
    workspaces = i3.get_workspaces()
    outputlist=[]
    remove_characters = ascii_letters + digits
    for i in workspaces:
        if i['focused']==True:
            output = i['name']
            output = output.translate({ord(k): None for k in remove_characters})
            #output = "<big>" + output + "</big>"
        else:
            output = i['name']
            output = output.translate({ord(k): None for k in remove_characters})
            output = "<span foreground='#A6DDFF'>" + output + "</span>"
        outputlist.append(output)
    print("  ".join(outputlist) + "  ")

print_workspaces()

def list_workspaces(event, data, subscription):
    if 'change' in event:
        print_workspaces()

#subscription = i3.Subscription(list_workspaces, 'workspace')