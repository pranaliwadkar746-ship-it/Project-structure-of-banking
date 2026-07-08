use bankingDB;

show databases;

select *from customers;
select *from transactions;

select c.CustomerID,c.firstName,c.Email,t.TransactionID,t.TransactionDate,t.Amount from customers c cross join transactions t;
-- Task 1
select *from transactions
where Amount > (select AVG(Amount) from Transactions);

-- Task 2
select AccountID, AccountType, Balance, customerID
from Accounts
where balance > (select AVG(balance) from Accounts)
order by Balance DESC;

-- Task 3
SELECT AccountID, AccountType, Balance, CustomerID
FROM Accounts
WHERE AccountID IN(SELECT AccountID FROM Transactions
WHERE TransactionType = 'Deposit'
);

-- Task 4
Select AccountID, AccountType, Balance, CustomerID
FROM Accounts
where balance = (select max(Balance) from Accounts);