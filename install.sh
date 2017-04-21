#!/bin/bash
#Installation de l'application
#zf170421.0939

echo ------------ start install
echo ------------ apt-get update
sudo apt-get update

echo ------------ apt-get install utils
sudo apt-get install -y gnupg2 jq

echo ------------ secrets uncrypt
./acb_uncrypt.sh

echo ------------ apt-get install python3
sudo apt-get install -y python3 python3-pip

echo ------------ install virtualenv
sudo pip3 install virtualenv
virtualenv ./.venv
source ./.venv/bin/activate

echo ------------ install DJANGO requirements
pip install -r requirements/base.txt
