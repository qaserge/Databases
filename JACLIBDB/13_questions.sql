 use JAClib
 ;
 go
 
/*1. Create a mailing list of Library members that includes 
 the members’ full names and complete address information.  
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
select MI.ISBN , EC.CopyID as 'copy_no', EC.OnLoan as 'on_loan', MT.Title, MI.Language, MI.Cover
from [material].[Titles] as MT
inner join [material].[Items] as MI
on MT.TitleID = MI.TitleID
inner join [employee].[Copies] as EC
on EC.ItemID = MI.ItemID
where MI.ISBN in('117460044-6', '277284667-9', '383771869-7')
order by MI.ISBN asc
;
go

 
 /*3. Write and execute a query to retrieve the member’s full name and member_no from 
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


/* 4. Create a view and save it as adultwideView that queries the member and adult tables.  
Lists the name & address for all adults. */
create view customer.adultwideView
as
	select 
	Concat(M.FirstName, ISNULL(M.MiddleName, ' '), M.LastName) as 'Full Name', 
F.Address, F.City, F.Province, F.PostalCode
from customer.Members as M
	inner join customer.Faculty as F
	on M.MemberID = F.MemberID 
;
go

select *
from  customer.adultwideView
;
go



/*5. Create a view and save it as ChildwideView that queries the member, adult,
 and juvenile tables.  Lists the name & address for the juveniles. */
 create view customer.ChildwideView
 as
 select concat(M.FirstName, ISNULL(M.MiddleName, ' '), M.LastName) as 'Full Name', 
  S.Address, S.City, S.Province,S.PostalCode
 from customer.Members as M
	inner join customer.Students as S
	on M.MemberID = S.MemberID
;
go

select *
from customer.ChildwideView
;
go

/*6. Create a view and save it as and CopywideView that queries the copy, title and item tables. 
 Lists complete information about each copy. 
 */
 create view employee.CopywideView
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
from employee.CopywideView
;
go

/*7. Create a view and save it as LoanableView that queries CopywideView (3-table join). 
 Lists complete information about each copy marked as loanable (loanable = 'Y'). */

 create view employee.LoanableView
 as
	select *
	from CopywideView
	where Loanable = 1
;
go

select *
from employee.LoanableView
;
go


/*8. Create a view and save it as OnshelfView that queries CopywideView (3-table join). 
Lists complete information about each copy that is not currently on loan (on_loan ='N'). */

create view employee.OnshelfView
as 
	select  ItemID,TitleID,PublisherID,Language,ISBN ,Cover,Loanable,
	CopyID,OnLoan,AuthorID,Title,Genre,Summary
	from CopywideView
	where OnLoan = 0
;
go

select *
from employee.OnshelfView
;
go

/*9. Create a view and save it as OnloanView that queries the loan, title, and member tables. 
Lists the member, title, and loan information of a copy that is currently on loan. 
 */
 create view employee.OnloanView
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
from employee.OnloanView
;
go

/* 
10. Create a view and save it as OverdueView that queries OnloanView (3-table join.)
Lists the member, title, and loan information of a copy on loan that is overdue (due_date
< current date). 
*/
create view employee.OverdueView
  as 
select MemberID,Title,CopyID,ItemID,DueDate,OutDate
from OnloanView
where (DueDate<getdate())
;
go


select*
from employee.OverdueView
;
go


execute sp_tables
;
go

-- 1. How many loans did the library do last year?

create procedure employee.getNumOfLoansInLastYear 
as
begin 
select count(LH.OutDate) as 'loans in the last year'
from [employee].[LoanHistory] as LH
where year(LH.OutDate) = YEAR(getdate())
end
;
go

-- execute getNumOfLoansInLastYear
execute employee.getNumOfLoansInLastYear
;
go


-- 2. What percentage of the membership borrowed at least one book?

create procedure employee.getPercMemBorr 
as
begin
select CAST( (count(distinct LH.MemberID) * 100) / (count(M.MemberID)) AS NUMERIC(10, 2) ) as 'Percentage %'
from customer.Members as M
left outer join employee.LoanHistory as LH
on LH.MemberID = M.MemberID
end
;
go
-- execute getNumOfLoansInLastYear
execute employee.getPercMemBorr
;
go


-- 3. What was the greatest number of books borrowed by any one individual?
create procedure employee.getNumBookBorInd 
as
begin

SELECT MAX(CM.C) as 'greatest number of books borrowed by any one individual'
  FROM (SELECT COUNT(ItemID) AS C
          FROM employee.LoanHistory
		  group by MemberID) as CM
 end
;
go

  execute employee.getNumBookBorInd
GO


-- 4. What percentage of the books was loaned out at least once last year?

select 
CAST( (count(distinct LH.ItemID) * 100) / (count(I.ItemID)) AS NUMERIC(10, 2) ) as 'Percentage %'
from material.Items as I
left outer join employee.LoanHistory as LH
on I.ItemID = LH.ItemID
;
go

-- 5. What percentage of all loans eventually becomes overdue?

select 
CAST( (count( distinct LH.ItemID) * 100) / (count(L.TitleID)) AS NUMERIC(10, 2) )/(count(L.TitleID))*4 as 'Percentage %'
-- ,LH.DueDate,InTime
from employee.LoanHistory as LH
left outer join employee.Loans as L
on LH.ItemID=L.ItemID
;
go

-- 6. What is the average length of a loan?

if OBJECT_ID('employee.getNumberOfDaysFn', 'Fn') is not null
drop function employee.getNumberOfDaysFn
;
go

create function employee.getNumberOfDaysFn
(	
	@OutDate as datetime,
	@DueDate as datetime
)
returns int
as 
	begin
	declare @Period as int	
	select @Period = abs(DATEDIFF(DAY, @OutDate, @DueDate ))
		if (@Period is null)
	begin
		set @Period = 0
		end
		return @Period
	end
;
go

select AVG(employee.getNumberOfDaysFn(OutDate, DueDate)) as 'average length of a loan'
from employee.Loans
;
go

-- 7. What are the library peak hours for loans?

Select count (ItemID) as 'Number of Loans in this hour', DATEPART(HOUR, OutDate) as 'Peak Hours'
from employee.LoanHistory
group by DATEPART(HOUR, OutDate)
order by 'Number of Loans in this hour' desc
;
go