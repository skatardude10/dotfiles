#!/usr/bin/env python

import i3ipc

i3 = i3ipc.Connection()

def print_workspaces():
    workspaces = i3.get_workspaces()
    outputlist=[]
    for i in workspaces:
        if i['focused']==True:
            output = "◌" + i['name'] + "◌"
        else:
            output = i['name']
        outputlist.append(output)
    print("  ".join(outputlist))

print_workspaces()

def list_workspaces(event, data, subscription):
    if 'change' in event:
        print_workspaces()

# subscription = i3.Subscription(list_workspaces, 'workspace')