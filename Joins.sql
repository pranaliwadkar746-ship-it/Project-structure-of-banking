use bankingdb;

show tables;
select *from customers;
select *from transactions;
-- customer :- id, first name, transaction_id, type, amount

select c.CustomerID,C.FirstName,t.TransactionID,t.TransactionType,t.Amount
from customers as c inner join transactions as t
on c.CustomerID=t.CustomerID

use bankingdb;
select *from transactions;
select *from customers;

-- Add column CustomerID into transactions
alter table transactions add column CustomerID int;

-- customers == transactions with foreign key

alter table transactions 
add foreign key (CustomerID) references customers(CustomerID);

update transactions set CustomerID=101
where TransactionID in (301,302,305,309);

update transactions set CustomerID=102
where TransactionID in (303,304,310);

update transactions set CustomerID=106
where TransactionID = 306;

update transactions set CustomerID=107
where TransactionID = 307;

update transactions set CustomerID=108
where TransactionID = 308;

select c.CustomerID,C.FirstName,t.TransactionID,t.TransactionType,t.Amount
from customers as c inner join transactions as t
on c.CustomerID=t.CustomerID

select c.CustomerID,C.FirstName,t.TransactionID,t.TransactionType,t.Amount
from customers as c inner join transactions as t
on c.CustomerID=t.CustomerID
where TransactionType = 'Withdrawal' or TransactionType = 'Deposit';

use bankingdb;

select *from transactions;
select *from customers;

-- inner join (equi join)
select c.CustomerID,C.FirstName,t.TransactionID,t.TransactionType,t.Amount
from customers as c inner join transactions as t
on c.CustomerID=t.CustomerID;

-- outer join (Left join)
select c.CustomerID,
concat(c.FirstName, ' ', c.LastName) as CustomerName, 
t.TransactionID,t.TRansactionType,t.Amount 
from Customers c
Left Join transactions t
on c.CustomerID = t.CustomerID

-- outer join (Right join)
select c.CustomerID,
concat(c.FirstName, ' ', c.LastName) as CustomerName, 
t.TransactionID,t.TRansactionType,t.Amount 
from Customers c
Right Join transactions t
on c.CustomerID = t.CustomerID

-- update 310 Transaction_ID with CustomerID=null so it will be displayed in right join.
update transactions set CustomerID=null where TransactionID=310;

select c.CustomerID,
concat(c.FirstName, ' ', c.LastName) as CustomerName, 
t.TransactionID,t.TRansactionType,t.TransactionDate,t.Amount 
from Customers c
inner Join transactions t
on c.CustomerID = t.CustomerID
where TransactionType='Deposit' and t.Amount>5000
order by t.amount asc;
