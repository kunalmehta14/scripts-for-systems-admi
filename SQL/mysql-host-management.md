### Configure Logging
> View Current Logging Settings:
````
SHOW VARIABLES LIKE '%log%';
````
> Enable Error Logs:
````
SET GLOBAL log_error = /var/log/mysql/error.log;
````
> Enable General Logs:
````
SET GLOBAL general_log = ON;
SET GLOBAL general_log_file = /var/lib/mysql/databaseserver.log;
````
> Enable Slow Query Logs: 
````
SET GLOBAL slow_query_log = ON;
SET GLOBAL slow_query_log_file = /var/lib/mysql/databaseserver-slow.log
````
> Enable Log Bin:
````
SET GLOBAL log_bin = ON;
````
> NOTE: To forward these logs to a syslog service, syslog-ng can be used.
> 
> Configure syslog-ng source as the log file path mentioned above and the destination as the syslog service.
