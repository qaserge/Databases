/* Purpose: Nested SubQueries
Script Date 04/04/2019
Developed By: Sergei
*/

/* in order to create a new db, switch to the master db */
/* add a statment that specified the script runs in the context of the master db */

-- switch to the master database
-- SYNTAX: use database_name

use Northwind2019
;
go -- include end of batch marlers (go statement)

/*
A subquery is a query that is nested inside a SELECT, INSERT, UPDATE, or DELETE statement, or inside another subquery. 
A subquery can be used anywhere an expression is allowed.
*/

/* A scalar subquery is a query that return a single value.
Multiple-Value subquery  is a query that return a resilt set much like a single column table
 */

 /*
 Question 1
 return the last order placed
 */

  -- top (1)
 select top (1) OD.OrderID as 'last order'
 from [Sales].[Order Details] as OD
 order by OD.OrderID desc
 ;
 go

 -- or with max function
 select max(OD.OrderID) as 'last order'
 from [Sales].[Order Details] as OD 
 ;
 go

  /*
 Question 2
 return the last order placed with the product id, unit price, and quantity
 */

 -- top (1)
 -- the following in not a good result
 select  top (1)
 OD.OrderID as 'last order',
 OD.ProductID as 'Product ID',
 OD.UnitPrice as 'Price',
 OD.Quantity as 'Quantity'
 from [Sales].[Order Details] as OD
 order by OD.OrderID desc
 ;
 go

 -- max
 -- the following in not a good result
 select 
 max(OD.OrderID) as 'last order',
 OD.ProductID as 'Product ID',
 OD.UnitPrice as 'Price',
 OD.Quantity as 'Quantity'
 from [Sales].[Order Details] as OD 
 group by OD.ProductID, OD.UnitPrice,OD.Quantity
 ;
 go

 -- using nested (sub) query
 select 
 OD.OrderID as 'last order',
 OD.ProductID as 'Product ID',
 OD.UnitPrice as 'Price',
 OD.Quantity as 'Quantity'
 from [Sales].[Order Details] as OD 
 where OD.OrderID =
	 ( -- subquery
		select max(O.OrderID) as 'Last Order'
		from [Sales].[Orders] as O
	 )
;
go

select *
from [Sales].[Order Details]
where OrderID = 11077
;
go

/*
Question 3
Return the list of orders placed by customers from Mexico (ship Country)
*/

select O.OrderID as 'Order'
from [Sales].[Orders] as O
-- inner join [Sales].[Customers] as C
-- on O.CustomerID = C.CustomerID
where O.ShipCountry like 'Mexico'
;
go

/*
Question 4
Return the list of orders placed by customers (Customer Name) from Mexico (ship Country)
*/

select O.OrderID as 'Order', C.CompanyName as 'Customer'
from [Sales].[Orders] as O
inner join [Sales].[Customers] as C
on O.CustomerID = C.CustomerID
where O.ShipCountry like 'Mexico'
;
go

-- -- using nested (sub) query

select O.CustomerID, O.OrderID
from [Sales].[Orders] as O
where O.CustomerID in
(
	select C.CustomerID
	from [Sales].[Customers] as C
	where O.ShipCountry like 'Mexico'
)
;
go

/* 
Correlated subquery refers to columns of table used in outer table.
Correlated subquery is used to pass a value from the outer query to inner query to be used as parameter
*/

/*
Question 6
return the list of orders with last order date for each employee
*/

select O.EmployeeID as 'Employee', O.OrderID as 'Order', 
convert(nvarchar(12), O.OrderDate) as 'Date'
from [Sales].[Orders] as O
inner join [HumanResources].[Employees] as E
on O.EmployeeID = E.EmployeeID
where O.OrderDate in
(
	select max(o1.OrderDate)
	from [Sales].[Orders] as o1
	where o1.EmployeeID = O.EmployeeID
)
order by O.EmployeeID, O.OrderDate
;
go

/*
use the [not] [exist] predicate with subquery to check for any result that returns from a query.
EXISTS evaluetes whether rows exists, but rather than return them, it returns true or false
*/

select *
from [HumanResources].[Employees] as E

/* return the defenition of [HumanResources].[Employees] table */
execute sp_help '[HumanResources].[Employees]'
;
go

/* insert yourself as a new employee */

insert into [HumanResources].[Employees] ([FirstName],[LastName])
values ('Sergei','Bessonov')
;
go

/*
Question 7
return the employee name and number of employees who are associated with orders 
*/

select count (distinct EmployeeID)
from [Sales].[Orders] as O
;
go

select E.EmployeeID, E.LastName
from [HumanResources].[Employees] as E
where 
(
	select count (*)
	from [Sales].[Orders] as O
	where O.EmployeeID = E.EmployeeID
) > 0
;
go

-- using exist to return the same result
select E.EmployeeID, E.LastName
from [HumanResources].[Employees] as E
where exists
(
	select count (*)
	from [Sales].[Orders] as O
	where O.EmployeeID = E.EmployeeID
	group by O.OrderID
)
;
go

/* Question 8
return any customers (company name) that has never placed an order
*/

select C.CustomerID, C.CompanyName
from [Sales].[Customers] as C
where not exists
(
	select O.OrderID
	from [Sales].[Orders] as O
	where C.CustomerID = O.CustomerID
) 
;
go

-- the same result using alter join
select C.CustomerID, C.CompanyName
from [Sales].[Customers] as C
	left outer join [Sales].[Orders] as O
		on C.CustomerID = O.CustomerID
where O.OrderID is null
;
go


