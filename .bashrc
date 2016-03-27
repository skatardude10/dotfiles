#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -a --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='$ $(pwd) ' 

alias installed='expac -H M "%011m\t%-20n\t%10d" $( comm -23 <(yaourt -Qqen|sort) <(yaourt -Qqg base base-devel|sort) ) | sort -n'
alias update='yaourt -Syu'
alias updateall='yaourt -Syu --aur'
alias updatefast='bb-wrapper -Syu --aur'
alias search='yaourt -Qs'
alias install='yaourt -S'
alias screenfix='xrandr --output LVDS-1 --off; sleep 1; xrandr --output LVDS-1 --mode 1366x768'
#alias send-layout='cd ~/dotfiles; sh pull-files.sh; git add --all; git commit -m "Update"; git push origin master'
#alias get-layout='cd ~/dotfiles; git pull; sh push-files.sh'
