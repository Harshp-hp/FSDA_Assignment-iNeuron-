create database fsda1;
use fsda1;

-- Table structure of shopping_history
create table shopping_history(
	product varchar(20) not null,
    quantity int not null,
    unit_price int not null
    );
    
 -- Dumping data into shopping history
 
 insert into shopping_history values ('milk',3,10),
 ('bread',7,3),
 ('bread',5,2);
 
 -- Task 1.
 -- Write an SQL query that, for each  "product", returns the total amount of money spent on it.
 -- Rows should be ordered in descending alphabetical order by "Product".
 
 select product, sum(quantity * unit_price) as 'TotalPrice'
 from shopping_history
 group by product
 order by 2 desc;
    
-- Table structure of phones     
create table phones(
	name varchar(20) not null unique,
    phone_number int not null unique);
 
-- Table structure of calls 
create table calls(
		id int not null,
        caller int not null,
        callee int not null,
        duration int not null,
        unique(id));
        
-- Dumping data into phones & calls

insert into phones values
('Jack', 1234),
('Lena', 3333),
('Mark', 9999),
('Anna', 7582); 

insert into calls values
(25, 1234, 7582,8),
(7,9999,7582,1),
(18,9999,3333,4),
(2,7582,3333,3),
(3,3333,1234,1),
(21,3333,1234,1);   

select * from phones;   
select * from calls; 

-- Task 2 
--  Write an sql query that finds all clients who talked for at least 10 minutes in total. 
-- The table of results should contain one column: the name of the client(name).
-- Rows should be sorted alphabetically.

select name
from phones 
join calls on phones.phone_number = calls.callee
union
select name
from phones 
join calls on phones.phone_number = calls.callee
group by  name
having sum(duration) >= 10
order by name;

-- Table Structure transactions 

create table transactions (
	amount int not null,
    date date not null
    );

-- Dumping data into transactions 

insert into transactions values 
	(1000, '2020-01-06'),
    (-10,'2020-01-14'),
    (-75,'2020-01-20'),
    (-5, '2020-01-25'),
    (-4,'2020-01-29'),
    (2000, '2020-03-10'),
    (-75, '2020-03-12'),
    (-20,'2020-03-15'),
    (40,'2020-03-15'),
    (-50,'2020-03-17'),
    (200, '2020-10-10'),
    (-200, '2020-10-10');
    
 select * from transactions; 
 
 -- Task 3
 -- Write an SQL query that returns a table containing one column balance.
 -- The table should, contain one row with the total balance of your account at the end of the year, including the fee for holding a credit card.
 
		  

select sum(d_amount) + sum(c_amount) + sum(fee)
from (
		select amount, month(date) as months,
				sum(case when amount > 0 then amount else 0 end) d_amount,
				sum(case when amount < 0 then amount else 0 end) c_amount,
				sum(case when amount < 0 then 1 else 0 end) c_tr,
				sum(case when amount < 0 then 1 else 0 end) < 3 then -5 else 0 end fee
		from transactions 
        );
        
        
    
    
    
  