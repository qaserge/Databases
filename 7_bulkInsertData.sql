/* Purpose: Import Data using Bulk
Script Date 04/01/2019
Developed By: Sergei
*/

/* in order to create a new db, switch to the master db */
/* add a statment that specified the script runs in the context of the master db */

-- switch to the master database
-- SYNTAX: use database_name

use FoodCo;
go -- include end of batch marlers (go statement)


/* Bulk insert Sytax 
bulk insert schema_name.table_name
from 'path\filename.ext'
with
(
	FirstRow = 2,
	RowTerminator = '\n',
	FieldTerminator = ','
); go
*/

/* using the insert clause
insert [into] schema_name.table_name (column_name1, column_name2, ...)
value
(value1, value2, ... )
; go
*/

/* insert data from another table
insert [into] schema_name.table_name (column_name1, column_name2, ...)
select (column_name1, column_name2, ...)
from schema_name.another_table_name
; go
*/


/* Bulk insert data into Sales.Customers table */ 
bulk insert Sales.Customers
from 'C:\Users\1896190\Documents\Sergei_IPD-17_JohnAbbottCollege\09 420-P34-AB DATABASE II\Database_II_Winter_2019_Day_04\Data_Sources\Customers.txt'
with
(
	FirstRow = 2,
	RowTerminator = '\n',
	FieldTerminator = '\t'
); 
go

-- DELETE FROM Sales.Customers; go

select *
from Sales.Customers;
go


/* insert data from another table */
insert into Sales.Orders ([CustomerID],[EmployeeID],[OrderDate],[ShipDate],[ShipVia],[Freight],[ShipName],[ShipAddress],[ShipCity])
values ('ALFKI', 1, getdate(), getdate()+3, 123, 50, 'fgdfgfd', 'dfgfdghgjg', 'cghjitghjy' )
; go


/* to reset the auto increment number value (identity),
1. delete all data from the table
	DELETE FROM Sales.Orders; go
2. re-set the start value using the Database Console Command (dbcc). This checks the current identity value for the specified table, if it is needed, changes the identity value.
SYNTAX: IDENTITY [(seed, increment)]
	dbcc checkident (schema_name.table_name, reseed, 0)

	dbcc checkident ('Sales.Orders', reseed, 0); go
	
 */

 insert into Production.Suppliers (CompanyName, Address, City, Region, PostalCode, Country, Phone)
select (CompanyName, Address, City, Region, PostalCode, Country, Phone)
from Sales.Customers
;
go