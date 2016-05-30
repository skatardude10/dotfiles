#!/bin/bash

title="SSH Configs"
prompt="Pick an option:"
options=("Apply" "Get")

echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do 

    case "$REPLY" in

    1 ) echo "Applying SSH Configs..."
        sudo cp ~/dotfiles/config/sshd_config /etc/ssh/
        sudo cp ~/dotfiles/config/ssh_config /etc/ssh/
        echo "SSH Configs Applied!"
        ;;
    2 ) echo "Copying SSH  Configs to dotfiles..."
        cp /etc/ssh/sshd_config ~/dotfiles/config/
        cp /etc/ssh/ssh_config ~/dotfiles/config/
        echo "Copy Complete!"
        ;;
    $(( ${#options[@]}+1 )) ) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;

    esac

done