/* Purpose: triggers.
Script Date: April 5th ,2019
Developped by Matthew, Sergei, Levar, Tony
 */
/* TRIGGER WHEN NEW LOAN ADDED */

use JAClib
;
go

CREATE TRIGGER trLoanReturned
ON employee.Loans
AFTER UPDATE
AS
	begin
		DECLARE @CopyID as int,
				@ISBN as varchar(13),
				@ReturnedDate as datetime

		SELECT	@CopyID = CopyID,
				@ISBN = ItemID,
				@ReturnedDate = ReturnedDate
		FROM Inserted
		if(@ReturnedDate is not null)
			begin
				UPDATE Item.Copy
SET Copy.isLoaned = 0
WHERE Copy.CopyNo = @CopyID AND Copy.ISBN = @ISBN
end
	end
;
go

/* TRIGGER FOR CREATE LOAN SETS COPY LOANED TO 1 */
CREATE TRIGGER LoanCreatedTR
ON employee.Loans
AFTER INSERT
AS
	begin
DECLARE @CopyID as int,
				@ItemID as varchar(13),
				@ReturnedDate as datetime

		SELECT	@CopyID = CopyID,
				@ItemID = ItemID,
				@ReturnedDate = ReturnedDate
		FROM Inserted
if(@ReturnedDate is null)
		begin
			UPDATE Item.Copy
SET Copy.isLoaned = 1
WHERE Copy.CopyNo = @CopyID AND Copy.ISBN = @ItemID
end
	end
;
go
