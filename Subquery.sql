use bankingDB;

show databases;

select *from customers;
select *from transactions;

select c.CustomerID,c.firstName,c.Email,t.TransactionID,t.TransactionDate,t.Amount from customers c cross join transactions t;

select *from transactions
where Amount > (select AVG(Amount) from Transactions);

select AccountID, AccountType, Balance, customerID
from Accounts
where balance > (select AVG(balance) from Accounts)
order by Balance DESC;

SELECT AccountID, AccountType, Balance, CustomerID
FROM Accounts
WHERE AccountID IN(SELECT AccountID FROM Transactions
WHERE TransactionType = 'Deposit'
);

Select AccountID, AccountType, Balance, CustomerID
FROM Accounts
where balance = (select max(Balance) from Accounts);