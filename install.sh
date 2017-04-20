#!/bin/bash
#Installation de l'application
#zf170420.1112

#sudo apt-get update
#sudo apt-get install -y gnupg2

#sudo apt-get install -y python3 python3-pip
sudo apt-get install -y mysql-server libmysqlclient-dev

sudo pip3 install virtualenv
virtualenv ./.venv
source ./.venv/bin/activate

pip install -r requirements/base.txt




echo " ne pas oublier ./acb_uncrypt.sh"
