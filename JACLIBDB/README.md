# JACLIBDB 
## Task 3
I.
Use the Library database created and modified in the previous tasks.
II.
Write scripts that join tables in the Library database
III.
Use the GROUP BY and HAVING clauses to summarize data by groups
IV.
Create Views
1. Create a mailing list of Library members that includes the members’ full names and
complete address information.
2. Write and execute a query on the title, item, and copy tables that returns the isbn,
copy_no, on_loan, title, translation, and cover, and values for rows in the copy table
with an ISBN of 1 (one), 500 (five hundred), or 1000 (thousand). Order the result by
isbn column.
3. Write and execute a query to retrieve the member’s full name and member_no from
the member table and the isbn and log_date values from the reservation table for
members 250, 341, 1675. Order the results by member_no. You should show
information for these members, even if they have no books or reserve.
4. Create a view and save it as adultwideView that queries the member and adult tables.
Lists the name & address for all adults.
5. Create a view and save it as ChildwideView that queries the member, adult, and
juvenile tables. Lists the name & address for the juveniles.
6. Create a view and save it as and CopywideView that queries the copy, title and item
tables. Lists complete information about each copy.
Certificate Program in Internet Programming & Development (A.E.C. LEA.BN)
Page 3 of 7Course Name: Database II
Course Number: 420-P34-AB
7. Create a view and save it as LoanableView that queries CopywideView (3-table join).
Lists complete information about each copy marked as loanable (loanable = 'Y').
8. Create a view and save it as OnshelfView that queries CopywideView (3-table join).
Lists complete information about each copy that is not currently on loan (on_loan ='N').
9. Create a view and save it as OnloanView that queries the loan, title, and member
tables. Lists the member, title, and loan information of a copy that is currently on loan.
10. Create a view and save it as OverdueView that queries OnloanView (3-table join.)
Lists the member, title, and loan information of a copy on loan that is overdue (due_date
< current date).

## Task 4 
Create Stored Procedures and Triggers: Generating Usage Reports – seven questions are listed at the end of this document to
generate summary information for librarians.

1. How many loans did the library do last year?
2. What percentage of the membership borrowed at least one book?
3. What was the greatest number of books borrowed by any one individual?
4. What percentage of the books was loaned out at least once last year?
5. What percentage of all loans eventually becomes overdue?
6. What is the average length of a loan?
7. What are the library peak hours for loans?

## Required before submission

1. Insert Data into Tables
2. Manipulate data
3. Advanced Join
4. Create Clustered and Non-Clustered Indexes
5. Create sub-queries
6. Implement views
7. Create user-defined functions
8. Create stored procedures
9. Create triggers
10. Manage transactions
