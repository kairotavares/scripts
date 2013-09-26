#!/bin/bash

#Install tor-browser
#Add repo
sudo add-apt-repository ppa:upubuntu-com/tor64
#Update and install
sudo apt-get update
sudo apt-get install tor-browser
#Change owner to tor-browser
sudo chown -R $USER /usr/bin/tor-browser
