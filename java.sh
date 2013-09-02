#!/bin/sh

echo "Instaling java..."

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer

echo "Done!!!"
