/* Purpose: diable constraint
Script Date 04/03/2019
Developed By: Sergei
*/

/* in order to create a new db, switch to the master db */
/* add a statment that specified the script runs in the context of the master db */

-- switch to the master database
-- SYNTAX: use database_name

use tempdb
;
go -- include end of batch marlers (go statement)

-- Step 1. Create a table 

create table TSample
(
	TSampleID int not null,
	TSampleName nvarchar(10) not null,
	Salary decimal(18,2) not null,
	constraint pk_TSample primary key clustered (TSampleID)
)
;
go

-- Step 2. Create a check constraint

alter table TSample
	add constraint ck_Salary_TSample check (Salary < 100000)
	;
	go 

-- Step 3. Insert valid data (2 rows will be inserted)

insert into TSample
values (1, 'Joe Brown', 65000)
;
go

insert into TSample
values (2, 'Mary Smith', 75000)
;
go

select *
from TSample
;
go

-- Step 4. Try to insert data that violate the constraint.
-- (will fail with a constraint violation)

insert into TSample
values (3, 'Pat Jones', 105000)
;
go

-- Step 5. Disable the constraint and try again.
-- 1 row will be inserted
alter table TSample
	nocheck constraint ck_Salary_TSample
	;
	go 

-- Step 6. insert data again.
insert into TSample
values (3, 'Pat Jones', 105000)
;
go

-- Step 7. re-enable the constraint.
-- nocheck is the default value
alter table TSample
	check constraint ck_Salary_TSample
	;
	go 

-- Step 8. Disable the constraint and enable again, but this time use WITH CHECK
-- it is not working, since the executing data is checked now

alter table TSample
	nocheck constraint ck_Salary_TSample
	;
	go

alter table TSample
	with check check constraint ck_Salary_TSample
	;
	go 

-- Step 9. DELETE the row and try to eneble again.

delete 
from TSample
where TSampleID=3
;
go

alter table TSample
	with check check constraint ck_Salary_TSample
	;
	go 

