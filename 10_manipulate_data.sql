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

/*
Example 1
Find customers in London (UK) with Sales Representative contact title. Save this query as 1_qryCustomersInLondonUK
*/

select *
from Sales.Customers
;
go

select CustomerID, CompanyName, City, Country, ContactTitle
from Sales.Customers
where City = 'London' and Country = 'UK' and ContactTitle like 'Sales R%'
;
go

/*
Example 2
Suppose that you want to see a list of countries where Northwind Traders’ suppliers are located. 
You want to arrange the countries alphabetically, and within each country you want to list supplier names alphabetically. 
Create this query and save it as 2_qrySupplierLocations.
*/

select Country, CompanyName
from Production.Suppliers
order by Country , CompanyName
;
go

/*
Example 3
Suppose you want to see the name and location of Northwind Traders’ suppliers from Germany. 
Create this query and save it as 3_qrySuppliersFromGermany. 
*/

select CompanyName, [Address], [City], [Region], [PostalCode], [Country], [Phone]
from Production.Suppliers
where [Country] = 'Germany'
;
go

/*
Example 4
Suppose that you want to display company names of suppliers from Sweden, 
but you only want to see the company names, not the country, in the result set. 
Create this query and save it as 4_qrySuppliersLocatedInSweden. 
*/

select CompanyName
from Production.Suppliers
where [Country] = 'Sweden'
;
go

/*
Example 5
Suppose that you want to view all the fields in the Northwind Order Details table, 
but you’re interested in seeing only those records with an Order ID greater than 11000. 
Create this query and save it as 5_qryOrderIDGreaterThan11000.
*/

select *
from [Sales].[Order Details]
where [OrderID] > 11000
;
go

/*
Example 6
Suppose that you want to find employees how are hired between January 1st and March 31st 2016 (first quarter of 2016). 
Create this query and save it as 6_qryEmployeesHiredInFirstQuarter2016. 
*/

select [EmployeeID], [LastName], [FirstName], [HireDate]
from [HumanResources].[Employees]
-- where [HireDate] > 2016/01/01 and [HireDate] < 31/03/2016
;
go
/*
Example 7
Suppose you want to see Northwind suppliers from Germany or Canada. Create this query and save it as 7_qrySuppliersFromGermanyOrCanada.
*/
select [CompanyName], [City], [Country]
from [Production].[Suppliers]
where [Country] in ('Germany', 'Canada')
;
go

/*
Example 8
Suppose you want to see Northwind suppliers in either the UK (United Kingdom) or Paris. Create this query and save it as 8_qrySuppliersInUKOrParis. 
*/

select [CompanyName], [City], [Country]
from [Production].[Suppliers]
where [Country] = 'UK' or [City] = 'Paris'
;
go

/*
Example 9
Suppose that you want to find suppliers who have a fax number. 
Create this query and save it as 9_qrySuppliersWithFaxNumber.
*/
select CompanyName, [Fax]
from [Production].[Suppliers]
where [Fax] is not null
;
go

/*
Example 10
Suppose that you want to see Northwind Traders customers who are located in Seattle, Kirkland, or Portland. 
Create this query and save it as 10_qryCustomerCityLocation. 
*/
select [CompanyName], City
from [Sales].[Customers]
where [City] in ('Seattle', 'Kirkland', 'Portland')
;
go

/*
Example 11
Suppose that you want to select a list of countries where Northwind suppliers are located. 
Create this query and save it as 11_qryDistinctSuppliersCountry. 
*/
select distinct [Country]
from [Production].[Suppliers]
order by [Country]
;
go

/*
Example 12
Suppose you remember that a customer's company name starts with "The", but you can't remember the rest of the name. Find all the company names starting with "The". Create this query and save it as 12_qryCompanyNameStartingWithThe.
*/
select *
from [Sales].[Customers]
where [CompanyName] like 'The%'
;
go




/* 
Example 12
return the list of orders placed by customers (comp name)
 */

 select C.CompanyName as 'Company', O.OrderID as 'OrderID' 
 from [Sales].[Customers] as C
	inner join [Sales].[Orders] as O
		on C.CustomerID = O.CustomerID
	;
	go

/*
Example 13
Suppose you want to find out Customers (Company Name ) who ordered the "Chef Anton's Cajun Seasoning" product (Product Name)
*/

select C.CompanyName as 'Company', P.ProductName as 'Product'
from [Sales].[Customers] as C
	inner join [Sales].[Orders] as O
		on C.CustomerID = O.CustomerID
			inner join  [Sales].[Order Details] as OD
				on O.OrderID = OD.OrderID
					inner join [Production].[Products] as P
						on P.ProductID = OD.ProductID
where P.ProductName like 'Chef Anton''s Cajun Seasoning'
;
go


/* 
Example 14
return the list of orders placed by customers (comp name). 
List of Customers even they haven't placed any order.
 */

 -- Un-Matching values (in this case "left outer join" != "inner join")
 select C.CompanyName as 'Company', O.OrderID as 'OrderID', O.Freight
 from [Sales].[Customers] as C
	left outer join [Sales].[Orders] as O
		on C.CustomerID = O.CustomerID
where O.OrderID is null
	;
	go


