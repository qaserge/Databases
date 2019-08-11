/* Purpose: views.
Script Date: April 5th ,2019
Developped by Matthew, Sergei, Levar, Tony
 */
 
 /* 4. Create a view and save it as adultwideView that queries the member and adult tables.  
Lists the name & address for all adults. */
create view adultwideView
as
	select Concat(M.FirstName, ISNULL(M.MiddleName, ' '), M.LastName) as 'Full Name', 
F.Address, F.City, F.Province, F.PostalCode
from customer.Members as M
	inner join customer.Faculty as F
	on M.MemberID = F.MemberID 
;
go

select *
from adultwideView
;
go



/*5. Create a view and save it as ChildwideView that queries the member, adult,
 and juvenile tables.  Lists the name & address for the juveniles. */
 create view ChildwideView
 as
 select concat(M.FirstName, ISNULL(M.MiddleName, ' '), M.LastName) as 'Full Name', 
  S.Address, S.City, S.Province,S.PostalCode
 from customer.Members as M
	inner join customer.Students as S
	on M.MemberID = S.MemberID
;
go

select *
from ChildwideView
;
go


/*6. Create a view and save it as and CopywideView that queries the copy, title and item tables. 
 Lists complete information about each copy. 
 */
 create view CopywideView
 as
	select I.ItemID,I.TitleID,I.PublisherID,I.Language,I.ISBN ,I.Cover,I.Loanable,
	C.CopyID,C.OnLoan,T.AuthorID,T.Title,T.Genre,T.Summary
	from material.Titles as T
	inner join employee.Copies as C
	on T.TitleID = C.TitleID
	inner join material.Items as I
	on T.TitleID = I.TitleID
;
go

select *
from CopywideView
;
go


/*7. Create a view and save it as LoanableView that queries CopywideView (3-table join). 
 Lists complete information about each copy marked as loanable (loanable = 'Y'). */

 create view LoanableView
 as
	select *
	from CopywideView
	where Loanable = 1
;
go

select *
from LoanableView
;
go


/*8. Create a view and save it as OnshelfView that queries CopywideView (3-table join). 
Lists complete information about each copy that is not currently on loan (on_loan ='N'). */

create view OnshelfView
as 
	select  ItemID,TitleID,PublisherID,Language,ISBN ,Cover,Loanable,
	CopyID,OnLoan,AuthorID,Title,Genre,Summary
	from CopywideView
	where OnLoan =0
;
go

select *
from OnshelfView
;
go


/*9. Create a view and save it as OnloanView that queries the loan, title, and member tables. 
Lists the member, title, and loan information of a copy that is currently on loan. 
 */
 create view OnloanView
 as
select M.MemberID,C.Onloan,L.CopyID,C.ItemID,T.Title,T.AuthorID,T.PublisherID,T.Genre,T.Summary, L.DueDate, L.OutDate
from employee.copies as C
inner join material.Titles as T
on C.TitleID = T.TitleID
inner join employee.Loans as L
on L.TitleID = C.TitleID 
inner join customer.Members as M
on L.MemberID = M.MemberID
where OnLOAN=1
;
go


select*
from OnloanView
;
go

/* 
10. Create a view and save it as OverdueView that queries OnloanView (3-table join.)
Lists the member, title, and loan information of a copy on loan that is overdue (due_date
< current date). 
*/
create view OverdueView
  as 
select MemberID,Title,CopyID,ItemID,DueDate,OutDate
from OnloanView
where (DueDate<getdate())
;
go

select*
from OverdueView
;
go