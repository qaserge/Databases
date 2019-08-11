/* Purpose: transaction.
Script Date: April 5th ,2019
Developped by Matthew, Sergei, Levar, Tony
 */
 use JAClib
 ;
 go
 /* this procedure adds a student to the student and members table
 */
 CREATE PROCEDURE customer.AddStudentPR
   @FirstName varchar(25),
   @MiddleName varchar(25),
   @LastName varchar(25),
   @Picture varbinary(max),
   @StudentID nchar(8),
   @StudentNumber tinyint,
   @Address varchar(25),
   @City varchar(25),
   @Province char(2),
   @PostalCode char(10),
   @Phone varchar(16),
   @MemberID nchar(8) output
 AS

 DECLARE @ExpirationDate datetime
 SET @ExpirationDate = DATEADD(year,1,GETDATE())

 -- test for nulls
 IF @FirstName is null OR @LastName is null OR @Address is null OR @City is null OR #Province is null or @PostalCode
 BEGIN
   RAISERROR('Field Cannot Be Empty',11,1)
   Return
 END

 /* add new member to the customers.members table then
 add that member as a student */
 begin TRANSACTION
   INSERT customer.Members (FirstName,MiddleName,LastName,Picture)
   VALUES (@FirstName,@MiddleName,@LastName,@Picture)

   -- test
   IF @@ERROR <> 0
     BEGIN
       RAISERROR('Invalid, member not added',11,1)
       ROLLBACK TRANSACTION
       Return
     END

   SET @MemberID = Scope_Identity();

   INSERT customer.Students (MemberID,StudentNumber,Address,City,Province,PostalCode,Phone,ExpirationDate)
   VALUES (@MemberID,@StudentNumber,@Address,@City,@Province,@PostalCode,@Phone,@ExpirationDate)

   -- test
   IF @@ERROR <> 0
     BEGIN
       RAISERROR('Invalid, member not added',11,1)
       ROLLBACK TRANSACTION
       Return
     END
 COMMIT TRANSACTION



 /* ************************************************************ 
  transaction that check if item onloan or no, and if it is in the reservation list. If it onloan i insert data to the reservation table.
  */
 
 use jaclib
;
go


if OBJECT_ID('employee.getReservationSP', 'p') is not null
drop PROCEDURE employee.getReservationSP
;
go


create PROCEDURE employee.getReservationSP  
(
     @ItemID nvarchar(13),
@MemberID nchar(8)
)
AS
BEGIN
    BEGIN TRANSACTION;
    SAVE TRANSACTION MySavePoint;


    BEGIN TRY
IF (((SELECT Loanable FROM material.Items WHERE ItemID = @ItemID and Loanable=0) is not null)  
or 
((select ItemID from customer.Reservations where ItemID = @ItemID) is not null))
BEGIN
INSERT INTO customer.Reservations
([ItemID],[MemberID],[RDate],[Notes])
values (@ItemID, @MemberID, CURRENT_TIMESTAMP, 'blablabla')
END
COMMIT TRANSACTION 
    END TRY
BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION MySavePoint; -- rollback to MySavePoint
        END
    END CATCH
END;
GO

-- testing 


  /************** NO.5 Table Publishers **************************************/
   INSERT INTO material.Publishers(PublisherID,PublisherName,City,Region,PostalCode,Phone)
   VALUES
 (21,'dfnsequat Consulting','Bfarrie','Ontario','P4M 5R5','(978) 533-5451')
 ;
 go
/************** NO.7 Table Item **************************************/
   INSERT INTO material.Items(ItemID,TitleID,PublisherID,Language,ISBN,Cover,Loanable) 
   VALUES
    (21,21,21,'Adfgzeri','274584667-9','http://dummyimage.com/205x203.bmp/ff4444/ffffff','false')
;
go
  /************** NO.5 Table Publishers **************************************/
   INSERT INTO material.Publishers(PublisherID,PublisherName,City,Region,PostalCode,Phone)
   VALUES
 (22,'xxsequat Consulting','Bfarrie','Ontario','P4M 5R5','(978) 533-5451')
 ;
 go


/************** NO.7 Table Item **************************************/
   INSERT INTO material.Items(ItemID,TitleID,PublisherID,Language,ISBN,Cover,Loanable) 
   VALUES
    (22,22,22,'xxgzeri','333584667-9','http://dummyimage.com/205x203.bmp/ff4444/ffffff','true')
;
go




-- try to insert whith correct data
execute employee.getReservationSP 21, 20
GO


-- try to insert whith the same itemID -- must be en error
execute employee.getReservationSP 21, 20
GO


-- try to insert whith the non loan Item -- must be en error
execute employee.getReservationSP 22, 20
GO


delete
from customer.Reservations
where ItemID = 21


select *
from customer.Reservations


select *
from material.Items