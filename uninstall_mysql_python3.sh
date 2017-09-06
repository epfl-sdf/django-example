#!/bin/bash
#juste pour déinstaller quand ça n'a pas marché du premier et que l'on veut rejouer le script install_all.sh
#zf170906.1554

sudo apt-get --purge -y remove mysql-server mysql-common
#sudo apt-get --purge -y remove python3 python3-pip

echo ---------- clean install
echo ---------- clean
sudo apt-get -y clean
echo ---------- autoclean
sudo apt-get -y autoclean
echo ---------- autoremove
sudo apt-get -y autoremove --purge
echo ---------- install
sudo apt-get -f install               #termine l'installa  si problème dû à l'arrêt du service apt-daily
echo ---------- clean
sudo apt-get -y clean
echo ---------- autoclean
sudo apt-get -y autoclean
echo ---------- autoremove
sudo apt-get -y autoremove --purge


sudo rm -R /etc/mysql/
sudo rm -R /etc/dbconfig-common/
sudo rm -R /var/lib/mysql
sudo rm /root/.my.cnf
