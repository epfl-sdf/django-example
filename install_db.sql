CREATE DATABASE django_example;
CREATE USER "django_example"@"localhost";
SET password FOR "django_example"@"localhost" = password('attention un credentail db_password');
GRANT ALL ON django_example.* TO "django_example"@"localhost";





mysql -u root -p
