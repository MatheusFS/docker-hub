-- SET PERSIST lower_case_table_names = 1;

-- RENAME USER 'root'@'localhost' TO 'root'@'%';
-- ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'dipass';

-- CREATE USER 'exporter'@'%' IDENTIFIED BY 'dipass' WITH MAX_USER_CONNECTIONS 3;
-- GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'exporter'@'%';

-- CREATE USER 'app'@'%' IDENTIFIED BY 'dipass';
-- GRANT ALL PRIVILEGES ON *.* TO 'app'@'%' WITH GRANT OPTION;

-- FLUSH PRIVILEGES;