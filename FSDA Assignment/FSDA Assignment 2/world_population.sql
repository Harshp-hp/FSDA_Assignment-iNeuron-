create schema world_populations;
use world_populations;

create table if not exists populations(
	Country varchar(60),
    area int,
    birth_rate decimal(12,2),
    death_rate decimal(12,2),
    infant_mortality_rate decimal(12,2),
    internet_users int,
    life_exp_at_birth decimal(12,2),
    maternal_mortality_rate int,
    net_migration_rate decimal(12,2),
    population int,
    population_growth_rate decimal(12,2)
);

-- load the dataset 
load data infile 'G:\cia_factbook.csv'
into table populations
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

-- view the datasets 
select * from populations;


-- Task 1
-- Country has the highest population?
select country, sum(population) as Population
from populations 
group by country 
order by 2 desc;

-- "China" country has the highest popuation.  

-- Task 2
-- country has the least number of people?
select country, sum(population) 
from populations
group by country
order by 2 ASC;

-- "Pitcairn Islands" has the least nubmer of people.

-- Task 3
-- country is witnessing the highest population growth?
select country, sum(population_growth_rate) 
from populations 
group by country
order by 2 desc;

-- "Lebanon" country has the highest population growth rate.alter

-- Task 4
-- country has an extraordinary number for the population?
select country, avg(population)
from populations 
group by country
order by 2 desc limit 5;

-- Task 5
-- Most densely populated country in the world?
select country, (population/area) as density
from populations
order by density desc limit 10; 
