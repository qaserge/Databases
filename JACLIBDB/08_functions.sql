/* Purpose: functions.
Script Date: April 5th ,2019
Developped by Matthew, Sergei, Levar, Tony
 */
 
 -- 6. What is the average length of a loan?

 use JAClib
 ;
 go


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


select AVG(employee.getNumberOfDaysFn(OutDate, DueDate)) as 'Average length of a loan'
from employee.Loans
;
go

