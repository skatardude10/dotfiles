#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -a --color=auto'
#PS1='[\u@\h \W]\$ '
#PS1="\$(date +%k:%M:%S) \u@\h \w "

color1="\[$(tput setaf 4)\]"
color2="\[$(tput setaf 2)\]"
color3="\[$(tput setaf 5)\]"
color4="\[$(tput setaf 9)\]"
color5="\[$(tput setaf 11)\]"
RESET="\[$(tput sgr0)\]"

PS1="${color1}[\$(date +%k%M%S)] ${color2}[\u@\h] ${color3}[\$(ls -l | grep ^- | wc -l) files] ${color5}[\w] ${color4}\n● ${RESET}"

alias installed='expac -H M "%011m\t%-20n\t%10d" $( comm -23 <(yaourt -Qqen|sort) <(yaourt -Qqg base base-devel|sort) ) | sort -n'
alias update='yaourt -Syu'
alias updateall='yaourt -Syu --aur'
alias updatefast='bb-wrapper -Syu --aur'
alias search='yaourt -Qs'
alias install='yaourt -S'
alias steamfix='find ~/.steam/root/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" -o -name "libgpg-error.so*" \) -print -delete'
#alias send-layout='cd ~/dotfiles; sh pull-files.sh; git add --all; git commit -m "Update"; git push origin master'
#alias get-layout='cd ~/dotfiles; git pull; sh push-files.sh'

if [ -f /home/carder/torch/install/bin/torch-activate ]; then
    . /home/carder/torch/install/bin/torch-activate
fi