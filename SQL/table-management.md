### View Table
> View all tables in a database
````
SELECT table_name
FROM information_schema.tables
WHERE table_type='BASE TABLE' 
	AND TABLE_SCHEMA = '<DB-NAME>';
````
### Create a new table
````
CREATE TABLE <TABLE NAME>(id VARCHAR(100) NOT NULL, 
<COL-2> VARCHAR(100) NOT NULL, <COL-3> BIGINT, 
PRIMARY KEY(id));
````
### Add a new column
> Change the datatype to something of your choice (Eg: DATETIME)
````
ALTER TABLE <DB>.<TABLE> ADD <COLUMN> 
<DATATYPE> NOT NULL;
````
### Update an existing column
> Change the datatype to something of your choice (Eg: BIGINT)
````
ALTER TABLE <DB>.<TABLE> MODIFY COLUMN <COLUMN> 
<DATATYPE> auto_increment NOT NULL;
````
### CSV Import Mysql
> Import a CSV as a table in a database
````
LOAD DATA INFILE '/var/lib/mysql-files/<CSV FILE>'
INTO TABLE <TABLE NAME>
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
````
### Add a composite key
````
ALTER TABLE <table_name> ADD CONSTRAINT 
<PK_constraint_name> PRIMARY KEY (<col1_name, col2_name,...>)
````