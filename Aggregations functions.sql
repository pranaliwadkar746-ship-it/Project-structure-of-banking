show databases;
use bankingdb;

show tables;
select *from accounts;

select sum(balance) as total_balance from accounts;

select *from accounts;

-- Average Balance
select avg(balance) as total_balance from accounts;

select *from accounts;

-- Maximum Balance
select Max(balance) as Highest_balance from accounts;

-- Minimum balance
select min(balance) as Min_Balance from accounts;

-- Count 
select *from accounts;
select count(*) as total_accounts from accounts;

-- Group By
select accountType, sum(balance) as total_balance from accounts 
group by accountType;

select accountType, sum(balance) as total_balance from accounts 
group by accountType order by total_balance asc;

select accountType, sum(balance) as total_balance from accounts 
group by accountType order by accountType asc;

select *from transactions;
Select TransactionType, sum(Amount) as total_transaction from transactions
group by TransactionType;

Select TransactionType, sum(Amount) as total_amount from transactions
group by TransactionType;

select *from accounts;
select accountType, sum(balance) as totalbalance from accounts 
group by accountType having sum(balance) > 25000;

select *from transactions;
Select TransactionType, sum(Amount) as total_amount from transactions
where TransactionType = 'withdrawal';

Select TransactionType, sum(Amount) as total_amount from transactions
having TransactionType = 'withdrawal';

select *from accounts;
select accountType, sum(balance) as total_balance from accounts 
Group by accountType having accountType in ('savings','current');

select accountType, sum(balance) as total_balance from accounts 
Group by accountType having accountType = "savings" or accountType = "current";

select accountType, sum(balance) as total_balance from accounts 
Group by accountType limit 2;