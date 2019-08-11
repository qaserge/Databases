/* Purpose: Create John Abbott Library Database.
Script Date: March 28th ,2019
Developped by Matthew, Sergei, Levar, Tony
 */

 use JAClib
 ;
 go

/*
customer
employee
material*/

/************** NO.1 Table Members **************************************/

if OBJECT_ID ('customer.Members', 'U') is not null
	drop table customer.Members
	;
	go
create table customer.Members
(
	MemberID nchar(8) not null,
	FirstName varchar(25) not null,
	MiddleName varchar(25) null,
	LastName varchar(25) not null,
	Picture varbinary(max) null,
	constraint pk_Members primary key clustered (MemberID)
)
;
go

 /************** NO.2 Table Loans **************************************/

if OBJECT_ID ('employee.Loans', 'U') is not null
	drop table employee.Loans
	;
	go

create table employee.Loans   -- composite primary keys
(
	CopyID nchar(8) not null,
	ItemID nvarchar(13) not null,  -- FK
	TitleID nchar(8) not null, -- FK
	MemberID nchar(8) not null, -- FK	
	DueDate datetime not null,
	ReturnedDate datetime null,
	OutDate datetime not null,
	constraint pk_Loans primary key clustered([CopyID],[ItemID])
)
;
go

 /************** NO.3 Table Copies **************************************/

if OBJECT_ID ('employee.Copies', 'U') is not null
	drop table employee.Copies
	;
	go

create table employee.Copies
(
	CopyID nchar(8) not null,
	ItemID nvarchar(13) not null, -- FK
	TitleID nchar(8) not null,   --FK
	OnLoan bit not null,   -- bit (true or false)
	constraint pk_Copies primary key clustered(CopyID)
)
;
go

 /************** NO.4 Table Reservations **************************************/
 if OBJECT_ID ('customer.Reservations', 'U') is not null
	drop table customer.Reservations
	;
	go

create table customer.Reservations -- composite primary keys
(
	ItemID nvarchar(13) not null,
	MemberID nchar(8) not null,
	RDate datetime not null,
	Notes varchar(255) null,
	constraint pk_Reservations primary key clustered ([ItemID],[MemberID])
)
;
go


 /************** NO.5 Table Students **************************************/

 if OBJECT_ID ('customer.Students', 'U') is not null
	drop table customer.Students
	;
	go

 create table customer.Students
 (
	StudentID nchar(8) not null,
	MemberID nchar(8) not null, -- FK
	StudentNumber varchar(15) not null,
	Address varchar(40) not null,
	City varchar(25) not null,
	Province char(2) not null,
	PostalCode char(10) not null,
	Phone varchar(16) not null,
	ExpirationDate datetime not null,
	constraint pk_Students primary key (StudentID)
 )
 ;
 go




  /************** NO.6 Table Faculty **************************************/

 if OBJECT_ID ('customer.Faculty', 'U') is not null
	drop table customer.Faculty
	;
	go

  create table customer.Faculty
  (
	FacultyID nchar(8) not null,
	MemberID nchar(8) not null, -- FK
	Address varchar(30) not null,
	City varchar(25) not null,
	Province char(2) not null,
	PostalCode char(10) not null,
	Phone varchar(16) not null,
	ExpirationDate datetime not null,
	constraint pk_Faculty primary key clustered (FacultyID)
 )
 ;
 go

   /************** NO.7 Table Item **************************************/
   /* ISBNID was previous priary key,but client requested a slight change to this. They require each Library
      item to have it's own unique ID seperate from the ISBN */
 if OBJECT_ID ('material.Items', 'U') is not null
	drop table material.Items
	;
	go

 create table material.Items
 (
	ItemID nvarchar(13) not null,
	TitleID nchar(8) not null,  -- FK
	PublisherID nchar(8) not null, -- FK
	Language varchar(2) not null, -- FK
  ISBN nvarchar(18) not null,
	Cover varbinary(max) null,
	Loanable bit not null,
	constraint pk_Item primary key clustered (ItemID)
 )
 ;
 go
 alter table material.Items
	alter column Cover nvarchar(100) null
;
go
alter table material.Items
	alter column Language varchar(20)not null
;
go

  /************** NO.8 Table Author **************************************/

 if OBJECT_ID ('material.Authors', 'U') is not null
	drop table material.Authors
	;
	go

create table material.Authors
(
	AuthorID nchar(8) not null,
	FirstName varchar(25) not null,
	LastName varchar(25) not null,
	constraint pk_Author primary key clustered (AuthorID)
)
;
go


 /************** NO.9 Table Titles **************************************/

 if OBJECT_ID ('material.Titles', 'U') is not null
	drop table material.Titles
	;
	go
/*
ALTER TABLE employee.Copies
drop fk_Copies_Titles;
go
*/

create table material.Titles
(
	TitleID nchar(8) not null,
	AuthorID nchar(8) not null, -- FK
	PublisherID nchar(8) not null, -- FK
	Title varchar(100) not null,
  Genre varchar(50) not null,
	Summary varchar(255) not null,
	constraint pk_Titles primary key clustered (TitleID)
)
;
go


 /************** NO.10 Table Publishers **************************************/

 if OBJECT_ID ('material.Publishers', 'U') is not null
	drop table material.Publishers
	;
	go

create table material.Publishers
(
	PublisherID nchar(8) not null,
	PublisherName varchar(25) not null,
	City varchar(25) not null,
	Region varchar(2) not null,
	PostalCode varchar(10) not null,
	Phone varchar(16) not null,
	constraint pk_Publishers primary key clustered (PublisherID)
)
;
go
alter table material.Publishers
	alter column PublisherName varchar(40) not null
;
go
alter table material.Publishers
	alter column Region varchar(20) not null
;
go

/************** NO.11 Table LoanHistory **************************************/

 if OBJECT_ID ('employee.LoanHistory', 'U') is not null
	drop table employee.LoanHistory
	;
	go
create table employee.LoanHistory
(
	OutDate datetime not null,
	ItemID nvarchar(13) not null,  -- FK
	CopyID nchar(8) not null,
	TitleID nchar(8) not null, -- FK
	MemberID nchar(8) not null, -- FK
	DueDate datetime not null,
	InTime datetime null,
	FineWaived smallmoney null,
	FinePaid smallmoney null,
	FineAssessed smallmoney null,
	Noted varchar(255) null,
	constraint pk_LoanHistory primary key clustered ([OutDate],[ItemID],[CopyID])
)
;
go





