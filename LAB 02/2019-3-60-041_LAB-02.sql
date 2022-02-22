--ID: 2019-3-60-041
--Lab: 02

--Lab Task 01(i):
CREATE TABLE account(
	account_no CHAR(5),
	balance NUMBER NOT NULL,
	constraint accountNo_PK primary key(account_no),
	constraint account_baln CHECK(balance>=0) 
);

--Lab Task 01(ii):
CREATE TABLE customer(
	customer_no CHAR(5),
	customer_name VARCHAR2(20) NOT NULL,
	customer_city VARCHAR2(10),
	constraint customerNo_PK primary key(customer_no) 
);

--Lab Task 01(iii):
CREATE TABLE depositor(
	account_no CHAR(5),
	customer_no CHAR(5),
	constraint deposit_PK primary key(account_no,customer_no)
);

--Lab Task 02(i):
 
ALTER TABLE customer ADD date_of_birth DATE;

--Lab Task 02(ii):
 
ALTER TABLE customer DROP COLUMN date_of_birth;

--Lab Task 02(iii):

ALTER TABLE depositor RENAME COLUMN account_no TO a_no;
ALTER TABLE depositor RENAME COLUMN customer_no TO c_no;

--Lab Task 02(iv):
ALTER TABLE depositor ADD CONSTRAINT depositor_fk1 FOREIGN KEY(a_no) REFERENCES account;
ALTER TABLE depositor ADD CONSTRAINT depositor_fk2 FOREIGN KEY(c_no) REFERENCES customer;

--Lab Task 03:

INSERT INTO account VALUES('A-101',12000);
INSERT INTO account VALUES('A-102',6000);
INSERT INTO account VALUES('A-103',2500);

INSERT INTO customer VALUES('C-101','Alice','Dhaka');
INSERT INTO customer VALUES('C-102','Annie','Dhaka');
INSERT INTO customer VALUES('C-103','Bob','Chittagong');
INSERT INTO customer VALUES('C-104','Charlie','Khulna');

INSERT INTO depositor VALUES('A-101','C-101');
INSERT INTO depositor VALUES('A-103','C-102');
INSERT INTO depositor VALUES('A-103','C-104');
INSERT INTO depositor VALUES('A-102','C-103');

--Lab Task 4(i):
SELECT customer_name,customer_city
from customer;

--Lab Task 4(ii):
SELECT DISTINCT customer_city 
from customer;

--Lab Task 4(iii):
SELECT account_no
FROM account
WHERE balance>7000;

--Lab Task 4(iv):
SELECT customer_no,customer_name
FROM customer
WHERE customer_city='Khulna';

--Lab Task 4(v):
SELECT customer_no,customer_name
FROM customer
WHERE customer_city != 'Dhaka';

--Lab Task 4(vi):
SELECT customer_name, customer_city
FROM  customer C, account A, depositor D 
WHERE C.customer_no=D.c_no and D.a_no=A.account_no and balance>7000;

--Lab Task 4(vii):
SELECT customer_name, customer_city
FROM  customer C, account A, depositor D
WHERE C.customer_no=D.c_no and D.a_no=A.account_no and balance>7000 and C.customer_city!='Khulna';

--Lab Task 4(viii):
SELECT account_no,balance
FROM account A, depositor D
WHERE D.c_no='C-102' and D.a_no=A.account_no;

--Lab Task 4(ix):
SELECT DISTINCT account_no, balance
FROM  account A, customer C, depositor D
WHERE C.customer_no=D.c_no and D.a_no=A.account_no and (customer_city='Dhaka' or customer_city='Khulna');

--Lab Task 4(x):
SELECT customer_name
FROM  customer C, account A, depositor D
WHERE C.customer_no=D.c_no and D.a_no=NULL;