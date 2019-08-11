/* Purpose: T-SQL Functions
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

-- some of the T-SQL Date and Time functions:
/* 
• getDate()
• sysDateTime()
• getUTCDate()
• DateAdd()
• DateDiff()
• Year()
• Month()
• Day()
*/

select 
[OrderID] as 'OrderID',
[OrderDate] as 'Date',
YEAR([OrderDate]) as 'YEAR',
MONTH([OrderDate]) as 'MONTH',
DAY([OrderDate]) as 'DAY',
DATEPART(YEAR, OrderDate) as 'YEAR DATEPART',
DATEPART(MONTH, OrderDate) as 'MONTH DATEPART',
DATEPART(DAY, OrderDate) as 'DAY DATEPART',
DATEPART(WEEKDAY, OrderDate) as 'WEEKDAY DATEPART',
DATEPART(DAYOFYEAR, OrderDate) as 'DAYOFYEAR DATEPART',
DATENAME(WEEKDAY,OrderDate ) as 'WEEKDAY DATENAME',
EOMONTH(OrderDate) as 'End of Month'
from [Sales].[Orders]
;
go

/* return all orders placed in 2018 and 2019 */

select [OrderID] as 'ID', [OrderDate] as 'Date'
from [Sales].[Orders]
-- where YEAR([OrderDate]) in (2018, 2019)
-- where YEAR([OrderDate]) between 2018 and 2019
where (OrderDate) between '1/1/2018' and '12/31/2019'
;
go

-- some of T-SQL logical functions
/* 
IsNumeric (expression) function returns 1 when the input expression evaluetes to a valid data type, otherwise it returns 0.
*/
/* return the list of employee and the postal code with numeric value */

select [FirstName],[LastName],[PostalCode]
from [HumanResources].[Employees]
-- where ISNUMERIC(PostalCode) = 0 -- string
where ISNUMERIC(PostalCode) = 1 -- numbers
;
go


/* 
IIF (expression) - imediate if function returns one of two values depending on whrther the boolean expression evaluetes to true or false 

IIF ((expression), true_value, false_value)
IIF ((Gender = 'f'), 'femal', 'Male')
*/

/* return the value 'low price' if the product unit price is less than $50, otherwise, return 'hight price'
*/

select 
P.ProductID as 'ID', 
P.ProductName as 'Product', 
P.UnitPrice as 'Price',
IIF ((P.UnitPrice < 50), 'Low Price', 'Hight Price' ) as 'Price Status'
from [Production].[Products] as P
 ;
 go

 /*
 Case expression evaluetes a list of items and returns one of the multiple result epression
 */

 select 
P.ProductID as 'Product No', 
P.ProductName as 'Product', 
P.UnitPrice as 'Price',
'Price Range' = 
	case 
	-- when condition 
	when P.UnitPrice = 0 then 'Out of Stock - Item not available'
	when P.UnitPrice < 50 then 'Unit price is less than $50'
	when P.UnitPrice between 50 and 250 then 'Unit price under $250'
	when P.UnitPrice between 251 and 1000 then 'Unit price under $1000'
	else 'Unit price over $1000'
	end
from [Production].[Products] as P
-- where ProductID = 38
 ;
 go

  select 
P.ProductID as 'Product No', 
P.ProductName as 'Product', 
P.UnitPrice as 'Price', 
	case 
	-- when condition 
	when P.UnitPrice = 0 then 'Out of Stock - Item not available'
	when P.UnitPrice < 50 then 'Unit price is less than $50'
	when P.UnitPrice between 50 and 250 then 'Unit price under $250'
	when P.UnitPrice between 251 and 1000 then 'Unit price under $1000'
	else 'Unit price over $1000'
	end
	as 'Price Range'
from [Production].[Products] as P
 ;
 go

 /* Choose function returns values at the specified index from a list of values:
 SYNTAX:
 choose(index, value1, value2, ...) - index is one-based
 */

 select CHOOSE(2, 'Manager', 'Developer', 'Programer', 'Analyst', 'Tester')
 ;
 go

