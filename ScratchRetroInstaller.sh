#!/bin/bash

#install needed software from apt

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get -y install matchbox chromium x11-xserver-utils ttf-mscorefonts-installer xwit sqlite3 libnss3

#create folders for install

sudo mkdir /home/pi/RetroPie/roms/scratch

#copy appropriate script files

cd /home/pi/RetroPie/roms/scratch
sudo wget https://github.com/punkbass/ScratchRetroPie/raw/master/Pony-Math.sh
sudo wget https://github.com/punkbass/ScratchRetroPie/raw/master/Scratch-Napped.sh
sudo wget https://github.com/punkbass/ScratchRetroPie/raw/master/Rabbit-Eats-Math-for-Breakfast-Pi.sh
sudo wget https://github.com/punkbass/ScratchRetroPie/raw/master/FOIL-Mario.sh

#Install Scratch to Emulation Station as its own device menu

sudo sed -i -e 's|</systemList>|<system>\n<name>scratch</name>\n<fullname>Scratch</fullname>\n<path>~/RetroPie/roms/scratch</path>\n<extension>.sh .SH</extension>\n<command>xinit /home/pi/RetroPie/roms/scratch/scratch.sh</command>\n<platform>scratch</platform>\n<theme>scratch</theme>\n</system>\n</systemList>|g' /etc/emulationstation/es_systems.cfg
sudo mkdir /etc/emulationstation/themes/simple/scratch
sudo mkdir /etc/emulationstation/themes/simple/scratch/art/

cd /etc/emulationstation/themes/simple/scratch/
sudo wget https://github.com/punkbass/ScratchRetroPie/raw/master/minecraftmenu/theme.xml

cd /etc/emulationstation/themes/simple/scratch/art/
sudo wget https://github.com/punkbass/ScratchRetroPie/raw/master/minecraftmenu/art/scratch.png
sudo wget https://github.com/punkbass/ScratchRetroPie/raw/master/minecraftmenu/art/scratch_art.png
sudo wget https://github.com/punkbass/ScratchRetroPie/raw/master/minecraftmenu/art/scratch_art_blur.png

cd /home/pi/RetroPie/roms/scratch

#Chmod scripts to be runnable

sudo chmod +x Pony-Math.sh
sudo chmod +x Scratch-Napped.sh
sudo chmod +x Rabbit-Eats-Math-for-Breakfast-Pi.sh
sudo chmod +x Foil-Mario.sh

echo -e "\nEverything done! \n"
