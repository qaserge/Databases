/* Purpose: Create the FoodCo database
Script Date 3/29/2019
Developed By: Sergei
*/

/* in order to create a new db, switch to the master db */
/* add a statment that specified the script runs in the context of the master db */

-- switch to the master database
-- SYNTAX: use database_name

use FoodCo;
go -- include end of batch marlers (go statement)

/*
ALTER TABLE Sales.Orders
drop fk_Orders_Customer; 
go
*/

/*  Integrity Types:
	1. Domain (column)
	2. Entity (row)
	3. Referential (between tables or columns)

	Constraint Types:
	1. Primary Key (pk_)
	2. Unique (u_ or uq_)
	3. Default (df_)
	4. Check (ck_)
	5. Foreing key (fk_)
*/

/* foreign key(s) Table No. 1 - Sales.Customers */
/*ALTER TABLE Sales.Customers
add constraint pk_Customers primary key clustered (CustomerID);
go */
/* foreign key(s) Table No. 2 - Sales.Orders */
/* alter table Sales.Orders
add	constraint pk_Orders primary key clustered (CustomerID);
go */
/* 1) Between Sales.Orders and Sales.Customers */
ALTER TABLE Sales.Orders
ADD CONSTRAINT fk_Orders_Customer foreign key (CustomerID) REFERENCES Sales.Customers (CustomerID); 
go
/* 2) Between Sales.Orders and Sales.Shippers */
ALTER TABLE Sales.Orders
ADD CONSTRAINT fk_Orders_Shippers foreign key (ShipVia) REFERENCES Production.Shippers (ShipperID); 
go
/* 3) Between Sales.Orders and HumanResources.Employees*/
ALTER TABLE Sales.Orders
ADD CONSTRAINT fk_Orders_Employee foreign key (EmployeeID) REFERENCES HumanResources.Employees (EmployeeID); 
go
/* unique value for atribute ShipVia*/
ALTER TABLE Sales.Orders
ADD CONSTRAINT UC_ShipVia UNIQUE (ShipVia);
go
-- Default constraints (set Freight column value to zero)
ALTER TABLE Sales.Orders
ADD CONSTRAINT df_Freight DEFAULT '0' FOR Freight;
go

/* foreign key(s) Table No. 3 - Production.Products */
/*alter table Production.Products
add	constraint pk_Products primary key clustered (ProductID);
go */
/* 1) Between Production.Products and Production.Suppliers*/
ALTER TABLE Production.Products
ADD	constraint fk_Products_Supplier foreign key (SupplierID) REFERENCES Production.Suppliers (SupplierID); 
go
/* 2) Between Production.Products and Production.Categories */
ALTER TABLE Production.Products
ADD	constraint fk_Products_Category foreign key (CategoryID) REFERENCES Production.Categories (CategoryID); 
go
-- Default constraints
/* set the default value to 0 for: UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, and Discontinued columns in Production.Products*/
ALTER TABLE Production.Products
ADD CONSTRAINT df_Products_UnitPrice DEFAULT '0' FOR UnitPrice;
go
ALTER TABLE Production.Products
ADD CONSTRAINT df_Products_UnitsInStock DEFAULT '0' FOR UnitsInStock;
go
ALTER TABLE Production.Products
ADD CONSTRAINT df_Products_UnitsOnOrder DEFAULT '0' FOR UnitsOnOrder;
go
ALTER TABLE Production.Products
ADD CONSTRAINT df_Products_ReorderLevel DEFAULT '0' FOR ReorderLevel;
go
ALTER TABLE Production.Products
ADD CONSTRAINT df_Products_Discountinued DEFAULT '0' FOR Discountinued;
go
-- Check constraint 
/* check that the following column values in the Products table must be >= 0: UnitPrice, ReorderLevel, UnitsInStock, UnitsOnOrder */

ALTER TABLE Production.Products
ADD CHECK (UnitPrice>=0);
go
ALTER TABLE Production.Products
ADD CHECK (UnitsInStock>=0);
go
ALTER TABLE Production.Products
ADD CHECK (UnitsOnOrder>=0);
go
ALTER TABLE Production.Products
ADD CHECK (ReorderLevel>=0);
go
ALTER TABLE Production.Products
ADD CHECK (Discountinued>=0);
go

