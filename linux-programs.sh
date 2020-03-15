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

#1
function installTools {
    sudo apt-get install -y unzip unrar adb android-tools-adb android-tools-fastboot zsh dconf-cli gnome-session qbittorrent net-tools vlc flatpak qemu qemu-kvm bridge-utils virt-manager &&
    sudo usermod -a -G libvirt-qemu tchelo
    echo "Tools $msg"

}

#2
function google-Chrome {
    GOOGLE=https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    wget $GOOGLE -O google-chrome.deb
    sudo dpkg -i google-chrome.deb
    rm google-chrome.deb
    echo "Google Chrome $msg"
}

#3
function vsCode {
    VSCODE=https://az764295.vo.msecnd.net/stable/26076a4de974ead31f97692a0d32f90d735645c0/code_1.41.1-1576681836_amd64.deb
    wget $VSCODE -O vscode.deb
    sudo dpkg -i vscode.deb
    rm vscode.deb
    echo "VSCode $msg"
}

#4
function gitKraken {
    GK=https://release.axocdn.com/linux/gitkraken-amd64.deb
    wget $GK -O gk.deb
    sudo dpkg -i gk.deb
    rm gk.deb
    echo "GitKraken $msg"
}

#5
function disCord {
    DISCORD=https://dl.discordapp.net/apps/linux/0.0.9/discord-0.0.9.deb
    wget $DISCORD -O discord.deb
    sudo dpkg -i discord.deb
    rm discord.deb
    echo "Disord $msg"
}

#6
function virtualBox {
    VB=https://download.virtualbox.org/virtualbox/6.1.4/virtualbox-6.1_6.1.4-136177~Ubuntu~eoan_amd64.deb
    wget $VB -O vm.deb
    sudo dpkg -i vm.deb
    echo "VirtualBox $msg"
    rm vm.deb
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
    rm org.gimp.GIMP.flatpakref
    echo "Gimp $msg"
}

#9
function Insomnia {
    INSOMNIA=https://github-production-release-asset-2e65be.s3.amazonaws.com/56899284/e217bd00-5296-11ea-98da-f03d5d4bdcc8?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20200306%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200306T092751Z&X-Amz-Expires=300&X-Amz-Signature=94aea447b4309770037319bbe3769ef90e06a889c0d76009223addcad9194e26&X-Amz-SignedHeaders=host&actor_id=24213290&response-content-disposition=attachment%3B%20filename%3Dinsomnia_7.1.1_amd64.deb&response-content-type=application%2Foctet-stream
    wget $INSOMNIA -O insomnia.deb
    sudo dpkg -i insomnia
    rm insomnia.deb
    echo "Insomnia $msg"
}

#10
function Java8 {
    if [ -e "/usr/lib/jvm" ]; then
        echo "Directory exists"
    else
        sudo mkdir /usr/lib/jvm
    fi

    if [ -e "/usr/lib/jvm/jdk-8u241-linux-x64.tar.gz" ]; then
        echo "File exists"
    else
        echo "Downloading Java JDK 8..."
        sudo wget https://master.dl.sourceforge.net/project/javajdk-8/JDK8/jdk-8u241-linux-x64.tar.gz -P /usr/lib/jvm/
    fi

    cd /usr/lib/jvm/
    echo "Extracting the files...\n"
    sudo tar -xf jdk-8u241-linux-x64.tar.gz
    sudo rm jdk-8u241-linux-x64.tar.gz
    sudo wget https://master.dl.sourceforge.net/project/javajdk-8/JDK8/jdk.sh -P /etc/profile.d/
    sudo chmod +x /etc/profile.d/jdk.sh
    sudo ln -s /usr/lib/jvm/jdk1.8.0_241/bin/java /usr/bin/java
    sudo ln -s /usr/lib/jvm/jdk1.8.0_241/bin/javac /usr/bin/javac
}

#11
function xdMan {
    wget https://ufpr.dl.sourceforge.net/project/xdman/old-releases/xdman.deb
    sudo dpkg -i xdman.deb
    rm xdman.deb
    echo "Xtreme Download Manager $msg"
}

#12
function Oh-My-ZSH {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    echo "Do you want to install Dracula Theme and plugins? [Y/n] "
    read start
    if [ $start == "y" ]; then
        #Dracula Theme
        git clone https://github.com/dracula/gnome-terminal && cd gnome-terminal
        ./install.sh

        cd && rm -rf gnome-terminal
        Install Spaceship
        git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
        ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

        #ZSH Plugins
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
        echo "Plugins installed"
    
    else
        echo "Plugins not installed"
    fi
    echo "Oh-My-ZSH $msg"
}

#13
function anyDesk {
    ANYDESK=https://download.anydesk.com/linux/anydesk_5.5.4-1_amd64.deb
    wget $ANYDESK -O anyD.deb
    sudo dpkg -i anyD.deb
    rm anyD.deb
    echo "AnyDesk $msg"
}

#14
function installAll {
    installTools
    google-Chrome
    vsCode
    gitKraken
    disCord
    virtualBox
    Timeshift
    gimp
    Insomnia
    Java8
    xdMan
    anyDesk
    Oh-My-ZSH
}

function menu {
	clear
    unset option
    echo "$option"
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
	echo -e "\e${k}[00] Install All \e"
    echo -e "\e${k}[0] Exit  \e"                "\t\t\t [[7] Timeshift"
    echo -e "\e${k}[1] Tools \e"                 "\t\t\t [[8] Gimp"
	echo -e "\e${k}[2] Google Chrome \e"         "\t\t [[9] Insomnia"
	echo -e "\e${k}[3] Visual Studio Code \e"    "\t\t [[10] Java JDK 8"
	echo -e "\e${k}[4] GitKraken \e"             "\t\t\t [[11] Xtreme Download Manager"
	echo -e "\e${k}[5] Discord \e"               "\t\t\t [[12] Oh-My-ZSH"
    echo -e "\e${k}[6] VirtualBox \e"            "\t\t\t [[13] AnyDesk"
    echo
    read -a option -p "Type an option and press <ENTER>: "
	
}
while [ 1 ]
do
    menu
    case $option in
    00) installAll ;;
    0)
    exit
    break;;  
    1) installTools ;;
    2) google-Chrome ;;
    3) vsCode ;;
    4) gitKraken ;;
    5) disCord ;;
    6) virtualBox ;;
    7) Timeshift ;;
    8) gimp ;;
    9) Insomnia ;;
    10) Java8 ;;
    11) xdMan ;;
    12) Oh-My-ZSH ;;
    13) anyDesk ;;

    *)
    echo "Sorry, wrong selection";;
    esac
    echo -en "Press <Enter> to continue or <Ctrl+x> to exit"
	read -n 1
    
done
clear
