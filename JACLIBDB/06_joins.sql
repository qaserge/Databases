/* Purpose: joins.
Script Date: April 5th ,2019
Developped by Matthew, Sergei, Levar, Tony
 */

-- 4. What percentage of the books was loaned out at least once last year?

select 
CAST( (count(distinct LH.ItemID) * 100) / (count(I.ItemID)) AS NUMERIC(10, 2) ) as 'Percentage %'
from material.Items as I
left outer join employee.LoanHistory as LH
on I.ItemID = LH.ItemID
;
go
