/* Purpose: queries.
Script Date: April 5th ,2019
Developped by Matthew, Sergei, Levar, Tony
 */

use JAClib
 ;
 go

 select *
 from customer.Faculty		-- inital check of table data
 ;
 go

 select *
 from customer.Members		-- inital check of table data
 ;
 go

 select *
 from customer.Reservations		-- inital check of table data
 ;
 go

 select *
 from customer.Students			-- inital check of table data
 ;
 go

 select *
 from employee.Copies			-- inital check of table data
 ;
 go

 select *
 from employee.LoanHistory		-- inital check of table data
 ;
 go

 select *
 from employee.Loans			-- inital check of table data
 ;
 go

 select *
 from material.Authors			-- inital check of table data
 ;
 go

 select *
 from material.Items			-- inital check of table data
 ;
 go

 select *
 from material.Publishers			-- inital check of table data
 ;
 go

 select *
 from material.Titles				-- inital check of table data
 ;
 go

 
 /*1. Create a mailing list of Library members that includes 
 the members full names and complete address information.  
 */

select Concat(M.FirstName, ISNULL(M.MiddleName, ' '), M.LastName) as 'Full Name', 
S.Address, S.City, S.Province, S.PostalCode
from customer.Members as M
inner join customer.Students as S
on M.MemberID = S.MemberID 
;
go



 /*2. Write and execute a query on the title, item, and copy tables that returns 
 the isbn, copy_no, on_loan, title, translation, and cover, and values for rows 
 in the copy table with an ISBN of 1 (one), 500 (five hundred), or 1000 (thousand).  
 Order the result by isbn column. */
 select MI.ISBN , EC.CopyID as 'copy_no', MI.Loanable as 'on_loan', MT.Title, MI.Language, MI.Cover
from [material].[Titles] as MT
inner join [material].[Items] as MI
on MT.TitleID = MI.TitleID
inner join [employee].[Copies] as EC
on EC.ItemID = MI.ItemID
order by MI.ISBN asc
;
go

 
 /*3. Write and execute a query to retrieve the members full name and member_no from 
 the member table and the isbn and log_date values from the reservation table for 
 members 250, 341, 1675. Order the results by member_no. You should show information for these members,
 even if they have no books or reserve.  
 */
 select 
 Concat(M.FirstName, ISNULL(M.MiddleName, ' '), M.LastName) as 'Full Name', 
 M.MemberID as 'member_no',
 I.ISBN as 'ISBN',
 R.RDate as 'log_date'
from customer.Members as M
inner join customer.Reservations as R
on M.MemberID = R.MemberID 
inner join material.Items as I
on R.ItemID = I.ItemID
where M.MemberID in (3, 18, 20)
order by convert (int, M.MemberID) asc -- nchar to int for sorting
;
go
