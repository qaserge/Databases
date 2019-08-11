/* Purpose: Create John Abbott Library Database.
Script Date: March 28th ,2019
Developped by Matthew, Sergei, Levar, Tony
 */

 use JAClib
 ;
 go

/************** NO.1 Table Members **************************************/
/*no*/

/************** NO.2 Table Loans **************************************/
/* Between employee.Loans and employee.Copies */
ALTER TABLE employee.Loans
ADD CONSTRAINT fk_Loans_Copies foreign key (CopyID) REFERENCES employee.Copies (CopyID);
go
/* Between employee.Loans and customer.Members */
ALTER TABLE employee.Loans
ADD CONSTRAINT fk_Loans_Members foreign key (MemberID) REFERENCES customer.Members (MemberID);
go
/* set the default constraint value to Current Date for OutDate column */
ALTER TABLE employee.Loans
ADD CONSTRAINT df_Loans_OutDate DEFAULT 'GETDATE()' FOR OutDate;
go
/* check that the following column values in the OutDate <=  DueDate */
ALTER TABLE employee.Loans
ADD CONSTRAINT df_Loans_OutDateDueDate CHECK (OutDate<=DueDate);
go
ALTER TABLE employee.Loans
drop df_Loans_OutDateDueDate;
go
/************** NO.3 Table Copies **************************************/
/* Between employee.Copies and material.Titles */
ALTER TABLE employee.Copies
ADD CONSTRAINT fk_Copies_Titles foreign key (TitleID) REFERENCES material.Titles (TitleID);
go
/* Between employee.Copies and employee.Loans */
ALTER TABLE employee.Loans
ADD CONSTRAINT fk_Copies_Loans foreign key (CopyID) REFERENCES employee.Copies (CopyID);
go

 /************** NO.4 Table Reservations **************************************/
   /* Between material.Items and customer.Reservations */
ALTER TABLE customer.Reservations
ADD CONSTRAINT fk_customer_Reservations foreign key (ItemID) REFERENCES material.Items (ItemID);
go

 /************** NO.5 Table Students **************************************/
 /* Between customer.Students and customer.Members */
ALTER TABLE customer.Students
ADD CONSTRAINT fk_Students_Members foreign key (MemberID) REFERENCES customer.Members (MemberID);
go
/* set the default constraint value to QC for Province */
ALTER TABLE customer.Students
ADD CONSTRAINT df_Students_Province DEFAULT 'QC' FOR Province;
go
/*set the StudentNumber as unique */
 ALTER TABLE customer.Students
 ADD CONSTRAINT uc_StudentNumber unique (StudentNumber);
 go

 /************** NO.6 Table Faculty **************************************/
  /* Between customer.Faculty and customer.Members */
ALTER TABLE customer.Faculty
ADD CONSTRAINT fk_Faculty_Members foreign key (MemberID) REFERENCES customer.Members (MemberID);
go
/* set the default constraint value to QC for Province */
ALTER TABLE customer.Faculty
ADD CONSTRAINT df_Faculty_Province DEFAULT 'QC' FOR Province;
go
/*check that no phone number is not a digit*/
ALTER TABLE customer.Faculty
ADD CONSTRAINT chk_phone CHECK (phone like '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');
go
/*
ALTER TABLE customer.Faculty
drop chk_phone;
go
*/
 /************** NO.7 Table Item **************************************/
  /* Between material.Items and material.Publishers */
ALTER TABLE material.Items
ADD CONSTRAINT fk_Items_Publishers foreign key (PublisherID) REFERENCES material.Publishers (PublisherID);
go

 /************** NO.8 Table Author **************************************/
 /*no*/

 /************** NO.9 Table Titles **************************************/
   /* Between material.Titles and material.Authors */
ALTER TABLE material.Titles
ADD CONSTRAINT fk_Titles_Authors foreign key (AuthorID) REFERENCES material.Authors (AuthorID);
go
/* Between material.Titles and material.Publishers */
ALTER TABLE material.Titles
ADD CONSTRAINT fk_Titles_Publishers foreign key (PublisherID) REFERENCES material.Publishers (PublisherID);
go

 /************** NO.10 Table Publishers **************************************/
 /*add unique to Publisher Name*/
 ALTER TABLE material.Publishers
 ADD CONSTRAINT uc_PublisherName unique (PublisherName);
 go

/************** NO.11 Table LoanHistory **************************************/
/* Between employee.Copies and employee.LoanHistory */
ALTER TABLE employee.LoanHistory
ADD CONSTRAINT fk_LoanHistory_Copies foreign key (CopyID) REFERENCES employee.Copies (CopyID);
go
/* Between customer.Members and employee.LoanHistory */
ALTER TABLE employee.LoanHistory
ADD CONSTRAINT fk_LoanHistory_Members foreign key (MemberID) REFERENCES customer.Members (MemberID);
go
/* Between material.Titles and employee.LoanHistory */
ALTER TABLE employee.LoanHistory
ADD CONSTRAINT fk_LoanHistory_Titles foreign key (TitleID) REFERENCES material.Titles (TitleID);
go
