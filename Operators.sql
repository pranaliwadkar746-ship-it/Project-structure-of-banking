INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
VALUES
(101, 'Rahul', 'Sharma', 'rahul@gmail.com', '9999999999', '2025-05-01', '2001-04-15'),
(102, 'Priya', 'Patil', 'priya.patil@gmail.com', '9988776655', '2025-05-03', '2000-09-20'),
(103, 'Amit', 'Kulkarni', 'amit.k@gmail.com', '9876543210', '2025-05-05', '1999-12-11'),
(104, 'Sneha', 'More', 'sneha.more@gmail.com', '9898989899', '2025-05-07', '2002-02-14'),
(105, 'Rohan', 'Pawar', 'rohanp@gmail.com', '9765432109', '2025-05-08', '2001-11-05'),
(106, 'Sakshi', 'Mhatre', 'sakshi@yahoo.com', '9123456789', '2025-05-09', '2003-06-25'),
(107, 'Aniket', 'Sawant', 'aniket@gmail.com', '9012345678', '2025-05-10', '1998-08-19'),
(108, 'Meera', 'Patkar', 'meera@gmail.com', '9876501234', '2025-05-11', '2000-03-30');

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201, 101, 'Savings', 25000.00),
(202, 102, 'Current', 40000.00),
(203, 103, 'Salary', 30000.00),
(204, 104, 'Savings', 15000.00),
(205, 105, 'Current', 55000.00),
(206, 106, 'Salary', 22000.00),
(207, 107, 'Savings', 80000.00),
(208, 108, 'Current', 12000.00);

INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-05-01', 5000.00, 'Deposit'),
(302, 201, '2025-05-02', 2000.00, 'Withdrawal'),
(303, 202, '2025-05-03', 8000.00, 'Deposit'),
(304, 202, '2025-05-04', 3000.00, 'Transfer'),
(305, 201, '2025-05-05', 7000.00, 'Deposit'),
(306, 206, '2025-05-16', 4000.00, 'Payment'),
(307, 207, '2025-05-17', 30000.00, 'Deposit'),
(308, 208, '2025-05-18', 9000.00, 'Withdrawal'),
(309, 201, '2025-05-19', 6000.00, 'Deposit'),
(310, 202, '2025-05-20', 11000.00, 'Payment');

delete from transctions
where transctionID= 302;

select *from transactions;
select transactions
 
select *
from Accounts 
where AccountType = 'Savings';

SELECT *
FROM Accounts
WHERE Balance > 25000;

SELECT *
FROM Transactions
WHERE Amount BETWEEN 5000 AND 20000;

SELECT *
FROM Customers
WHERE FirstName LIKE 'R%';

SELECT *
FROM Customers
ORDER BY FirstName ASC;

SELECT *
FROM Accounts
ORDER BY Balance DESC;

SELECT DISTINCT AccountType
FROM Accounts;

SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 3;

SELECT *
FROM Transactions
LIMIT 5 OFFSET 2;

SELECT *
FROM Customers
WHERE Phone IS NULL;

SELECT *
FROM Customers
WHERE Email IS NOT NULL;