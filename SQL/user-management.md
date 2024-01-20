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
> To view password restrictions configured on the systems
````
SHOW VARIABLES LIKE 'validate_password%';
````
