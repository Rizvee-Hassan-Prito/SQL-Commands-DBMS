--ID: 2019-3-60-041
--Lab: 05

--Lab Task 1:
--Without subqueries
select Customer_name, customer_street, customer_city
from customer natural join depositor natural join account natural join Branch
where customer_city=branch_city;

--With subqueries
select Customer_name, customer_street, customer_city
from customer natural join depositor natural join account natural join Branch
where account_number IN (select account_number
from customer natural join depositor natural join account natural join Branch
where branch_city=customer_city);

--Lab Task 2:
--Without subqueries
select Customer_name, customer_street, customer_city
from customer natural join borrower natural join Loan natural join Branch
where customer_city=branch_city;

--With subqueries
select Customer_name, customer_street, customer_city
from customer natural join borrower natural join loan natural join Branch
where loan_number IN (select loan_number
from customer natural join borrower natural join loan natural join Branch
where branch_city=customer_city);

--Lab Task 3:
--Without 'Having' clause
select branch_city, Avg_balance
from (select branch.branch_city, sum(balance) as tot_balance, avg(balance) as Avg_balance
from account natural join branch
group by branch.branch_city) temp
where  tot_balance>= 1000;

--With 'Having' clause
select branch_city, avg(balance) as Avg_balance
from account natural join branch
group by branch.branch_city
Having sum(balance)>= 1000;

--Lab Task 4:
--Without 'Having' clause
select branch_city, Avg_amount
from (select branch.branch_city, avg(amount) as Avg_amount
from Loan natural join branch
group by branch.branch_city) temp
where  Avg_amount>= 1500;

--With 'Having' clause
select branch_city, avg(Amount) as Avg_amount
from Loan natural join branch
group by branch.branch_city
Having avg(Amount)>= 1500;

--Lab Task 5:
--Without 'All' keyword
select customer_name, customer_street, customer_city
from customer natural join depositor natural join account
where balance= (select MAX(BALANCE) from account);

--With 'All' keyword
select customer_name, customer_street, customer_city
from customer natural join depositor natural join account
where balance>=All ( select balance
from customer natural join depositor natural join account);

--Lab Task 6:
--Without 'All' keyword
select customer_name, customer_street, customer_city
from customer natural join borrower natural join Loan
where amount= (select MIN(Amount) from Loan);

--With 'All' keyword
select customer_name, customer_street, customer_city
from customer natural join borrower natural join Loan
where amount<=All ( select amount
from customer natural join borrower natural join Loan);

--Lab Task 7:
--With 'IN' keyword
select distinct branch_name, branch_city
from account natural join branch
where branch_name IN(select branch_name
from loan natural join branch);

--With 'Exists' keyword
select distinct b.branch_name, b.branch_city
from account a, branch b
where a.branch_name=b.branch_name and Exists(select distinct b.branch_name, b.branch_city
from loan l , branch b
where l.branch_name=b.branch_name and a.branch_name=l.branch_name);

--Lab Task 8:
--With ' NOT IN' keyword
select distinct branch_name, branch_city
from account natural join branch
where branch_name NOT IN(select branch_name
from loan natural join branch);

--With 'Not Exists' keyword
select distinct b.branch_name, b.branch_city
from account a, branch b
where a.branch_name=b.branch_name and Not Exists(select distinct b.branch_name, b.branch_city
from loan l , branch b
where l.branch_name=b.branch_name and a.branch_name=l.branch_name);

--Lab Task 9:
--Without 'With' clause
select branch_name
from (select branch_name, sum(balance) as Tot_Balance from account group by branch_name) t
where Tot_balance>(select avg(Tot_balance) as Avg_Tot_Balance from (select branch_name, sum(balance) as Tot_Balance from account group by branch_name));

--With 'With' clause
With tot_balance(branch_name,tot_b) as (select branch_name, sum(balance)
from Account
group by branch_name),
Avg_Tot_Balance(Avg_tot_b) as (select avg(tot_b)
from tot_balance)
select branch_name
from tot_balance, Avg_Tot_Balance
WHERE tot_balance.tot_b > Avg_Tot_Balance.Avg_tot_b;

--Lab Task 10:
--Without 'With' clause
select branch_name
from (select branch_name, sum(amount) as Tot_Amount from Loan group by branch_name) 
where Tot_Amount<(select avg(Tot_Amount) as Avg_Tot_Amount from (select branch_name, sum(Amount) as Tot_Amount
from Loan 
group by branch_name));

--With 'With' clause
With tot_amount(branch_name,tot_amt) as (select branch_name, sum(amount)
from Loan
group by branch_name),
Avg_Tot_Amount(Avg_tot_amt) as (select avg(tot_amt)
from tot_amount)
select branch_name
from tot_amount, Avg_Tot_amount
WHERE tot_amount.tot_amt < Avg_Tot_amount.Avg_tot_amt;