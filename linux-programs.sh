#!/bin/bash
:<<'*'
tweaks
user themes
Dash to Panel
Sound Input & Output Device Chooser
https://blog.rocketseat.com.br/terminal-com-oh-my-zsh-spaceship-dracula-e-mais/
*
sudo apt install update && apt upgrade -y
clear

k='\033[01;32m'
echo
echo "${k}████████╗ ██████╗██╗  ██╗███████╗██╗      ██████╗ ";
echo "${k}╚══██╔══╝██╔════╝██║  ██║██╔════╝██║     ██╔═══██╗";
echo "${k}   ██║   ██║     ███████║█████╗  ██║     ██║   ██║";
echo "${k}   ██║   ██║     ██╔══██║██╔══╝  ██║     ██║   ██║";
echo "${k}   ██║   ╚██████╗██║  ██║███████╗███████╗╚██████╔╝";
echo "${k}   ╚═╝    ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝ ";
echo "${k} /_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/";
# -------------------------------------------------------------#
echo
printf "Linux post format script that installs some devs programs.\n"
printf "Press Y to continue the installation or N to canceled: "
read opcao
case $opcao in

y)

sudo apt-get install -y wget curl git zsh dconf-cli gnome-session qbittorrent net-tools vlc flatpak qemu qemu-kvm bridge-utils virt-manager

sudo usermod -a -G libvirt-qemu tchelo

#oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

chsh -s /bin/zsh

#Dracula Theme
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh

cd
rm -rf gnome-terminal

#Install Spaceship
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

#ZSH Plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

#Download Google Chrome
GOOGLE=https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget $GOOGLE -O google-chrome.deb
sudo dpkg -i google-chrome.deb
rm google-chrome.deb

#Download VSCode
VSCODE=https://az764295.vo.msecnd.net/stable/26076a4de974ead31f97692a0d32f90d735645c0/code_1.41.1-1576681836_amd64.deb
wget $VSCODE -O vscode.deb
sudo dpkg -i vscode.deb
rm vscode.deb

: <<'GitKraken'
GK=https://release.axocdn.com/linux/gitkraken-amd64.deb
wget $GK -O gk.deb
sudo dpkg -i gk.deb
rm gk.deb
GitKraken

#Discord
DISCORD=https://dl.discordapp.net/apps/linux/0.0.9/discord-0.0.9.deb
wget $DISCORD -O discord.deb
sudo dpkg -i discord.deb
rm discord.deb

:<<'F'
#Download Firefox
cd /opt/
FIREFOX=https://download-installer.cdn.mozilla.net/pub/firefox/releases/72.0.2/linux-x86_64/pt-BR/firefox-72.0.2.tar.bz2
sudo wget $FIREFOX -O firefox.bz2
sudo tar -xf firefox.bz2
sudo rm firefox.bz2
cd
F

sudo apt autoremove firefox

#Download VirtualBox
VB=https://download.virtualbox.org/virtualbox/6.1.2/virtualbox-6.1_6.1.2-135662~Ubuntu~bionic_amd64.deb
wget $VB -O vm.deb
sudo dpkg -i vm.deb
rm vm.deb

#PPA Timeshift
sudo add-apt-repository -y ppa:teejee2008/ppa
sudo apt-get update
sudo apt-get install timeshift

#Gimp
GIMP=https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref
sudo flatpak install $GIMP

# Insomnia
# Add to sources
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

# Add public key used to verify code signature
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add -

# Refresh repository sources and install Insomnia
sudo apt-get update
sudo apt-get install insomnia

# Java JDK 8
sudo mkdir /usr/lib/jvm
JDK=https://master.dl.sourceforge.net/project/javajdk-8/JDK8/jdk-8u241-linux-x64.tar.gz
PATH=https://master.dl.sourceforge.net/project/javajdk-8/JDK8/jdk.sh
sudo wget $JDK -P /usr/lib/jvm/
cd /usr/lib/jvm/
sudo tar -xf jdk-8u241-linux-x64.tar.gz
sudo rm jdk-8u241-linux-x64.tar.gz
sudo wget $PATH -P /etc/profile.d/
sudo chmod +x /etc/profile.d/jdk.sh
sudo ln -s /usr/lib/jvm/jdk1.8.0_241/bin/java /usr/bin/java
sudo ln -s /usr/lib/jvm/jdk1.8.0_241/bin/javac /usr/bin/javac
cd

# Xtreme Download Manager
XDM=https://ufpr.dl.sourceforge.net/project/xdman/xdm-2018-x64.tar.xz
wget $XDM -O xdm.tar.xz
tar -xf xdm.tar.xz
chmod +x install.sh
sudo ./install.sh
rm xdm.tar.xz install.sh readme.txt
;;

n)
echo
printf "installation canceled :( \n"
;;
esac

