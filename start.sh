#!/bin/bash
#Démarrage de l'application
#zf171001.1730

#python django_example/manage.py runserver

echo -e " 
Afin de garder le serveur WEB permanent, il serait bien de le faire tourner dans un 'screen' avec:
screen -S django      pour entrer dans screen
./start.sh            pour lancer le serveur WEB dans screen
CTRL+a,d              pour sortir de screen en laissant tourner le serveur
screen -r django      pour revenir dans screen
screen -x django      pour revenir à plusieurs dans screen
CTRL+d                pour terminer screen
screen -list          pour lister tous les screens en fonctionement
"

source ./.venv/bin/activate
python django_example/manage.py runserver 0.0.0.0:8000
