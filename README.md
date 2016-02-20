# dotfiles
My personal dotfiles for synchronization across my home computers on i3-gaps window manager by Airblader (https://github.com/Airblader/i3). clone repository to ~/

make executable (chmod a+x): dot-sync and lock

copy to /usr/bin: lock, dot-sync

~/dotfiles/sync/host/dot-sync goes to /usr/bin on host machine where dotfiles are being drawn from.

~/dotfiles/sync/client/dot-sync goes to /usr/bin on client machine where dotfiles are being applied.

i3-wm config execs the synchronization if anything has changedand execs ~/.local-exec.sh for system unique cmds on boot.

Configured for: scrot, imagemagick, i3lock. i3blocks, i3-gaps, mpd, mpc, ncmpcpp, compton, urxvt, thunar