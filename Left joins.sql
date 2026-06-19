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
