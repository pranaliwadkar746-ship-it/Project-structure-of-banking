show databases;
use bankingdb;

select *
from Accounts 
where AccountType In ('Savings', 'Current');

SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 5;

SELECT *
FROM Accounts
where AccountType ='Savings'
ORDER BY balance DESC
LIMIT 3;

-- custoners whose name starts with A
select *from customers where firstName like 'A%';

select *from customers where lastname like '%kar';

select *from customers where Email like '%gmail%';

select 
*from Transactions 
Order by TransactionDate Desc;

-- string functions
select FirstName,LastName,concat(FirstName," ",LastName) as FullName
from customers;

describe customers;

select concat(FirstName," ",LastName) as FullName
from customers;

-- 2.upper & Lower
select upper(FirstName) as FirstName from customers;
select lower(LastName) as FirstName from customers;

-- 3.Substrings
select FirstName, substring(FirstName,1,3) from customers;

select FirstName, substring(FirstName,2,3) from customers;

-- 4.replace
select replace('hello world', 'world','SQL') as replaced_strings;