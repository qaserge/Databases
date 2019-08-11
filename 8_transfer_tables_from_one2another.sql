/* Purpose: transfer tables from one to another
Script Date 04/02/2019
Developed By: Sergei
*/

/* in order to create a new db, switch to the master db */
/* add a statment that specified the script runs in the context of the master db */

-- switch to the master database
-- SYNTAX: use database_name

use Northwind2019;
go -- include end of batch marlers (go statement)

/* transfer a table from one schema into another
SYNTAX:
alter schema to_schema_name TRANSFER from_schema_name.table.name
*/

--Table No.		Schema_name.Table Name
--======		====================
--1				Sales.Customers
alter schema Sales transfer dbo.Customers
; 
go
--2				Sales.Orders
alter schema Sales transfer dbo.Orders
; 
go
--3				Sales.[Order Details]
alter schema Sales transfer dbo.[Order Details]
; 
go
--4				Production.Products
alter schema Production transfer dbo.Products
; 
go
--5				Production.Suppliers
alter schema Production transfer dbo.Suppliers
; 
go
--6				Production.Categories
alter schema Production transfer dbo.Categories
; 
go
--7				Sales.Shippers
alter schema Sales transfer dbo.Shippers
; 
go
--8				HumanResources.Employees
alter schema HumanResources transfer dbo.Employees
; 
go
--9				Sales.CustomerDemographics
alter schema Sales transfer dbo.CustomerDemographics
; 
go
--10				Sales.CustomerCustomerDemo
alter schema Sales transfer dbo.CustomerCustomerDemo
; 
go
--11				HumanResources.EmployeeTerritories
alter schema HumanResources transfer dbo.EmployeeTerritories
; 
go
--12 				HumanResources.Territories
alter schema HumanResources transfer dbo.Territories
; 
go
--13				HumanResources.Region
alter schema HumanResources transfer dbo.Region
; 
go
