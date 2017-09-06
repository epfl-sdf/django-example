#!/bin/bash
#Installation de l'autorité de certification du  reverse proxy mitmproxy
#zf170906.1721

sudo cp ./mitmproxy-ca-cert.crt /usr/share/ca-certificates/mozilla


echo -e "
Il faut maintenant reconfigurer les autorités de certification du système Liinux.

Pour cela vous devez 'chercher' l'autorité 'mozilla/mitmproxy-ca-cert.crt' et lui mettre une petit étoile !
Puis faire <ok>

"

read -p "appuyer une touche pour continuer"

sudo dpkg-reconfigure ca-certificates

