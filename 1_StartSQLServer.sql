/* Purpose: Create the FoodCo database
Script Date 3/28/2019
Developed By: Sergei
*/

/* in order to create a new db, switch to the master db */
/* add a statment that specified the script runs in the context of the master db */

-- switch to the master database
-- SYNTAX: use database_name

use master;
go -- include end of batch marlers (go statement)

/* SYNTAX: create object_type object_name */
create database FoodCo
on primary
(
	-- logical ROWS Data file name
	name = 'FoodCo',
	-- Logical ROWS Data path and file name
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FoodCo.mdf', 
	-- Logical ROWS Data file size
	size = 12MB,
	-- Logical ROWS Data growth file size
	filegrowth = 2MB,
	-- Logical ROWS Data max file size
	maxsize = 100MB
)
-- log file
log on
(
	-- log file name
	name = 'FoodCo_log',
	-- Log path and file name
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FoodCo_log.ldf', 
	-- Logi file size (1/4 of the rows data file)
	size = 3MB,
	-- Log growth file size
	filegrowth = 10%,
	-- Log max file size
	maxsize = 10MB
)
;
go

/* increase the maxsize of the FoodCo database log file to 25MB */
use master;
go
alter database FoodCo
	modify file
	(
		name = 'FoodCo_log',
		maxsize = 25MB
	)
;
go

/* using some system functions */

/* determine whith activity is yours 56 */
select @@SPID as 'SP ID';
go

/* execute a system stored procedure, sp_who, using your spid value */
execute sp_who 56;
go

/* return whitch version of SQL Server your are running. 
return the connection, db context and server information */
select @@VERSION;
go

select 
USER_NAME() as 'User Name',
DB_NAME() as 'Database Name',
@@SERVERNAME as 'Server Name'
;
go

/* drop MyDB1 and FoodCo databases 
drop database MyDB1, FoodCo;
go

1. create the Northwind DB
2. create schema
2a. 
3. create tables
4. apply data integrity using constraints
5. populate data
6. manipulate data
7. create views
8. functions
9. index (clustered and nonclustered)
10. stored procedures
11. triggers
12. transactions
13. using XML and JSON
*/