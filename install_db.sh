#!/bin/bash
#Installation de l'application
#zf170420.1112

python ./django_example/manage.py makemigrations
python ./django_example/manage.py migrate
python ./django_example/manage.py createsuperuser --username=czufferey --email=christian.zufferey@epfl.ch