-- Matching values (in this case "left outer join" = "inner join")
 select C.CompanyName as 'Company', O.OrderID as 'OrderID', O.Freight
 from [Sales].[Customers] as C
	right outer join [Sales].[Orders] as O
		on C.CustomerID = O.CustomerID
	;
	go

 -- Un-Matching values (in this case "left outer join" = "inner join")
 select C.CompanyName as 'Company', O.OrderID as 'OrderID', O.Freight
 from  [Sales].[Orders] as O -- chenged order [Orders] and [Customers]
	left outer join [Sales].[Customers] as C
		on C.CustomerID = O.CustomerID
where O.OrderID is null
	;
	go

select count (CustomerID)
from [Sales].[Customers]
;
go

/*
Example 16
find out the total number of products supplied by each supplier (company name).
list them from the highest to lowest number
*/

select S.CompanyName as 'Supplier', count (P.ProductID) as 'Total Number of products' 
from [Production].[Products] as P
	inner join [Production].[Suppliers] as S
		on S.SupplierID = P.SupplierID
group by S.CompanyName
order by 'Total Number of products' desc 
-- or
-- order by  count (P.ProductID) desc
-- or 
-- order by  2 desc
;
go

/*
Example 17
Find out the discounted products. Return the category and product name
*/

select C.CategoryName as 'Category', P.ProductName as 'Product', p.Discontinued
from [Production].[Products] as P
	inner join [Production].[Categories] as C
	on P.CategoryID = C.CategoryID
-- where P.Discontinued != 0
where P.Discontinued = 1
;
go

/*
Example 18
Find out suppliers (company name) who have supplied more than 4 products.
List suppliers that supplied the most products first.
*/

select S.CompanyName as 'Supplier', count (P.ProductID) as 'Total Number of products' 
from [Production].[Products] as P
	inner join [Production].[Suppliers] as S
		on S.SupplierID = P.SupplierID
		where S.Country like 'Australia'
group by S.CompanyName
having count(P.ProductID) > 4
order by count(P.ProductID) desc 
;
go


/*
Example 19
List customers (company name) and orders placed in 2019.
*/

-- using ANSO SQL 89 syntax

select C.CompanyName as 'Company', O.OrderID as 'Order', O.OrderDate as 'Date'
from [Sales].[Customers] as C, [Sales].[Orders] as O
where C.CustomerID = O.CustomerID
and year(O.OrderDate) = '2019'
;
go

-- using ANSO SQL 92 syntax

select C.CompanyName as 'Company', O.OrderID as 'Order', O.OrderDate as 'Date'
from [Sales].[Customers] as C
	inner join [Sales].[Orders] as O
		on C.CustomerID = O.CustomerID
where year(O.OrderDate) = '2019'
;
go

/*
Example 20
Return suppliers company name, product name, category name, and order numbers for orders placed in 2019 
*/

select S.CompanyName as 'supplier', 
		P.ProductName as 'Prouct', 
		C.CategoryName as 'Category', 
		OD.Quantity as 'Quantity', 
		O.OrderDate as 'Date', 
		SC.CompanyName as 'Customer'
from [Production].[Products] as P
	inner join [Production].[Suppliers] as S
		on S.SupplierID = P.SupplierID
			inner join [Production].[Categories] as C
				on P.CategoryID = C.CategoryID
					inner join [Sales].[Order Details] as OD
						on P.ProductID = OD.ProductID
							inner join [Sales].[Orders] as O
								on OD.OrderID = O.OrderID
									inner join [Sales].[Customers] as SC
										on O.CustomerID = SC.CustomerID
where year(O.OrderDate) = '2019'
;
go

/*
Example 21
Find out the list of employees who report to "Andrew Fuller" - supervisor with employee id = 2.
Return supervisor ID, first name and last name, as well as Employee ID, first namr and last name.
Use a self join when a table references data in itself.
*/

select 
S.EmployeeID as 'Super ID',
S.FirstName as 'Super Name',
S.LastName as 'Super Last Name',
E.EmployeeID as 'Employee ID',
E.FirstName as 'Employee Name',
E.LastName as 'Employee Last Name' 
from [HumanResources].[Employees] as E
inner join [HumanResources].[Employees] as S
on S.EmployeeID = E.ReportsTo
where S.EmployeeID = 2
;
go

/*
Example 22
List orders shipped by each shipper company.
Return shipper company name, order id, and order shipped date
*/

select 
O.OrderID as 'Order', 
S.CompanyName as 'Shipper',
convert (nvarchar(10), O.ShippedDate) as 'Convert Ship Date',
cast (O.ShippedDate as nvarchar(12)) as 'cast Ship Date'
from [Sales].[Orders] as O
inner join [Sales].[Shippers] as S
on S.ShipperID = O.ShipVia
;
go

select 
O.OrderID as 'Order', 
S.CompanyName as 'Shipper',
convert (nvarchar(10), O.ShippedDate) as 'Convert Ship Date',
cast (O.ShippedDate as nvarchar(12)) as 'cast Ship Date'
from [Sales].[Orders] as O
left outer join [Sales].[Shippers] as S
on S.ShipperID = O.ShipVia
where O.ShippedDate is null
;
go
