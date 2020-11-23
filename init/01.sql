CREATE DATABASE IF NOT EXISTS mydatabase;
USE mysql;
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT ALL ON mydatabase.* TO 'root'@'%';