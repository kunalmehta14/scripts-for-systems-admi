## MySQL Replication Configuraiton
> This document shows how to configre mysql replication topology with primary (r/w) --> secondary (ro)

### PRIMARY/MASTER MySQL Instance Configuration
+ Adding required configuration to the mysql.cnf file:
````
[mysqld]
bind-address=<IP-ADD-OF-HOST/VM-INT>
server_id=1
log_bin=ON
default_authentication_plugin=mysql_native_password
````
+ Create the replication user
````
CREATE USER 'replication_user'@'%' IDENTIFIED WITH mysql_native_password BY '<password>';
````
+ Grant replication_user the required permissions
````
GRANT REPLICATION SLAVE ON *.* TO 'replication_user'@'%';
````
+ Database dump
> The Secondary/Slave server needs to have the same state of the database(s) as the primary/master server.
````
# Addition of '-p' is only required if local authentication for the root user required password
mysqldump -uroot -p -all-databases --master-data > masterdump.sql
````
+ Copy the sql dump file to the slave server
````
scp masterdump.sql <username>@<Secondary-MySQL-IP-ADD>:/path/to/masterdump.sql
````
### SECONDARY/SLAVE MySQL Instance Configuration
+ Adding required configuration to the mysql.cnf file:
````
[mysqld]
bind-address=<IP-ADD-OF-HOST/VM-INT>
server_id=2
default_authentication_plugin=mysql_native_password
````
+ Make secondary MySql server aware about the replication_user
````
CHANGE MASTER TO MASTER_HOST='<Primary-MySQL-IP-ADD>', 
MASTER_USER='replication_user', 
MASTER_PASSWORD='<password>';
````
+ Import the MySql dump on the secondary database
> This is the masterdump.sql file that was exported from the primary mysql instance and copied over to secondary server.
````
mysql -uroot -p < /path/to/masterdump.sql
````
+ Start the slave process
````
START SLAVE;
````
### View replication status:
+ To check Master/Slave process status
````
# Master Status, to be ran on the primary instance
SHOW MASTER\G;
# Slave Status, to be ran on the secondary instance
SHOW SLAVE\G;
````
