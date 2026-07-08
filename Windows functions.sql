-- create database IPL
create database IPL;

-- use database
use IPL;

-- create table and records
CREATE TABLE IPL_Batting (
    match_no  INT,
    player    VARCHAR(50),
    team      VARCHAR(30),
    runs      INT
);

INSERT INTO IPL_Batting VALUES
(1, 'Rohit Sharma',  'Mumbai Indians',    45),
(2, 'Rohit Sharma',  'Mumbai Indians',    12),
(3, 'Rohit Sharma',  'Mumbai Indians',    78),
(1, 'Ishan Kishan',  'Mumbai Indians',    30),
(2, 'Ishan Kishan',  'Mumbai Indians',    55),
(3, 'Ishan Kishan',  'Mumbai Indians',    20),
(1, 'Virat Kohli',   'Royal Challengers', 62),
(2, 'Virat Kohli',   'Royal Challengers', 40),
(3, 'Virat Kohli',   'Royal Challengers', 101),
(1, 'Faf du Plessis','Royal Challengers', 25),
(2, 'Faf du Plessis','Royal Challengers', 33),
(3, 'Faf du Plessis','Royal Challengers', 18);


select * from IPL_Batting;

-- Group by : Rows collapse ho jati hain
Select team, SUM(runs) AS total_runs
From IPL_Batting
Group by team;

-- window function: har row visible rehti hai, extra colum add hota hai
select match_no, player, team, runs,
       SUM(runs) over (partition by team) AS team_total_runs
From IPL_Batting;

-------------------Ranking Functions: Row_number(), Rank(), Dense_Rank()
select player, team, runs,
row_number() over (order by runs DESC) AS row_num
from IPL_Batting;

select match_no, player, team, runs,
row_number() over (order by runs DESC) AS row_num
from IPL_Batting
where match_no = 3;





