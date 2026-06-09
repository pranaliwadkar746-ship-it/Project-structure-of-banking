create database dummy_db; -- creating dummy database

show databases; -- showing databases in server

use dummy_db;

CREATE TABLE employees(
emp_id      INT             Primary Key Auto_Increment,
First_name  VARCHAR(50)     Not Null,
last_name   VARCHAR(50)     Not Null,
age         INT             Check (age >=18),
salary      Decimal(10,2)   Not Null,
city        VARCHAR(50)     default 'Mumbai'
);


 describe employees; -- to describe the table structure

-- Renaming the table
Alter table employees rename to staff;
Alter table staff rename to employees;

-- Add column
Alter table employees add column phone int;
Alter table employees add column Email_Id VARCHAR(50);

-- Change column phone to contact
Alter table employees
change phone contact int not null;

-- modify column Email_Id to add constraints
Alter table employees
modify Email_Id varchar(60) unique;

-- Drop column contact
Alter table employees drop column Email_Id;

-- Add column
Alter table employees add column Email_Id Varchar(40);

show databases;

use bankingdb;

describe customers; -- to describe the table structure

-- Add table customers
Alter table customers
Add DataOfBirth Date;
`
Alter table customers
modify phone Varchar(20);

-- Add column
Alter table customers add column balance decimal(10,2);

Alter table Accounts
Add constraint chk_Minbalance
check (balance >=1000);