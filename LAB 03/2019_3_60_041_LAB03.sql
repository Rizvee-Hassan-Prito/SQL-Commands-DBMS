--ID: 2019-3-60-041
--Lab: 03

--Lab Task 1:
Select branch_name, branch_city
from branch
where assets>1000000; 

--Lab Task 2:
select account_number,balance
from account
where branch_name= 'Downtown' or ( balance between 600 and 750);

--Lab Task 3:
select account_number
from account natural join branch
where branch_city='Rye';

--Lab Task 4:
select Distinct L.loan_number
from loan L,account A,borrower B,customer C
where L.amount>=1000 and L.loan_number=B.loan_number and B.customer_name=C. Customer_name
and C.customer_city='Harrison';

--Lab Task 5:
select *
from account
order by balance desc, account_number desc;

--Lab Task 6:
select *
from Customer
order by customer_city, customer_name;

--Lab Task 7:
SELECT customer_name
FROM Account NATURAL JOIN Depositor
INTERSECT
SELECT customer_name
FROM Loan NATURAL JOIN Borrower;

--Lab Task 8:
SELECT customer_name, customer_street, customer_city
FROM Account NATURAL JOIN Depositor NATURAL JOIN Customer
UNION
SELECT customer_name, customer_street, customer_city
FROM Loan NATURAL JOIN Borrower  NATURAL JOIN Customer;

--Lab Task 9:
SELECT customer_name, customer_city
FROM Loan NATURAL JOIN Borrower  NATURAL JOIN Customer
MINUS
SELECT customer_name, customer_city
FROM Account NATURAL JOIN Depositor NATURAL JOIN Customer;

--Lab Task 10:
select sum(assets) as "Total Assets"
from Branch;

--Lab Task 11:
select branch_name, avg(balance) as "Average Balances"
from Account
Group By branch_name;

--Lab Task 12:
select branch_city, avg(balance) as "Average Balances"
from Account natural join Branch
Group By branch_city;

--Lab Task 13:
select Branch_name, MIN(amount) as "Lowest Amount"
from Loan
Group By branch_name;

--Lab Task 14:
select Branch_name, Count(Branch_name) as "Total Loans"
from Loan
Group By branch_name

--Lab Task 15:
select Customer_name, Account_number
from Account natural join Depositor
where Balance=(select MAX(Balance) from Account);