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


/***** Table No. 1 - Sales.Customers ****/ -- Primary Key: CustomerID 
/***** Table No. 2 - Sales.Order ****/ -- primary key - OrderID identity(1, 1))
/***** Table No. 3 - Production.Products ****/ -- primary key - ProductID identity (1, 1)
/***** Table No. 4 - Sales.[Order.Details] ****/ -- primary key - OrderID and ProductID (composite PK)
/***** Table No. 5 - Production.Suppliers ****/ -- primary key - SupplierID identity (1, 1) 
/***** Table No. 6 - Production.Categories ****/ -- Primary Key: CategoryID -> identity (1, 1)
/***** Table No. 7 - Production.Shippers ****/ -- Primary Key: ShipperID -> identity (1, 1)
/***** Table No. 8 - HumanResources.Employees ****/ -- Primary Key: EmployeeID -> identity (1, 1)
/***** Table No. 9 - HumanResources.Region ****/ -- Primary Key: RegionID -> int
/***** Table No. 10 - HumanResources.Territories ****/ -- Primary Key: TerritoryID -> nvarchar
/***** Table No. 11 - HumanResources.EmployeeTerritories ****/ -- Primary Key: EmployeeTerritories -> int 
/***** Table No. 12 - Sales.CustomerCustomerDemo ****/ -- Primary Key: CustomerID and CustomerTypeID (composite PK)
/***** Table No. 13 - Sales.CustomerGeographics ****/ -- Primary Key: CustomerTypeID - nvarchar


/* used only during the development proccess. Check the existance of a specific object by veryfing the object has an object ID. If the object exists, it is deleted using the drop statment.
if the object does not exist, it will be created.
 */


 /***** Table No. 1 - Sales.Customers ****/ -- Primary Key: CustomerID 
 
 -- U = user-defined table
if OBJECT_ID ('Sales.Customers', 'U') is not null
	drop table Sales.Customers
	;
	go


/* SYNTAX:
create Table [schema_name.]table_name
(
column_name data_type constraint(s),
column_name data_type constraint(s),
...,
column_name data_type constraint(s)
)
*/

create table Sales.Customers
(
	CustomerID nchar(5) not null,
	CompanyName nvarchar(40) not null,
	ContactName nvarchar(30) null,
	ContactTitle nvarchar(30) null,
	Address nvarchar(60) not null,
	City nvarchar(15) not null,
	Region nvarchar(15) null,
	PostalCode nvarchar(10) not null,
	Country nvarchar(15) not null,
	Phone nvarchar(24) not null,
	Fax nvarchar(24) null,
	constraint pk_Customers primary key clustered (CustomerID)
);
go

/***** Table No. 2 - Sales.Orders ****/ -- Primary Key: OrderID -> identity (1, 1)

if OBJECT_ID ('Sales.Orders', 'U') is not null
	drop table Sales.Orders;
go
create table Sales.Orders
(
	OrderID int identity(1, 1) not null,
	CustomerID nchar(5) not null,
	EmployeeID int not null,
	OrderDate datetime not null,
	RequiredDate datetime null,
	ShipDate datetime not null,
	ShipVia int not null,
	Freight money not null,
	ShipName nvarchar(40) not null,
	ShipAddress nvarchar(60) not null,
	ShipCity nvarchar(15) not null,
	ShipRegion nvarchar(15) null,
	ShipCountry nvarchar(25) null,
	constraint pk_Orders primary key clustered (OrderID)	
);
go

/***** Table No. 3 - Production. Products ****/ -- Primary Key: ProductID -> identity (1, 1)
if OBJECT_ID ('Production.Products', 'U') is not null
	drop table Production.Products;
go
create table Production.Products
(	
	ProductID int identity(1, 1) not null,
	ProductName nvarchar(40) not null,
	SupplierID int not null,
	CategoryID int not null,
	QuantityPerUnit nvarchar(20) null,
	UnitPrice money not null,
	UnitsInStock smallint not null,
	UnitsOnOrder smallint not null,
	ReorderLevel smallint not null,
	Discountinued bit null,
	constraint pk_Products primary key clustered (ProductID)
);
go

alter table Production.Products
	alter column UnitPrice decimal(6,2) not null;
	go



/***** Table No. 4 - Sales.[Order Details] ****/ -- Primary Key: OrderID and ProductID (composite primary key)
if OBJECT_ID ('Sales.OrderDetails', 'U') is not null
	drop table Sales.OrderDetails;
go
create table Sales.OrderDetails
(
	OrderID int not null,
	ProductID int not null,
	UnitPrice money not null,
	Quantity smallint not null,
	Discount real null,
	constraint pk_OrderDetails primary key clustered (OrderID, ProductID)
);
go

/***** Table No. 5 - Production.Suppliers ****/ -- primary key - SupplierID identity (1, 1) 
if OBJECT_ID ('Production.Suppliers', 'U') is not null
	drop table Production.Suppliers;
