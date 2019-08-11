/* Purpose: Create the FoodCo database
Script Date 3/28/2019
Developed By: Sergei
*/

/* in order to create a new db, switch to the master db */
/* add a statment that specified the script runs in the context of the master db */

-- switch to the master database
-- SYNTAX: use database_name

use FoodCo;
go -- include end of batch marlers (go statement)

/* SYNTAX:
create shema shema_name authorisation owner_name */

/* create schema: Sales, HumanResources and Production */

/* dbo now have the shemas */

create schema Sales authorization dbo;
go
create schema HumanResources authorization dbo;
go
create schema Production authorization dbo;
go

/* create a schema and grant permissions. Create Sports schema owned by Annik that contains tables Teams. 
The statement grants SELECT to Andrew and denies SELECT to David
*/

use mydb;
go

create schema Sport authorization Annik
	create table Teams (MemberID int, teamName varchar(15))
	grant select on schema::Sports to Andrew
	deny select on schema::Sports to David
	;