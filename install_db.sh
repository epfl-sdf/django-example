#!/bin/bash
#Installation de l'application
#zf170420.1653

echo "Enter your Tequila username: " ; read zUSER
echo "Enter your email adress: " ; read zEMAIL

source ./.venv/bin/activate

zPASSWORD=`cat ../django-example.secrets.json | python -c "import json, sys; print(json.loads(sys.stdin.read())['DB_PASSWORD'])"`

zSQL=`echo "CREATE DATABASE django_example;\n"`
zSQL=$zSQL`echo "CREATE USER "django_example"@"localhost";\n"`
zSQL=$zSQL`echo "SET password FOR "django_example"@"localhost" = password('$zPASSWORD');\n"`
zSQL=$zSQL`echo "GRANT ALL ON django_example.* TO "django_example"@"localhost";\n"`

echo -e $zSQL

mysql --user="root" --password=$zPASSWORD -e "$zSQL"

python ./django_example/manage.py makemigrations
python ./django_example/manage.py migrate
python ./django_example/manage.py createsuperuser --username=$zUSER --email=$zEMAIL --password=""



#show databases
#select user from mysql.user;
#drop user 'django_example'@'localhost'
#drop database django_example;
