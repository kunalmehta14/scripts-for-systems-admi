### Creating a new user
> Incoming connection from specific host
````
CREATE USER '<username>'@'<hostname/ip>' IDENTIFIED WITH mysql_native_password BY '<userpassword>';
````
> Incoming connection from any host
````
CREATE USER '<username>'@'%' IDENTIFIED WITH mysql_native_password BY '<userpassword>';
````
### View existing users
````
SELECT user FROM mysql. user
````
### Show permissions of an existing user
````
SHOW GRANTS FOR '<user>'@'<host>';
````
### Granting Permissions
> To specific database and table
````
GRANT PRIVILEGE ON <databasename>.<tablename> TO 'username'@'host';
````
> To all tables in a specific table
````
GRANT PRIVILEGE ON <databasename>.* TO 'username'@'host';
````
> To all databases on the server
````
GRANT PRIVILEGE ON *.* TO 'username'@'host';
````
> To all databases on the server
````
GRANT PRIVILEGE ON *.* TO 'username'@'host';
````
> To allow specific permission select from the following options:
>
> Use the following syntax:
````
GRANT <option> ON *.* TO 'username'@'host';
````
- ALL [PRIVILEGES]	Grant all privileges at specified access level except GRANT OPTION and PROXY.
- ALTER	Enable use of ALTER TABLE. Levels: Global, database, table.
- ALTER ROUTINE	Enable stored routines to be altered or dropped. Levels: Global, database, routine.
- CREATE	Enable database and table creation. Levels: Global, database, table.
- CREATE ROLE	Enable role creation. Level: Global.
- CREATE ROUTINE	Enable stored routine creation. Levels: Global, database.
- CREATE TABLESPACE	Enable tablespaces and log file groups to be created, altered, or dropped. Level: Global.
- CREATE TEMPORARY TABLES	Enable use of CREATE TEMPORARY TABLE. Levels: Global, database.
- CREATE USER	Enable use of CREATE USER, DROP USER, RENAME USER, and REVOKE ALL PRIVILEGES. Level: Global.
- CREATE VIEW	Enable views to be created or altered. Levels: Global, database, table.
- DELETE	Enable use of DELETE. Level: Global, database, table.
- DROP	Enable databases, tables, and views to be dropped. Levels: Global, database, table.
- DROP ROLE	Enable roles to be dropped. Level: Global.
- EVENT	Enable use of events for the Event Scheduler. Levels: Global, database.
- EXECUTE	Enable the user to execute stored routines. Levels: Global, database, routine.
- FILE	Enable the user to cause the server to read or write files. Level: Global.
- GRANT OPTION	Enable privileges to be granted to or removed from other accounts. Levels: Global, database, table, routine, proxy.
- INDEX	Enable indexes to be created or dropped. Levels: Global, database, table.
- INSERT	Enable use of INSERT. Levels: Global, database, table, column.
- LOCK TABLES	Enable use of LOCK TABLES on tables for which you have the SELECT privilege. Levels: Global, database.
- PROCESS	Enable the user to see all processes with SHOW PROCESSLIST. Level: Global.
- PROXY	Enable user proxying. Level: From user to user.
- REFERENCES	Enable foreign key creation. Levels: Global, database, table, column.
- RELOAD	Enable use of FLUSH operations. Level: Global.
- REPLICATION CLIENT	Enable the user to ask where source or replica servers are. Level: Global.
- REPLICATION SLAVE	Enable replicas to read binary log events from the source. Level: Global.
- SELECT	Enable use of SELECT. Levels: Global, database, table, column.
- SHOW DATABASES	Enable SHOW DATABASES to show all databases. Level: Global.
- SHOW VIEW	Enable use of SHOW CREATE VIEW. Levels: Global, database, table.
- SHUTDOWN	Enable use of mysqladmin shutdown. Level: Global.
- SUPER	Enable use of other administrative operations such as CHANGE REPLICATION SOURCE TO, CHANGE MASTER TO, KILL, PURGE BINARY LOGS 
SET GLOBAL, and mysqladmin debug command. Level: Global.
- TRIGGER	Enable trigger operations. Levels: Global, database, table.
- UPDATE	Enable use of UPDATE. Levels: Global, database, table, column.
- USAGE	Synonym for “no privileges”
