#!/bin/sh
#Script to fix numlock off after boot
#Kairo Tavares
#kairotavares@gmail.com

echo 'Fixing numlock off at boot...'
sudo apt-get install --fix-missing -y numlockx
echo 'Configuring numlock to  turn on after boot...'
sudo echo 'greeter-setup-script=/usr/bin/numlockx on' >> /etc/lightdm/lightdm.conf
echo 'Done!'


