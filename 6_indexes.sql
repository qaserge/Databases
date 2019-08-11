/* Purpose: Create indexes for the FoodCo database
Script Date 04/01/2019
Developed By: Sergei
*/

/* in order to create a new db, switch to the master db */
/* add a statment that specified the script runs in the context of the master db */

-- switch to the master database
-- SYNTAX: use database_name

use FoodCo;
go -- include end of batch marlers (go statement)


-- clustered key clustered index

/* 
Syntax:
1. create a non-clustered index on a table (base table ) or a view (virtual table)
create index_type index_name on table_name (column_name)

2. create a clustered index on a table 
create clusteredindex_type index_name on table_name (column_name)
*/

/*
return index information on table Sales.Customers */
execute sp_helpindex 'Sales.Customers';
go

/* the index index_id is unique only within the objects */
select *
from sys.indexes;
go

 select
 name, -- name of the index
 index_id, -- the ID of the index: 0 -> heap, 1 -> clustered, > 1 -> non clustered
 type, -- the ID of the index: 0 -> heap, 1 -> clustered, > 1 -> non clustered, 3 xml, 4 special
 type_desc, -- description index
 is_unique, -- 1 - unique, 0 - non unique
 is_primary_key -- 1 -> index in a part of primary key
 from sys.indexes
 where object_id = OBJECT_ID('Sales.Customers');
 go

 /* check is the emloyee table has indexes */
 execute sp_helpindex 'HumanResources.Employees';
 go

 /* create a non clustered index (ncix_LastName) on the Employees table  LastName */
 create nonclustered index nclix_LastName on HumanResources.Employees (LastName);
 go
 create nonclustered index nclix_PostalCode on HumanResources.Employees (PostalCode);
 go
 


 /* remove the ncix_LastName index from the Employees table */
 drop index HumanResources.Employees.ncix_LastName;
 go

 /* add a unique non-clustered index, u_ncix_ProductName, on the Production.Products table */
 create nonclustered index u_ncix_ProductName on Production.Products (ProductName);
 go
 execute sp_helpindex 'Production.Products';
 go

 
 create nonclustered index u_ncix_ProductName on Production.Products (ProductName);
 go
 execute sp_helpindex 'Production.Products';
 go


 /*    Create indexes on the following tables:

Table Name				Column Name	
==========				================
Employees				LastName	nclix_
*/
/* create a non clustered index (ncix_LastName) on the Employees table  LastName */
 create nonclustered index nclix_LastName on HumanResources.Employees (LastName);
 go
/*						PostalCode	nclix_*/
 create nonclustered index nclix_PostalCode on HumanResources.Employees (PostalCode);
 go
/*
Categories				CategoryName nclix_*/
create nonclustered index nclix_CategoryName on Production.Categories (CategoryName);
 go
/*
Customers				City		nclix_*/
create nonclustered index nclix_City on Sales.Customers (City);
 go
/*						CompanyName	u_nclix_ */
create Unique nonclustered index u_nclix_CompanyName on Sales.Customers (CompanyName);
 go
   
/*						PostalCode	nclix_*/
create nonclustered index nclix_PostalCode on Sales.Customers (PostalCode);
 go
/*						Region		nclix_*/
create nonclustered index nclix_Region on Sales.Customers (Region);
 go
/*
Suppliers				CompanyName	u_nclix_*/
create Unique nonclustered index u_nclix_CompanyName on Production.Suppliers (CompanyName);
 go

/*						PostalCode	nclix_*/
create nonclustered index nclix_PostalCode on Production.Suppliers (PostalCode);
 go
 /*
Orders					CustomerID ? */
drop index Sales.Orders.pk_Orders;
 go
create nonclustered index clix_CustomerID on Sales.Orders (CustomerID);
 go 
/*						EmployeeID */
create nonclustered index clix_EmployeeID on Sales.Orders (EmployeeID);
 go
/*						OrderDate */
create nonclustered index clix_OrderDate on Sales.Orders (OrderDate);
 go
/*						ShippedDate */
create nonclustered index clix_ShippedDate on Sales.Orders (ShippedDate);
 go
/*						ShipVia */
create nonclustered index clix_ShipVia on Sales.Orders (ShipVia);
 go
/*						ShipPostalCode */
create nonclustered index clix_ShipPostalCode on Sales.Orders (ShipPostalCode);
 go
 /*
Products				CategoryID */
create nonclustered index clix_CategoryID on Production.Products (CategoryID);
 go
/*						ProductName 	u_nclix_ */
create Unique nonclustered index u_nclix_ProductName on Production.Products (ProductName);
 go
/*						SupplierID */
create nonclustered index clix_SupplierID on Production.Products (SupplierID);
 go
 /*
[Order Details]			OrderID */
create nonclustered index clix_OrderID on Sales.OrderDetails (OrderID);
 go
/*						ProductID */
create nonclustered index clix_ProductID on Sales.OrderDetails (ProductID);
 go					
