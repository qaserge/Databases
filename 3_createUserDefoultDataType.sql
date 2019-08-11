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
create type [schema_name.] type_name
from base_type
 */

 /*
 create myAddress data type
 */
 create type myAddress
 from varchar (40) not null;
 go

 /* create Social Security Number data type */
 create type mySIN
 from char(11) not null;
 go

 /* create table Contacts*/
 create table Contacts
 (
	ContactID int identity(1, 1) not null,
	SIN mySIN,
	Address myAddress
 )
 ;
 go


 /* return the defenition of table Contacts */
 execute sp_help 'Contacts'
 ;
 go

 /* drop table Contacts */
drop table Contacts;
go