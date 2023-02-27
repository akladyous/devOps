select * from mysql.user ;
drop user "boula"@"localhost";

CREATE USER 'boula'@'localhost' IDENTIFIED BY 'paolo';

GRANT ALL PRIVILEGES ON *.* TO 'boula'@'localhost';
SHOW GRANTS FOR "boula"@"localhost";

FLUSH PRIVILEGES;
