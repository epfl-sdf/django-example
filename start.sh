#!/bin/bash
#Démarrage de l'application
#zf170906.1548

#python django_example/manage.py runserver


THEIP=$(/sbin/ifconfig ens18 | /bin/grep "inet ad" | /usr/bin/cut -f2 -d: | /usr/bin/awk '{print $1}')

echo -e "
Afin de garder l'appli permanente, il serait bien de la faire tourner dans un 'screen' avec:
screen -S django       pour entrer dans screen
./start.sh            pour lancer le serveur WEB dans screen
CTRL+a,d              pour sortir de screen en laissant tourner le serveur
screen -r django       pour revenir dans screen
CTRL+d                pour terminer screen
screen -list          pour lister tous les screen en fonctionement
On utilisera ce petit test avec:

http://$THEIP:8000

"

read -p "appuyer une touche pour continuer"



source ./.venv/bin/activate


python django_example/manage.py runserver 0.0.0.0:8000
