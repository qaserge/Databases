/* Purpose: stored procedures.
Script Date: April 5th ,2019
Developped by Matthew, Sergei, Levar, Tony
 */

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

execute employee.getNumOfLoansInLastYear
GO
                              
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

execute employee.getPercMemBorr
GO

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

  -- 5. What percentage of all loans eventually becomes overdue? 
create procedure PercentLoanOverduePR
as
select 

CAST( (count( distinct LH.ItemID) * 100) / (count(L.TitleID)) AS NUMERIC(10, 2) )/(count(L.TitleID))*4 as 'Percentage %'
from employee.LoanHistory as LH
left outer join employee.Loans as L
on LH.ItemID=L.ItemID;
go
exec PercentLoanOverduePR;
go

-- 5. What percentage of all loans eventually becomes overdue? 

SELECT *
FROM employee.Loans
WHERE Loans.DueDate > Loans.OutDate;
go

create procedure PercentLoanOverduePR2
as
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employee.Loans)
FROM employee.Loans
WHERE Loans.DueDate < Loans.ReturnedDate;
go

exec PercentLoanOverduePR2;
go

SELECT *
FROM employee.Loans
WHERE Loans.DueDate > Loans.ReturnedDate;
go


/* 7. What are the library peak hours for loans? */
Create procedure PeakPR2
as
Select count (ItemID) as 'Number of Loans in this hour', DATEPART(HOUR, OutDate) as 'Hours'
from employee.LoanHistory
group by DATEPART(HOUR, OutDate)
order by 'Number of Loans in this hour' desc
;
go

exec PeakPR2;
go
