#!/bin/bash

#install needed software from apt

read -p "Press anykey to start Minecraft install, input sudo credentials if asked `echo $'\n> '`" -n1 -s

sudo apt-get update && sudo apt-get -y install matchbox

#create folders for install

sudo mkdir /home/pi/RetroPie/roms/minecraft

#run minecraft install script

sudo /home/pi/RetroPie-Setup/scriptmodules/ports/minecraft.sh

#copy appropriate script files

cd /home/pi/RetroPie/roms/minecraft/
sudo wget https://github.com/techtipsta/MinecraftRetroPie/raw/master/minecraft2.6.sh
sudo wget https://github.com/techtipsta/MinecraftRetroPie/raw/master/minecraft3.0.sh


#Install Minecraft to Emulation Station as its own device menu

read -p "Installing Minecraft menu to Emulation Station, press anykey to continue `echo $'\n> '`" -n1 -s
sudo sed -i -e 's|</systemList>|<system>\n<name>minecraft</name>\n<fullname>Minecraft</fullname>\n<path>~/RetroPie/roms/minecraft</path>\n<extension>.sh .SH</extension>\n<command>bash %ROM%</command>\n<platform>minecraft</platform>\n<theme>minecraft</theme>\n</system>\n</systemList>|g' /etc/emulationstation/es_systems.cfg
sudo mkdir /etc/emulationstation/themes/simple/minecraft
sudo mkdir /etc/emulationstation/themes/simple/minecraft/art/

cd /etc/emulationstation/themes/simple/minecraft/
sudo wget https://github.com/techtipsta/MinecraftRetroPie/raw/master/minecraftmenu/theme.xml

cd /etc/emulationstation/themes/simple/minecraft/art/
sudo wget https://github.com/techtipsta/MinecraftRetroPie/raw/master/minecraftmenu/art/minecraft.png
sudo wget https://github.com/techtipsta/MinecraftRetroPie/raw/master/minecraftmenu/art/minecraft_art.png
sudo wget https://github.com/techtipsta/MinecraftRetroPie/raw/master/minecraftmenu/art/minecraft_art_blur.png

cd /home/pi/RetroPie/roms/minecraft

#Chmod scripts to be runnable

chmod +x minecraft2.6.sh
chmod +x minecraft3.0.sh

echo -e "\nEverything done! Now reboot the Pi and you are all set \n"