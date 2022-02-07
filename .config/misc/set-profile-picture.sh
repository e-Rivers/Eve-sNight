#!/bin/sh

if [[ -f $1 ]]; then
    echo "It's strongly recommended that the image has a resolution of 500x500, otherwise it could be displayed wrongly or not displayed at all..."
    echo ""
    echo "Where you want to set the profile picture?"
    echo "[1] Only on Display Manager (LightDM) [Requires SUDO privileges]"
    echo "[2] Only on Window Manager (AwesomeWM)"
    echo "[3] On both of them [Requires SUDO privileges]"
    read -p "Select an option: " CHOICE
    # Sets the profile picture for the Display Manager (LightDM)
    if [ $CHOICE == 1 ]; then
        USER=$(whoami)
        echo -e "[User]\nXSession=awesome\nIcon=/var/lib/AccountsService/icons/${USER}.icon\nSystemAccount=false" > ${USER}_user_config
        sudo mv ${USER}_user_config /var/lib/AccountsService/users/${USER}
        sudo cp $1 /var/lib/AccountsService/icons/${USER}.icon
    # Sets the profile picture for the Window Manager (AwesomeWM)
    elif [ $CHOICE == 2 ]; then
        cp $1 /home/$(whoami)/.config/awesome/theme/pictures/$(whoami).png
    # Sets the profile picture for both
    elif [ $CHOICE == 3 ]; then
        USER=$(whoami)
        echo -e "[User]\nXSession=awesome\nIcon=/var/lib/AccountsService/icons/${USER}.icon\nSystemAccount=false" > ${USER}_user_config
        sudo mv ${USER}_user_config /var/lib/AccountsService/users/${USER}
        sudo cp $1 /var/lib/AccountsService/icons/${USER}.icon
        cp $1 /home/$(whoami)/.config/awesome/theme/pictures/$(whoami).png
    else
        echo "INVALID OPTION CHOSEN..."
    fi
else
    echo "SELECTED FILE DOESN'T EXIST..."
fi
