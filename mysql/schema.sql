CREATE SCHEMA production;

RENAME USER 'root'@'localhost' TO 'root'@'%';
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
FLUSH PRIVILEGES;