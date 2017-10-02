#!/bin/bash
#Démarrage de l'application
#zf171002.0913

#python django_example/manage.py runserver

THEIP=$(/sbin/ifconfig ens18 | /bin/grep "inet ad" | /usr/bin/cut -f2 -d: | /usr/bin/awk '{print $1}')
echo -e " 
Afin de garder le serveur WEB permanent, il serait bien de le faire tourner dans un 'screen' avec:
screen -S django      pour entrer dans screen
./start.sh            pour lancer le serveur WEB dans screen
CTRL+a,d              pour sortir de screen en laissant tourner le serveur
screen -r django      pour revenir dans screen
screen -x django      pour revenir à plusieurs dans screen
CTRL+d                pour terminer screen
screen -list          pour lister tous les screens en fonctionement

On utilisera ce petit serveur WEB avec:

http://$THEIP:8000
"
read -p "appuyer une touche pour démarrer le serveur WEB"


source ./.venv/bin/activate
python django_example/manage.py runserver 0.0.0.0:8000
