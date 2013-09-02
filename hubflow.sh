#!/bin/bash
echo "Installing Hubflow"
git clone https://github.com/datasift/gitflow
cd gitflow
sudo ./install.sh
echo "Upgrating Hubflow"
sudo git hf upgrade
echo "Done"
echo "Hubflow at version $(git hf version)"
echo "If you wanna clean the install files, please use the command:"
echo "sudo rm -rf gitflow/"
exit