## MSSQL Server Resource Management

### Temp folder for a database
> Review files in the temp folder of a database
````
SELECT * FROM #TEMPSP_WHO
WHERE (DBName=<DB-NAME>) AND (CPUTime > 0) AND (DiskIO > 0)
ORDER BY CPUTime DESC;
````
### Process Resource Utilization
> View process utilization of a specific database
````
SELECT sys.dm_exec_session_wait_stats.session_id, sys.dm_exec_session_wait_stats.wait_type, 
sys.dm_exec_session_wait_stats.wait_time_ms,  #TEMPSP_WHO.Status, #TEMPSP_WHO.Command, 
#TEMPSP_WHO.DBName, #TEMPSP_WHO.CPUTime, sys.dm_exec_sessions.memory_usage, #TEMPSP_WHO.DiskIO

FROM sys.dm_exec_session_wait_stats, #TEMPSP_WHO,  sys.dm_exec_sessions

WHERE ((sys.dm_exec_session_wait_stats.session_id = #TEMPSP_WHO.SPID) OR 
(sys.dm_exec_sessions.session_id = #TEMPSP_WHO.SPID)) AND 
(#TEMPSP_WHO.DBName=<DB-NAME>) AND (#TEMPSP_WHO.CPUTime > 0) AND (#TEMPSP_WHO.DiskIO > 0)

ORDER BY wait_time_ms DESC;
````
### Get database file details

````
USE <DB-NAME>
SELECT * FROM sys.database_files
````
### Backup DB and log files
> Using FULL recovery model
````
BACKUP DATABASE <DB-NAME> TO DISK = '<DISK-LOCATION>\<DB-NAME>.bak'
BACKUP LOG <DB-NAME> TO DISK = '<DISK-LOCATION>\<DB-NAME>_log_backup.trn'
````
### Shrink log files
````
DBCC SHRINKFILE (<DB-NAME>_log, 1)
````