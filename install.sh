#!/bin/bash
#Installation de l'application
#zf170420.172900

echo ------------ start install
echo ------------ apt-get update
sudo apt-get update

echo ------------ apt-get install utils
sudo apt-get install -y gnupg2 jq

echo ------------ apt-get install python3
sudo apt-get install -y python3 python3-pip

echo ------------ apt-get install mysql
./acb_uncrypt.sh
zPASSWORD=`cat ../django-example.secrets.json | jq -r '.DB_ROOT_PASSWORD'`
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password $zPASSWORD'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password $zPASSWORD'
sudo apt-get install -y mysql-server libmysqlclient-dev

echo ------------ install virtualenv
sudo pip3 install virtualenv
virtualenv ./.venv
source ./.venv/bin/activate

echo ------------ install DJANGO requirements
pip install -r requirements/base.txt
