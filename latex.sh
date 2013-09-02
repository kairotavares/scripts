#!/bin/bash
echo "Installing latex"
sudo apt-get install --fix-missing -y texlive-full  
sudo apt-get install --fix-missing -y texmaker
echo "Done"
exit