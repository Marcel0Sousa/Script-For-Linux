#!/bin/bash
:<<'*'
tweaks
user themes
Dash to Panel
Sound Input & Output Device Chooser
https://blog.rocketseat.com.br/terminal-com-oh-my-zsh-spaceship-dracula-e-mais/
*
sudo apt install update && apt dist-upgrade -y
pk= sudo apt install -y wget curl git
msg="successfully installed!"

function ComeBack {
echo "Press <ENTER> to return to the main menu or CTRL + C to exit"
read 'enter'
menu
}

#1
function installTools {
	#sudo apt-get install -y unzip unrar adb android-tools-adb android-tools-fastboot zsh dconf-cli gnome-session qbittorrent net-tools vlc flatpak qemu qemu-kvm bridge-utils virt-manager &&
    #sudo usermod -a -G libvirt-qemu tchelo
    $pk
    echo "Tools $msg"
    ComeBack
}

#2
function google-Chrome {
    GOOGLE=https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    wget $GOOGLE -O google-chrome.deb
    sudo dpkg -i google-chrome.deb
    rm google-chrome.deb
    echo "Google Chrome $msg"
    ComeBack
}

#3
function vsCode {
    VSCODE=https://az764295.vo.msecnd.net/stable/26076a4de974ead31f97692a0d32f90d735645c0/code_1.41.1-1576681836_amd64.deb
    wget $VSCODE -O vscode.deb
    sudo dpkg -i vscode.deb
    rm vscode.deb
    echo "VSCode $msg"
    ComeBack
}

#4
function gitKraken {
    GK=https://release.axocdn.com/linux/gitkraken-amd64.deb
    wget $GK -O gk.deb
    sudo dpkg -i gk.deb
    rm gk.deb
    echo "GitKraken $msg"
    ComeBack
}

#5
function disCord {
    DISCORD=https://dl.discordapp.net/apps/linux/0.0.9/discord-0.0.9.deb
    wget $DISCORD -O discord.deb
    sudo dpkg -i discord.deb
    rm discord.deb
    echo "Disord $msg"
    ComeBack
}

#6
function virtualBox {
    VB=https://download.virtualbox.org/virtualbox/6.1.4/virtualbox-6.1_6.1.4-136177~Ubuntu~eoan_amd64.deb
    wget $VB -O vm.deb
    sudo dpkg -i vm.deb
    echo "VirtualBox $msg"
    rm vm.deb
    ComeBack
}

#7
function Timeshift {
    sudo add-apt-repository -y ppa:teejee2008/ppa -y
    sudo apt-get update
    sudo apt-get install timeshift
    echo "Timeshift $msg"
}

#8
function gimp {
    GIMP=https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref
    sudo flatpak install $GIMP
    echo "Gimp $msg"
}

#13
function anyDesk {
    ANYDESK=https://download.anydesk.com/linux/anydesk_5.5.4-1_amd64.deb
    wget $ANYDESK -O anyD.deb
    sudo dpkg -i anyD.deb
    rm anyD.deb
    echo "AnyDesk $msg"
    ComeBack
}

function menu {
	clear
	k='\033[01;32m'
    echo
    echo -e "\e${k}████████╗ ██████╗  ██████╗ ██╗     ███████╗\e";
    echo -e "\e${k}╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝\e";
    echo -e "\e${k}   ██║   ██║   ██║██║   ██║██║     ███████╗\e";
    echo -e "\e${k}   ██║   ██║   ██║██║   ██║██║     ╚════██║\e";
    echo -e "\e${k}   ██║   ╚██████╔╝╚██████╔╝███████╗███████║\e";
    echo -e "\e${k}   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝\e";
    echo -e "\e${k} /_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/\e";
    echo
    echo -e "\e${k}By Tchelo\e"
    # -------------------------------------------------------------#
	echo
    echo -e "\t\t\t\e${k}MENU  \e"
    echo
	echo -e "\e${k}[0] Exit  \e"                 "\t\t\t\e [[7] Timeshift"
    echo -e "\e${k}[1] Tools \e"                 "\t\t\t\e [[8] Gimp"
	echo -e "\e${k}[2] Google Chrome \e"         "\t\t\e [[9] Insomnia"
	echo -e "\e${k}[3] Visual Studio Code \e"    "\t\t\e [[10] Java JDK 8"
	echo -e "\e${k}[4] GitKraken \e"             "\t\t\t\e [[11] Xtreme Download Manager"
	echo -e "\e${k}[5] Discord \e"               "\t\t\t\e [[12] Oh-My-ZSH"
    echo -e "\e${k}[6] VirtualBox \e"            "\t\t\t\e [[13] AnyDesk"
    echo
	echo -en "\t\t\e${k}Enter an Option: \e"
	read -n 1 option
}

while [ 1 ]
do
        menu
        case $option in
        0) echo "$option"; exit;;
        1) echo "$option"; installTools ;;
        2) echo "$option"; google-Chrome ;;
        3) echo "$option"; vsCode ;;
        4) echo "$option"; gitKraken ;;
        *)
        clear
        echo "Sorry, wrong selection";;
        esac
        echo -en "\n\n\t\t\tHit any key to continue"
	    read -n 1 line
done
clear
