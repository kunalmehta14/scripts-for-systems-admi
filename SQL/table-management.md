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
### Copying data from one table to another (empty) table
````
INSERT INTO <destination_table> (<col1>, <col2>, <col3>...)
SELECT <col1>, <col2>, <col3>... FROM <source_table>;
````
### Copying data from one table to another table which already has values in it
````
UPDATE <destination_table> 
    SET <dest_col_name> = (
        SELECT <source_col_name>
        FROM <source_table>
        WHERE <source_table>.<id> = <destination_table>.<id>
    );
````
### Copying data from one column to another in the same table
````
UPDATE <table_name> SET <dest_col> = <source_col>;
````
### Get Duplicate enteries in a table
````
SELECT <col1>, <col2>... FROM <database_name>.<table_name> GROUP BY <col1>, <col2>...  HAVING COUNT(*) > 1
````
### Find Enteries in a SQL Table that do not have a valid FOREIGN KEY
````
SELECT <table_b>.*
FROM <table_b>
LEFT JOIN <table_a> ON <table_b>.<foreign_key_column | For Example: Id> = <table_a>.<foreign_key_column | For Example: Id>
WHERE <table_b>.<foreign_key_column | For Example: Id> IS NULL
````
### Delete Enteries in a SQL Table that do not have a valid FOREIGN KEY
````
DELETE FROM <table_b>
WHERE Id IN (
    SELECT <table_b>.<table_b_id>
    FROM (
        SELECT <table_b>.<table_b_id>
        FROM <table_b>
        LEFT JOIN <table_a> ON <table_b>.<foreign_key_column | For Example: Id> = <table_a>.<foreign_key_column | For Example: Id>
        WHERE <table_b>.<foreign_key_column | For Example: Id> IS NULL
    ) AS subquery
);
````
