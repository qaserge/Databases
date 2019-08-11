/* Purpose: user_defined_views
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

select *
from sys.all_views
;
go

select *
from INFORMATION_SCHEMA.VIEWS
;
go

/* SYNTAX

create view schema_name.view_name
[with encription]
as 
select <list column>
from object_name
*/

/* create an employee view, EmployeeView, that returns the first and the last name.
Check if the view wxists so drop it and then re-create it */

if OBJECT_ID('HumanResources.EmployeesView', 'V') is not null
drop view HumanResources.EmployeesView
;
go

create view HumanResources.EmployeesView
as 
select E.FirstName, E.LastName
from HumanResources.Employees as E
;
go

select *
from HumanResources.EmployeesView
;
go


/* modify the HumanResources.EmployeesView by adding the employee id and the title
*/

alter view HumanResources.EmployeesView
as
select E.EmployeeID, E.FirstName, E.LastName, E.Title
from HumanResources.Employees as E
;
go

/* change the column heading in the HumanResources.EmployeesView to 
EmployeeNo, GivenName, FamilyName, JobTitle
*/

alter view HumanResources.EmployeesView (EmployeeNo, GivenName, FamilyName, JobTitle)
as
select E.EmployeeID, E.FirstName, E.LastName, E.Title
from HumanResources.Employees as E
;
go

select *
from HumanResources.EmployeesView
;
go

/* return the defenition of the HumanResources.EmployeesView */
execute sp_helptext 'HumanResources.EmployeesView'
;
go

/* protect the view defenition of the HumanResources.EmployeesView */
alter view HumanResources.EmployeesView (EmployeeNo, GivenName, FamilyName, JobTitle)
with encryption
as
select E.EmployeeID, E.FirstName, E.LastName, E.Title
from HumanResources.Employees as E
;
go

/* decrypted the view defenition of the HumanResources.EmployeesView */
alter view HumanResources.EmployeesView (EmployeeNo, GivenName, FamilyName, JobTitle)
-- with encryption
as
select E.EmployeeID, E.FirstName, E.LastName, E.Title
from HumanResources.Employees as E
;
go

/* create the order total view (OrderTotalView) that returns the sum of each order */

select OD.OrderID, sum(convert(money,(OD.UnitPrice * OD.Quantity) * (1 - OD.Discount))) as 'Order Total'
from  [Sales].[Order Details] as OD
group by OD.OrderID
;
go

create view Sales.OrdersView
as
select OD.OrderID, sum(convert(money,(OD.UnitPrice * OD.Quantity) * (1 - OD.Discount))) as 'Order Total'
from  [Sales].[Order Details] as OD
group by OD.OrderID
;
go

/* what is the grand total of the order number 10248 */

select *
from Sales.OrdersView
where OrderID = 10248
;
go

/* create a view, CustomerContactNameView that returns the CustomerID, Contact Name, Contact Title, and phone Number
*/

create view Sales.CustomerContactNameView
as
select C.CustomerID, C.CompanyName, C.ContactTitle, C.Phone
from [Sales].[Customers] as C
;
go


/* return the list of orders with their grand total placed by customer ID 'ALFKI'.
List Company name, orders, and the sum of each order.
*/

select *
from Sales.OrdersView 
;
go

select 
C.CompanyName, 
O.OrderID, 
OTV.[Order Total]
from  [Sales].[Customers] as C
inner join  [Sales].[Orders] as O
on C.CustomerID = O.CustomerID
inner join Sales.OrdersView as OTV
on O.OrderID = OTV.OrderID
where C.CustomerID = 'ALFKI'
;
go
