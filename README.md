# django-example
Example of Hello World in Django with Tequila Authentication


## How to make it work

### Database
* Install MySQL on your system
* Create a database named django_examples (`CREATE DATABASE django_example;`)
* Create a user named django_example (`CREATE USER "django_example"@"localhost"`)
* Set the password for user django_example (`SET password FOR "django_example"@"localhost" = password('le_mot_de_passe')`)
* Give all the rights on the database django_example to the user django_example (`GRANT ALL ON django_example.* TO "django_example"@"localhost"`)

### Secrets file

