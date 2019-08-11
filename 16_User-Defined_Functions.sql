/* Purpose: User-Defined Functions
Script Date 04/05/2019
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
create a function, Production.getInventoryStockFn, that takes one input value - Product ID - and returns a single data value - Inventory of the specified product.
*/

-- ckeck if the function exists
if OBJECT_ID('Production.getInventoryStockFn', 'Fn') is not null
drop function Production.getInventoryStockFn
;
go

create function Production.getInventoryStockFn
(
	-- declare parameters
	@ProductID as int
)
returns int
as 
	begin
	-- declare the stock level (unit in stock and in order)
	declare @StockLevel as int
	-- copmute the return value
	select @StockLevel = PP.UnitsInStock + PP.UnitsOnOrder
	from Production.Products as PP
	where PP.ProductID = @ProductID
	-- return the result
	if (@StockLevel is null)
	begin
		set @StockLevel = 0
		end
		return @StockLevel
	end
;
go

-- testing the function Production.getInventoryStockFn

select Production.getInventoryStockFn(15) as 'Stock Level'
;
go

select  PP.ProductID, PP.ProductName, PP.UnitPrice, PP.UnitsInStock, Production.getInventoryStockFn(PP.ProductID) as 'Stock Level'
from Production.Products as PP
where PP.ProductID in (1,6,9,12)
;
go

/* create a function, HumanResources.getEmployeesSeniorityFn, that returns the employee seniority */

create function HumanResources.getEmployeesSeniorityFn
(
	-- declare parameters
	@HireDate as datetime
)
returns int
as 
	begin
	declare @Seniority as int	
	select @Seniority = abs(DATEDIFF(year, @HireDate, GETDATE() ))
	return @Seniority
	end
;
go


select GETDATE()

select HumanResources.getEmployeesSeniorityFn('2010/04/05')
;
go

-- display the employees senioity

select E.EmployeeID, E.FirstName, E.LastName, HumanResources.getEmployeesSeniorityFn(HireDate) as 'Seniority'
from HumanResources.Employees as E
order by 'Seniority' asc
;
go


/* 1. 
create a function, Sales.getNumberOfDaysFn, that returnsd the number of days between the order date and the ship date. Drop the function if exists and then re-create it.
	Then test the function
*/

if OBJECT_ID('Sales.getNumberOfDaysFn', 'Fn') is not null
drop function Sales.getNumberOfDaysFn
;
go

create function Sales.getNumberOfDaysFn
(	
	@OrderDate as datetime,
	@ShippedDate as datetime
)
returns int
as 
	begin
	declare @Period as int	
	select @Period = abs(DATEDIFF(DAY, @OrderDate, @ShippedDate ))

		if (@Period is null)
	begin
		set @Period = 0
		end
		return @Period
	end
;
go

select Sales.getNumberOfDaysFn('2017/08/07','2017/08/09') as 'Period between the dates is (days):'
;
go


select [OrderDate], [ShippedDate],Sales.getNumberOfDaysFn([OrderDate], [ShippedDate]) as 'Period between the dates is (days):'
from [Sales].[Orders]
;
go

/* 2. create a function, getEmployeeNameFn, that returns the full name of an employee */

if OBJECT_ID('HumanResources.getEmployeeNameFn', 'Fn') is not null
drop function HumanResources.getEmployeeNameFn
;
go

create function HumanResources.getEmployeeNameFn
(	
	@FirstName as nvarchar(20)
)
returns nvarchar(50)
as 
	begin
	declare @FullName as nvarchar(50)	
	select @FullName = concat(E.FirstName, ' ', E.LastName)
	from [HumanResources].[Employees] as E
	where E.FirstName = @FirstName
	return @FullName
	end
;
go

select HumanResources.getEmployeeNameFn('Janet')
;
go

select [EmployeeID], HumanResources.getEmployeeNameFn (FirstName) as 'Full Name'
from [HumanResources].[Employees]
;
go