select CHOOSE(C.CategoryID, 'A', 'B', 'C','D','E','F','G','H') as 'CategorieABS'
from [Production].[Categories] as C
;
go

-- SOme String Functions
/* return the customer full address */

select CustomerID, CompanyName, 
(Address+' '+City+' '+isnull(Region, '')+' '+PostalCode+' '+Country) as 'Customer Address'
from Sales.Customers
;
go
/*
IsNull() replaced null with the specified replacement value
SYNTAX isNull(check_expression, replaced value)
*/

-- re-write the previose script using concat() function
select CustomerID, CompanyName, 
concat(Address,' ',City,' ',Region, ' ',PostalCode,' ',Country) as 'Customer Address'
from Sales.Customers
;
go

-- re-write the previose script using coalesce() function
select CustomerID, CompanyName, 
concat(Address,' ',City,' ', coalesce (Region, '-'), PostalCode,' ',Country) as 'Customer Address'
from Sales.Customers
;
go

-- re-write the previose script using concat_ws() function
-- concat_ws() SQL Server 2017 and >
select CustomerID, CompanyName, 
concat_ws (' ', Address, City, coalesce(Region, '-'), PostalCode, Country) as 'Customer Address'
from Sales.Customers
;
go

/*
left([column_name], number)
right([column_name], number)
substring([column_name], start, lenght)
*/

/* return the first 3 char of employee first name and 4 char of employee last name
*/
select 
EmployeeID, 
UPPER(CONCAT (left(FirstName, 3), '-', left(LastName, 4)))
from [HumanResources].[Employees]
;
go

/* 
return customer information and the aria code of customers in brazil
*/

select CompanyName, substring(Phone, 2, 2) as 'Area Code', Country
from [Sales].[Customers]
where Country = 'Brazil' 
;
go


/*
return company and the area code of suppliers in Canada, USA, and Mexico
*/

select  CompanyName, substring(Phone, 2, 3) as 'Area Code', Country
from [Production].[Suppliers]
where Country in ('Canada', 'USA', 'Mexico')
;
go

-- return DB name in use
select
DB_NAME() 'DB name',
DB_ID() 'DB ID'
;
go

/* cast() and convert() allows you to convert data type to another.
If the data typies are incopatible cast will return error.
*/

select cast(SYSDATETIME() as int)
;
go

select cast('20180405' as int)
;
go

/* convert() function 
convert(data_type, value, [optional_style_number])
*/

select	CONVERT(char(12), CURRENT_TIMESTAMP, 103) as 'UK',
		CONVERT(char(12), CURRENT_TIMESTAMP, 104) as 'German',
		CONVERT(char(12), CURRENT_TIMESTAMP, 112) as 'ISO',
		CONVERT(char(12), CURRENT_TIMESTAMP, 110) as 'USA'

/* using parse and try_parse functions */
-- PARSE ( string_value AS data_type [ USING culture ] )  
select	parse ('13/9/2019' as datetime using 'en-us') as 'US',
		parse ('04/05/2019' as datetime using 'fr-fr') as 'france',
		parse ('04/05/2019' as datetime using 'fr-ca') as 'canada',
		parse ('04/05/2019' as datetime using 'en-ca') as 'en canada'

-- TRY_PARSE ( string_value AS data_type [ USING culture ] )  
select 
TRY_PARSE ('13/9/2019' as datetime using 'en-us') as 'US'

/* 
international lengueges supported by SQL Server */
execute sp_helplanguage
;
go

/* @@LangID returns the local language identifier (ID) of the lenguage that is curr used*/

select @@LANGID as 'Lang'
;
go

set language 'English'
select @@LANGID as 'Lang'
;
go

set language 'Italian'
declare @today as datetime
set @today = '04/05/2019'
select DATENAME(month, @today) as 'Month Name'
;
go

select [CustomerID], count (OrderID)
from [Sales].[Orders]
;
go


/* concatenate a string to an ordeer number (number value) */
/*select ISNULL(N'SO' + CONVERT(nvarchar(8), OrderID), N'***Error) 
from Sales.Orders
;
go

*/

