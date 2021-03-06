# == ~/.bashrc == #
# == If not running interactively, don't do anything == #
[[ $- != *i* ]] && return

export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=
export HISTSIZE=

# == Alias == #
alias re='reboot'
alias sus='systemctl suspend'
alias po='poweroff'
alias feh='feh -Z.'
alias ls='ls -a --color=auto --group-directories-first'
alias update='yaourt -Syu'
alias installed='expac -H M "%011m\t%-20n\t%10d" $( comm -23 <(yaourt -Qqen|sort) <(yaourt -Qqg base base-devel|sort) ) | sort -n'
alias steamfix='find ~/.steam/root/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" -o -name "libgpg-error.so*" \) -print -delete'
alias transfer='rsync -avz --progress -e 'ssh''
alias ncmpcpp='MPD_HOST=127.0.0.1 ncmpcpp'
alias mpc='MPD_HOST=127.0.0.1 mpc'

# == Functions == #
function actualsize { find "$1" -type f -links 1 -printf "%m\n" | awk '{m=m+$1} END {print m}'; }
exitstatus()
{
    if [[ $? == 0 ]]; then
        echo ":)"
    else
        echo "D:"
    fi
}

# == Colors == #
color1="\[$(tput setaf 1)\]"
color2="\[$(tput setaf 2)\]"
color3="\[$(tput setaf 3)\]"
color4="\[$(tput setaf 4)\]"
color5="\[$(tput setaf 5)\]"
color7="\[$(tput setaf 6)\]"
color6="\[$(tput setaf 7)\]"
RESET="\[$(tput sgr0)\]"
PS1="\$(exitstatus) ${color2}[\$(date +%k%M%S)] ${color3}[\u@\h] ${color4}[\$(ls -l | grep ^- | wc -l) files] ${color5}[\w] ${color6}\n > ${RESET}"

# == Machine Specific == #
case $HOSTNAME in
  (*Desktop)   . /home/carder/torch/install/bin/torch-activate;;
  (*laptop)   alias tv='sh ~/Documents/setup-tv-bluetooth.sh';;
esac

LS_COLORS=$(python2 /usr/bin/ls_colors_generator)

run_ls() {
	ls-i --color=auto -w $(tput cols) "$@"
}

run_dir() {
	dir-i --color=auto -w $(tput cols) "$@"
}

run_vdir() {
	vdir-i --color=auto -w $(tput cols) "$@"
}
alias ls="run_ls"
alias dir="run_dir"
alias vdir="run_vdir"

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_CONNECTION" ]; then
	if [[ $SSH_CLIENT == *"1.110"* ]]; then
		export DISPLAY=Desktop-VM:0.0
		xrdb -merge ~/.Xresources
	    if [ "$(ps -p $(ps -p $$ -o ppid=) -o args=)" != "urxvt" ]; then
			urxvt & disown
        	sleep 1
        	exit
		fi
    fi
fi
