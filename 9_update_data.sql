/* Purpose: update data
Script Date 04/02/2019
Developed By: Sergei
*/

/* in order to create a new db, switch to the master db */
/* add a statment that specified the script runs in the context of the master db */

-- switch to the master database
-- SYNTAX: use database_name

use Northwind2019;
go -- include end of batch marlers (go statement)

select *
from Sales.Orders
;
go

/* update data
SYNTAX:
update schema_name.object_name
set column_name = expression
*/

/* update OrderDate, RequiredDate, ShippedDate
1998 --> 2019
1997 --> 2018
1996 --> 2017
by adding 21 years
*/

/* use DATEADD (datepart , number , date )  */
-- OrderDate
update Sales.Orders
set OrderDate = DATEADD (year, 21, OrderDate ) 
;
go

-- RequiredDate
update Sales.Orders
set RequiredDate = DATEADD (year, 21, RequiredDate ) 
;
go

-- ShippedDate
update Sales.Orders
set ShippedDate = DATEADD (year, 21, ShippedDate ) 
where ShippedDate is not null
;
go

/********************************************************************************************************/
select *
from [HumanResources].[Employees]
;
go

/*Modify BithDate by adding years*/
-- BirthDate
update HumanResources.Employees
set BirthDate = DATEADD (year, 21, BirthDate ) 
;
go

/* reduce the hire date */
-- HireDate
update HumanResources.Employees
set HireDate = DATEADD (year, 10, HireDate ) 
where EmployeeID in (3, 6, 7, 9)
;
go

/* return seniority */ 
select EmployeeID, BirthDate, HireDate,
	datediff (year, HireDate, getdate()) as 'seniority' 
	from HumanResources.Employees
	;
	go

/* make the seniority value = 2 for Employee No. 1, 8 */
-- 1 7
update HumanResources.Employees
set HireDate = DATEADD (year, -1, HireDate ) 
where EmployeeID in (1)
;
go
-- 2 7
update HumanResources.Employees
set HireDate = DATEADD (year, 21, HireDate ) 
where EmployeeID in (2)
;
go
-- 3 6
update HumanResources.Employees
set HireDate = DATEADD (year, -10, HireDate ) 
where EmployeeID in (3)
;
go
-- 4 6
update HumanResources.Employees
set HireDate = DATEADD (year, 20, HireDate ) 
where EmployeeID in (4)
;
go
-- 5 5
update HumanResources.Employees
set HireDate = DATEADD (year, 21, HireDate ) 
where EmployeeID in (5)
;
go
-- 6 4
update HumanResources.Employees
set HireDate = DATEADD (year, 12, HireDate ) 
where EmployeeID in (6)
;
go
-- 7 3
update HumanResources.Employees
set HireDate = DATEADD (year, 12, HireDate ) 
where EmployeeID in (7)
;
go
-- 8 2
update HumanResources.Employees
set HireDate = DATEADD (year, -14, HireDate ) 
where EmployeeID in (8)
;
go
-- 9 1
update HumanResources.Employees
set HireDate = DATEADD (year, 14, HireDate ) 
where EmployeeID in (9)
;
go

/* return seniority */ 
select EmployeeID, BirthDate, HireDate,
	datediff (year, HireDate, getdate()) as 'seniority' 
	from HumanResources.Employees
	;
	go