go
create table Production.Suppliers
(	
	SupplierID int identity(1, 1) not null,
	CompanyName nvarchar(40) not null,
	ContactName nvarchar(30) null,
	ContactTitle nvarchar(30) null,
	Address nvarchar(60) not null,
	City nvarchar(15) not null,
	Region nvarchar(15) null,
	PostalCode nvarchar(10) not null,
	Country nvarchar(15) not null,
	Phone nvarchar(24) not null,
	Fax nvarchar(24) null,
	HomePage ntext null,
	constraint pk_Suppliers primary key clustered (SupplierID)
);
go

/***** Table No. 6 - Production.Categories ****/  -- Primary Key: CategoryID -> identity (1, 1)
if OBJECT_ID ('Production.Categories', 'U') is not null
	drop table Production.Categories;
go
create table Production.Categories
(	
	CategoryID int identity(1, 1) not null,
	CategoryName nvarchar(15) not null,
	Description nvarchar(250) null,
	Picture varbinary null,
	constraint pk_Categories primary key clustered (CategoryID asc)
);
go

/* return the definition of the table Production.Categoryes */
execute sp_help 'Production.Categories';
go

alter table Production.Categories
alter column Picture varbinary(max) null;
go

/***** Table No. 7 - Production.Shippers ****/ -- Primary Key: ShipperID -> identity (1, 1)
if OBJECT_ID ('Production.Shippers', 'U') is not null
	drop table Production.Shippers;
go
create table Production.Shippers
(	
	ShipperID int identity(1, 1) not null,
	CompanyName nvarchar(40) not null,
	Phone nvarchar(24) not null,
	constraint pk_Shippers primary key clustered (ShipperID)
);
go


/***** Table No. 8 - HumanResources.Employees ****/ -- Primary Key: EmployeeID -> identity (1, 1)
if OBJECT_ID ('HumanResources.Employees', 'U') is not null
	drop table HumanResources.Employees;
go
create table HumanResources.Employees
(	
	EmployeeID int not null,
	LastName nvarchar(20) not null,
	FirstName nvarchar(10) not null,
	Title nvarchar(30) null,
	TitleOfCourtesy nvarchar(25) null,
	BirthDate datetime null,
	HireDate datetime not null,
	Address nvarchar(60) null,
	City nvarchar(15) not null,
	Region nvarchar(15) null,
	PostalCode nvarchar(10) not null,
	Country nvarchar(15) not null,
	Phone nvarchar(24) not null,
	Photo varbinary(max) NULL,
	ReportsTo int not NULL, -- one employee may report to another employee
	PhotoPath nvarchar(255) null,
	DepartmentID smallint NULL, -- fk for Departments
	constraint pk_Employees primary key clustered (EmployeeID asc)
);
go

/***** Table No. 9 - HumanResources.Region ****/ -- Primary Key: RegionID -> int
if OBJECT_ID ('HumanResources.Region', 'U') is not null
	drop table HumanResources.Region;
go
create table HumanResources.Region
(	
	RegionID int not null,
	RegionDescription nchar(50) not null,
	constraint pk_Region primary key clustered (RegionID)
);
go

/***** Table No. 10 - HumanResources.Territories ****/ -- Primary Key: TerritoryID -> nvarchar
if OBJECT_ID ('HumanResources.Territories', 'U') is not null
	drop table HumanResources.Territories;
go
create table HumanResources.Territories
(	
	TerritoryID nvarchar(20) not null,
	TerritoryDescription nchar(50) not null,
	RegionID int not null,
	constraint pk_Territories primary key clustered (TerritoryID)	
);
go

/***** Table No. 11 - HumanResources.EmployeeTerritories ****/ -- Primary Key: EmployeeTerritories -> int 
if OBJECT_ID ('HumanResources.EmployeeTerritories', 'U') is not null
	drop table HumanResources.EmployeeTerritories;
go
create table HumanResources.EmployeeTerritories
(	
	EmployeeID int not null,
	TerritoryID nvarchar(20) not null,
	constraint pk_EmployeeTerritories primary key clustered (EmployeeID, TerritoryID)
);
go

/***** Table No. 12 - Sales.CustomerCustomerDemo ****/ -- Primary Key: CustomerID and CustomerTypeID (composite PK)
if OBJECT_ID ('Sales.CustomerCustomerDemo', 'U') is not null
	drop table Sales.CustomerCustomerDemo;
go
create table Sales.CustomerCustomerDemo
(	
	CustomerID nchar(5) not null,
	CustomerTypeID nvarchar(10) not null,
	constraint pk_CustomerCustomerDemo primary key clustered (CustomerID, CustomerTypeID)
);
go

/***** Table No. 13 - Sales.CustomerGeographics ****/ -- Primary Key: CustomerTypeID - nvarchar
if OBJECT_ID ('Sales.CustomerDemographics', 'U') is not null
	drop table Sales.CustomerDemographics;
go
create table Sales.CustomerDemographics
(		
	CustomerTypeID nvarchar(10) not null,
	CustomerDesc ntext not null,
	constraint pk_CustomerDemographics primary key clustered (CustomerTypeID)
);
go