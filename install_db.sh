#!/bin/bash
#Installation de l'application
#zf170421.0938

echo ------------ Tequila DJANGO admin user
echo "Enter your Tequila username: " ; read zUSER
echo "Enter your email adress: " ; read zEMAIL

echo ------------ credentials
DB_ROOT_PASSWORD=`cat ../django-example.secrets.json | jq -r '.DB_ROOT_PASSWORD'`
echo $DB_ROOT_PASSWORD
DB_PASSWORD=`cat ../django-example.secrets.json | jq -r '.DB_PASSWORD'`
echo $DB_PASSWORD

echo ------------ apt-get install mysql
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server

echo ------------ mysql_native_password plugin mysql
zSQL=`echo "use mysql;\n"`
zSQL=$zSQL`echo "update user set plugin='mysql_native_password' where User='root';\n"`
zSQL=$zSQL`echo "flush privileges;\n"`
echo -e $zSQL
sudo mysql --user="root" -e "$zSQL"
mysqladmin -u root password $DB_ROOT_PASSWORD
sudo apt-get install -y libmysqlclient-dev

echo ------------ create table django_example
source ./.venv/bin/activate
zSQL=`echo "CREATE DATABASE django_example;\n"`
zSQL=$zSQL`echo "CREATE USER "django_example"@"localhost";\n"`
zSQL=$zSQL`echo "SET password FOR "django_example"@"localhost" = password('$DB_PASSWORD');\n"`
zSQL=$zSQL`echo "GRANT ALL ON django_example.* TO "django_example"@"localhost";\n"`
echo -e $zSQL
mysql --user="root" --password=$DB_ROOT_PASSWORD -e "$zSQL"

echo ------------ DJANGO makemigrations
python ./django_example/manage.py makemigrations
python ./django_example/manage.py migrate
python ./django_example/manage.py createsuperuser --username=$zUSER --email=$zEMAIL



#show databases
#select user from mysql.user;
#drop user 'django_example'@'localhost'
#drop database django_example;
