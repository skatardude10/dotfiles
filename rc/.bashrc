# == ~/.bashrc == #
PS1="${color1}[\$(date +%k%M%S)] ${color2}[\u@\h] ${color3}[\$(ls -l | grep ^- | wc -l) files] ${color5}[\w] ${color4}\n● ${RESET}"

# == If not running interactively, don't do anything == #
[[ $- != *i* ]] && return

# == Alias == #
alias ls='ls -a --color=auto'
alias update='yaourt -Syu'
alias installed='expac -H M "%011m\t%-20n\t%10d" $( comm -23 <(yaourt -Qqen|sort) <(yaourt -Qqg base base-devel|sort) ) | sort -n'
alias steamfix='find ~/.steam/root/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" -o -name "libgpg-error.so*" \) -print -delete'

# == Functions == #
cdls() { cd "$@" && ls; }

# == Colors == #
color1="\[$(tput setaf 4)\]"
color2="\[$(tput setaf 2)\]"
color3="\[$(tput setaf 5)\]"
color4="\[$(tput setaf 9)\]"
color5="\[$(tput setaf 11)\]"
RESET="\[$(tput sgr0)\]"

# == Machine Specific == #
case $HOSTNAME in
  (*Desktop)   . /home/carder/torch/install/bin/torch-activate; echo "Desktop Config";;
  (*laptop)   alias tv='sh ~/Documents/setup-tv-bluetooth.sh'; echo "Laptop Config";;
esac
