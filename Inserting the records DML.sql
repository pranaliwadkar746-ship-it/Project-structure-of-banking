show databases;
use dummy_db;

show tables;
describe employees;

insert into employees (emp_id,first_name,last_name,age,salary,city,contact)
values (1,'Rahul','Sharma',22,45000,'Mumbai',9849549559);

Alter table employees modify column contact varchar(20);

select *from employees;

insert into employees (emp_id,first_name,last_name,age,salary,city,contact)
values (2,'Rakesh','Patil',24,65000,'Pune',9562432895), 


SET SQL_SAFE_UPDATES = 0;  -- turn off safe mode

update employees
set city = "Bengaluru";

use bankingDB;
show tables;

describe customers;

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DataOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9849549559','2025-06-04', '2000-10-16'),
(102,'Priya','Patil','priya@gmail.com','9988776655','2025-05-03', '2000-09-20');

select *from customers;

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201, 101, 'Savings', 25000),(202, 102, 'Current', 40000);

UPDATE Customers
SET Phone = '9999999999'
WHERE CustomerID = 101;

delete from Customers
where CustomerID= 101;