/* foreign key(s) Table No. 4 - Sales.[Order Details] */
/* alter table Sales.OrderDetails
add constraint pk_OrderDetails primary key clustered (OrderID, ProductID);
go */
/* 1) Between Sales.[Order Details] and Sales.Orders */
ALTER TABLE Sales.OrderDetails
ADD	constraint fk_OrderDetails_Orders foreign key (OrderID) REFERENCES Sales.Orders (OrderID); 
go
/* 2) Between Sales.[Order Details] and Production.Products*/
ALTER TABLE Sales.OrderDetails
ADD	constraint fk_OrderDetails_Products foreign key (ProductID) REFERENCES Production.Products (ProductID); 
go
-- Default constraints
/* set the default constraint value to 0 for UnitPrice and Discount, and 1 for Quantity column */
ALTER TABLE Sales.OrderDetails
ADD CONSTRAINT df_OrderDetails_UnitPrice DEFAULT '0' FOR UnitPrice;
go
ALTER TABLE Sales.OrderDetails
ADD CONSTRAINT df_OrderDetails_Discount DEFAULT '0' FOR Discount;
go
ALTER TABLE Sales.OrderDetails
ADD CONSTRAINT df_OrderDetails_Quantity DEFAULT '1' FOR Quantity;
go
/* foreign key(s) Table No. 5 - Production.Suppliers */
/*alter table Production.Suppliers
add constraint pk_Suppliers primary key clustered (SupplierID);
go */
/* foreign key(s) Table No. 6 - Production.Categories */
/* alter table Production.Categories
add constraint pk_Categories primary key clustered (CategoryID);
go */
/* foreign key(s) Table No. 7 - Production.Shippers */
/*alter table Production.Shippers
add constraint pk_Shippers primary key clustered (ShipperID);
go */
/* foreign key(s) Table No. 8 - HumanResources.Employees */
/*alter table HumanResources.Employees
add constraint pk_Employees primary key clustered (EmployeeID);
go */
-- Foreign key between Employees.EmployeeID and Employees.ReportsTo 
ALTER TABLE HumanResources.Employees
ADD	constraint fk_Employees_ReportsTo foreign key (ReportsTo) REFERENCES HumanResources.Employees (EmployeeID); 
go
-- Check Birth Date to be less than current date
ALTER TABLE HumanResources.Employees
ADD CHECK (BirthDate>GETDATE());
go

/* foreign key(s) Table No. 9 - HumanResources.Region */
/* alter table HumanResources.Region
add constraint pk_Region primary key clustered (RegionID);
go */
/* foreign key(s) Table No. 10 - HumanResources.Territories */
/* alter table HumanResources.Territories
add constraint pk_Territories primary key clustered (TerritoryID);
go */
/* Between HumanResources.Territories and HumanResources.Region*/
ALTER table HumanResources.Territories
ADD constraint fk_Territories_Region foreign key (RegionID) REFERENCES HumanResources.Region (RegionID); 
go
/* foreign key(s) Table No. 11 - HumanResources.EmployeeTerritories */
/* alter table HumanResources.EmployeeTerritories
add constraint pk_EmployeeTerritories primary key clustered (EmployeeID, TerritoryID);
go */
/* 1) Between HumanResources.EmployeeTerritories and HumanResources.Employees*/
ALTER TABLE HumanResources.EmployeeTerritories
ADD	constraint fk_EmployeeTerritories_Employees foreign key (EmployeeID) REFERENCES HumanResources.Employees (EmployeeID); 
go
/* 2) Between HumanResources.EmployeeTerritories and HumanResources.Territories*/
ALTER TABLE HumanResources.EmployeeTerritories
ADD	constraint fk_EmployeeTerritories_Territories foreign key (TerritoryID) REFERENCES HumanResources.Territories (TerritoryID); 
go

/* foreign key(s) Table No. 12 - Sales.CustomerCustomerDemo */
/* alter table Sales.CustomerCustomerDemo
add constraint pk_CustomerCustomerDemo primary key clustered (CustomerID, CustomerTypeID);
go */
/* 1) Between Sales.CustomerCustomerDemo and Sales.CustomerDemographics */
ALTER TABLE Sales.CustomerCustomerDemo
ADD	constraint fk_CustomerCustomerDemo_CustomerDemographics foreign key (CustomerTypeID) REFERENCES Sales.CustomerDemographics (CustomerTypeID); 
go
/* 2) Between Sales.CustomerCustomerDemo and Sales.Customers */
ALTER TABLE Sales.CustomerCustomerDemo
ADD	constraint fk_CustomerCustomerDemo_Customers foreign key (CustomerID) REFERENCES Sales.Customers (CustomerID); 
go


/* foreign key(s) Table No. 13 - Sales.CustomerGeographics */
/*alter table Sales.CustomerGeographics
add constraint pk_CustomerGeographics primary key clustered (CustomerTypeID);
go */


