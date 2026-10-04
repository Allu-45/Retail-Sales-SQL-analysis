create database project;

use project;            
 
 show tables;
 describe sample;
 
select * from sample;

select distinct shipmode
from sample;

select count(*) from sample;
                 
select * from sample
where shipmode ='first class' and region ='east';

select distinct category,subcategory
from sample;

select * from sample
where region = 'south';

select * from sample
where category ='technology' and profit > 200;

select * from sample
where region ='west' or region ='south';

select max(sales) as second_max
 from sample
 where sales < (select max(sales)
                 from sample);
                 
select shipmode,state,pincode,quantity,region
from sample
where region ='central';


select * from sample
where profit < 25 and region ='west';

select * from sample
where shipmode ='second class' and pincode = 38109;

select shipmode ,country, city, pincode,region,sales,profit
from sample
where sales > 6000 and profit > 3000;

select * from sample 
where profit between 5000 and 8000 and sales >11000;

select shipmode,segment,city,state,pincode,region,category,sales,discount
from sample
where category in ('technology') and profit < 1000;

select * from sample
where region = 'central' and quantity = 5 or profit > 5000;

select * from sample
where sales not between 50 and 6000 and discount is not null;

SELECT shipmode, state, pincode, sales,quantity
from sample
where state like 's%' and quantity not in (3,4,5);

select sum(sales) as total_sales, category
from sample
group by category;

select avg(profit) as avg_profit, region
from sample
group by region;

select sum(quantity) as total_quantity,segment
from sample
where region = 'east'
group by segment;

select sum(sales) as total_sales, sum(profit) as total_profit, state
from sample
where quantity between 3 and  4
group by state;

select sum(sales) as total_sales, category
from sample
where category != 'technology' 
group by category
having sum(sales) > 100000;

select avg(discount) as avg_discount,subcategory
from sample
where city like '%a'
group by subcategory
having avg(discount) > 0.20;

select count(*) as total_records,region
from sample
where shipmode = 'standard class'
group by region
having count(*) > 1000;

select * from sample
where sales=(select max(sales)
              from sample);
              

select sum(profit) as total_profit, state
 from sample
 group by state
 order by total_profit desc
 limit 5 offset 1;

select sum(sales) as total_sales,subcategory
from sample
group by subcategory
order by total_sales desc
limit 1 offset 1;

select *
from sample
where sales > (select avg(sales)
               from sample);
			
select * from sample
where profit < (select avg(profit)
                from sample);
            
select * from sample
order by sales desc
limit 10;

select * from sample
order by profit asc
limit 10;

select * from sample
order by sales desc;

select * from sample
order by discount desc
limit 10;

select count(*),state
from sample
group by state
limit 49;  

CREATE TABLE Statesd (
    S_ID INT,
    State VARCHAR(50),
    S_Mgr VARCHAR(50),
    Sales_Trgt DECIMAL(12,2)
);


INSERT INTO Statesd
(S_ID, State, S_Mgr, Sales_Trgt)
VALUES
(139, 'Kentucky', 'James Smith', 50000),
(2001, 'California', 'Robert Brown', 150000),
(383, 'Florida', 'Michael Davis', 100000),
(249, 'North Carolina', 'William Wilson', 75000),
(506, 'Washington', 'David Miller', 90000),
(985, 'Texas', 'John Anderson', 140000),
(110, 'Wisconsin', 'Daniel Moore', 60000),
(53, 'Utah', 'Mark Taylor', 55000),
(38, 'Nebraska', 'Kevin Martin', 45000),
(587, 'Pennsylvania', 'Brian Clark', 110000);

select * from sample;
select * from statesd;

select *
from sample cross join statesd;

select sum(s.profit),s.state
from sample s inner join statesd d
on s.state = d.state
group by s.state;

select sum(s.sales),d.state
from sample s inner join statesd d
on s.state = d.state
group by d.state; 


select *
from sample s inner join statesd d 
on s.state = d.state;

select s.state,d.s_mgr,s.sales,s.profit
from sample s inner join statesd d
on s.state = d.state;

select s.state,sum(s.sales),d.sales_trgt
from sample s inner join statesd d
on s.state = d.state
group by s.state, d.sales_trgt
having sum(s.sales) > d.sales_trgt;

select s.state,sum(s.sales) as total_sales
from sample s inner join statesd d
on s.state = d.state
group by s.state
order by total_sales desc
limit 1;

select s.shipmode,d.sales_trgt,s.state
from sample s left join statesd d
on s.state = d.state;

select s.state,d.s_mgr
from sample s left join statesd d
on s.state = d.state;

select distinct s.state,d.state
from sample s left join statesd d
on s.state = d. state
where d.state is null;

select d.state,s.sales
from statesd d right join sample s
on s.state = d.state;

select distinct d.state,s.state 
from statesd d right join sample s
on s.state = d.state;