-- to create a database
-- syntax
create database database_name;

-- university database
create database university;  

-- to view all databases
show databases;

-- create a table
-- syntax
create table table_name(
	column1 datatype constraint,
    column2 datatype constraint,
    ...
);
-- to use a database 
-- syntax 
use database_name;
use university;

-- create a student table
create table students(
	stud_id int primary key,
    stud_name varchar(80) not null,
    stud_age int check (stud_age>=18),
    course varchar(80) default 'not mentioned',
    email varchar(100) unique
    );

-- to view a table
-- syntax
select * from table_name;

select * from students;

-- create a database for a company
-- create a table for storing employee data
-- include columns emp_id, emp_name,age, dept, salary
-- provide constraints accordingly

-- to insert values 
-- syntax
insert into table_name (column1, column2,...) values 
(value1, value2,...),
(value1, value2,...),
...;
or
insert into table_name values
(value1,value2,...),
(value1,value2,...),
...;

insert into students values
(1,'riya',20,'Python','riya@gmail.com'),
(2,'rahul',22,'AI','rahul@gmail.com'),
(3,'sam',22,'Python','sam@gmail.com'),
(4,'sethu',23,'AI','sethu@gmail.com');

select * from students;

insert into students values
(5,'sneha',20,'AI','sneha@gmail.com');

insert into students values
(6,'sneha',20,'AI','sn123@gmail.com');

insert into students values
(7,'sneha',15,'AI','sna34@gmail.com');

insert into students (stud_id,stud_name,stud_age,email) values
(7,'abc',20,'sa@gmail.com');

select * from students;

-- updating the course of stud_id 7 
-- syntax
update table_name 
set column_name = new_value
where condition;

update students
set course = 'Python'
where stud_id = 7; 

-- update name of the student (stud_id = 7)
-- update age of the student rahul to 24
-- update the course Python to Advanced Python

update students
set stud_name = 'rohan'
where stud_id=7;

select * from students;

update students
set stud_age = 24
where stud_name = 'rahul';

update students
set course = 'Advanced Python'
where course='Python';

set safe_sql_updates=0;

-- to update age and email of student with stud_id = 6
-- syntax
update table_name
set column1 = new_value, column2 = new_value,...
where condition;

update students
set stud_age = 22 , email = 'sneha123@gmail.com'
where stud_id= 6;

select * from students;

-- to update multiple rows
-- stud_id = 2 -> course = 'Data analyst'
-- stud_id = 3 -> course = ' Advance SQL'
-- case - end 
-- syntax
update table_name
set column_name = 
	case
		when condition1 then value1
        when condition2 then value2
        ....
	end
where condition;

-- stud_id = 2 -> course = 'Data analyst'
-- stud_id = 3 -> course = ' Advance SQL'

update students
set course = 
	case
		when stud_id = 2 then 'Data analyst'
        when stud_id = 3 then 'Advance SQL'
	end
where stud_id in (2,3);

select * from students;

-- update email ids of students with stud_id 5,6,7
-- update course = 'Advanced Data Science with Agentic AI' for stud_id (4,5,6)

update students
set course = 'Advanced Data Science with Agentic AI'
where stud_id in (4,5,6);  # use in operator for multiple rows

- to add a column
-- syntax
alter table table_name
add column column_name datatype constraint;

-- add a new column name contact_no
alter table students
add column contact_no int unique ;

-- multiple columns
-- syntax
alter table table_name
add column column1 datatype,
add column column2 datatype,
...;

-- add gender,city
alter table students
add column gender varchar(10),
add column city varchar(80); 

select * from students;

-- updating values 
update students
set city = 'Bangalore'; 

-- for gender and contact_no use case-end

-- add adm_no at the first
alter table students
add column adm_no int first;

select * from students;

-- add column fee after course
alter table students
add column fee int after course;

-- to change the column name
-- syntax 
alter table table_name
change old_name new_name datatype;

-- change fee to course_fee
alter table students
change fee course_fee int;

-- rename
-- syntax
alter table table_name
rename column old_name to new_name;

select * from students;
-- city to stud_city
alter table students
rename column city to stud_city;

-- modify
-- syntax
alter table table_name
modify column_name new_datatype;

-- modify course datatype varchar(200)
alter table students
modify course varchar(200);

-- modify stud_id int to smallint
alter table students
modify stud_id smallint;

-- add constraint 
-- syntax
alter table table_name
add constraint constraint_name
constraint;

-- add constraint check for course_fee 
-- course_fee >0
alter table students
add constraint chk_fee
check (course_fee>0);

-- unique 
alter table students
add constraint uq_contact
unique(contact_no);

-- primary key
alter table table_name
add constraint cons_name
primary key (column);

-- to delete a column 
-- syntax
alter table table_name
drop column_name,
drop column_name,
...;

-- delete adm_no, course_fee,gender,contact_no
select * from students;

alter table students
drop adm_no,
drop course_fee,
drop contact_no,
drop gender;

-- to delete a record
-- syntax
delete from table_name
where condition;

-- delete the student record with stud_id 7
delete from students
where stud_id = 7;

select * from students;

-- delete students from course Advance SQL
-- delete students with stud_id (4,5,6)

delete from students
where course='Advance SQL';

delete from students
where stud_id in (4,5,6);

-- remove all records from the table
-- truncate
-- syntax
truncate table table_name;

truncate table students;

select * from students;

-- rename table_name
-- syntax
rename table old_table_name to new_table_name;

rename table students to student_data;

select * from student_data;

-- to delete the table 
-- syntax
drop table table_name;

drop table student_data;

-- to delete database
-- syntax
drop database database_name;

drop database university;

-- adding not null and default constraint 
-- syntax
alter table table_name
modify column column_name datatype not null;

alter table table_name
modify column column_name datatype default default_value; 
-- modify the default value using same



create database orders_db;
use orders_db;

select * from orders;

-- find specific columns
-- syntax
select column1,column2,... from table_name;

-- find orderid,cname,category,pname,sales
select orderid,cname,category,pname,sales 
from orders;

-- find specfic columns using a condition
-- syntax
select column1,column2,.. from table_name
where condition;

-- find orders of Furniture category 
select * from orders
where category = 'Furniture';

-- find orders from South region
-- find orders where sales greater than 1000
-- find orders where we have loss
-- find orders except First class

select * from orders
where region = 'south';

select * from orders
where sales >1000;

select * from orders
where profit < 0 ;

select * from orders
where shipmode != 'first class';

-- find unique values in a column
-- syntax
select distinct column_name from table_name;

-- find different categories 
select distinct category from orders;

-- find different subcategories 
select distinct subcategory from orders;

select distinct city,region from orders;

-- find each orderid along with pname

-- find values with multiple conditions
-- logical : and, or, not
-- syntax (and)
select columns from table_name
where con1 and con2; -- both conditions should be True

-- find orders from central region where profit>1000
select * from orders
where region = 'central' and profit > 1000;

select count(*) from orders;

-- syntax(or)
select columns from table_name
where con1 or cond2;

-- find orders where category is Technology or subcategory is phones
select * from orders
where category = 'technology' or subcategory='phones';

-- find orders where sales >500 or profit >1000
-- find orders from consumer segment or shipmode standard class

-- not 
-- syntax 
select columns from tablename
where not condition;

-- find orders except from California
select * from orders
where not state = 'california';

-- find orders except from consumer segment and Second class
select * from orders
where not (segement = 'consumer' and shipmode = 'second class');

-- find orders from California and florida where quantity >= 3  
-- find orders except from furniture category where loss happened

select * from orders
where state in ('california','florida')
and quantity>=3;

select * from orders
where not (category='furniture') -- category!='furniture' (not equal to <> )
and profit <0;

-- to check any null values exist
-- is null : returns values where null values exist
-- is not null : returns values where null values not exist

-- syntax:
select columns from table_name
where column is null;

-- find orders where orderid is null
select * from orders
where orderid is null;
-- find orders where pid is not null
select * from orders
where pid is not null;

-- order by : sorts the result by asc/desc 
-- default -> asc
-- syntax
select columns from table_name
where condition
order by column asc/desc;

-- sort the order details from highest sales to lowest
select * from orders
order by sales desc;

-- sort orders from east region according to profit (low to high)
-- sort orders from consumer and corporate segement based on quantity(high to low)

select * from orders
where region='east'
order by profit;

select * from orders
where segement in ('consumer','corporate')
order by quantity desc;

-- limit : restricts the no of rows
-- syntax:
select columns from table_name
where condition
order by column asc/desc
limit n;  -- n is the no of rows

-- find top 5 orders based on highest sales 
-- find top 10 customers based on quantity

select * from orders
order by sales desc
limit 5;

select orderid,cname,quantity from orders
order by quantity desc
limit 10;

-- between 
-- syntax 
select columns from table_name
where column between value1 and value2;

-- find orders where profit is between 500 and 1000
select * from orders
where profit between 500 and 1000
order by profit desc;

-- find orders where shipdate between 31-05-2016 and 31-05-2017
select * from orders
where shipdate between '2016-05-31' and '2017-05-31';

-- pattern matching : like 
-- syntax
select columns from table_name
where column like pattern;

-- % -> one or more characters 
-- find orders where cid startswith 'SO'
select * from orders
where cid like 'so%';

-- find orders where cname starts with 'A'
-- find orders where pid endswith '760'
select * from orders
where pid like '%760';

-- _ (underscore)-> for exact no of characters
-- find orders where subcategory with exactly 6 characters
-- find orders where cid with 8 characters startswith 'HA'

select * from orders
where subcategory like '______'; -- 6 characters

select * from orders
where cid like 'HA______';

-- find orders where pname contains 'phone'
-- find orders where pid contains 'BI'
select * from orders
where pname like '%phone%';

select * from orders
where pid like '%bi%';

-- aggregate functions : sum(), avg(), max(),min(), count()
-- syntax 
select agg_func(column) from table_name;

-- find the total number of orders -> count()
select count(*) from orders;  -- counts all records

-- find the total number of customers 
select count(distinct cname) as Total_no_customers from orders;

-- aliases -> to give a suitable name for the result
-- as

-- find total sales , avg profit , highest quantity sold, lowest profit
select sum(sales) as Total_sales ,
	   avg(profit) as Avg_profit,
       max(quantity) as Highest_quantity,
       min(profit) as Lowest_profit
from orders;

-- find total sales for furniture category
-- find total profit in south and central region
-- find highest and lowest quantity sold except from consumer segment

 select sum(sales) as Total_sales
 from orders
 where category='furniture';
 
 select sum(profit) as total_profit
 from orders
 where region in ('south','central');
 
 select max(quantity) as Highest , min(quantity) as Lowest
 from orders
 where segement != 'consumer';
 
 -- group by 
 -- syntax
 select column, agg_func(column) 
 from table_name
 group by column;
 
 -- find category-wise total sales
 select category, sum(sales) as Total_sales 
 from orders
 group by category;
 
 -- find total profit in each segment
 select segement,sum(profit) as total_profit
 from orders
 group by segement;
 -- find highest quantity sold in each region
 
 -- find top 5 customers based on total sales
 select cname,sum(sales) as total_sales from orders
 group by cname
 order by total_sales desc
 limit 5;
 -- find top 10 cities based on total profit
 
 select column, agg_func(column) from table_name
 group by column
 order by column
 limit n;
 
 -- find subcategories where total_sales above 10000
 -- having : for filtering values from a grouped result 
 -- syntax 
 select column,agg_func(column)  from table_name
 group by column
 having condition;
 
 select subcategory,sum(sales) as total_sales from orders
 group by subcategory 
 having total_sales > 30000;
 
 -- find states where avg profit above 500
 select state, avg(profit) as avg_profit from orders
 group by state
 having avg_profit >100;
 -- find customers having more than 10 orders placed
 select cname, count(*) as total_orders from orders
 group by cname
 having total_orders>10;
 -- find shipmode where total_profit negative (loss)
 select shipmode, sum(profit) as total_profit from orders
 group by shipmode
 having total_profit <0;
 
 -- sub query or nested query
 -- syntax
 select columns from table_name 
 where condition (select columns from table_name
				  where condition);

-- find orders where sales > avg(sales)
select * from orders
where sales > (select avg(sales) from orders);

-- find orders where profit is having the highest profit value
-- find orders belonging to states that have total sales > 5000
 
select * from orders
where profit = (select max(profit) from orders);

select * from orders 
where state in (select state from orders
group by state
having sum(sales)>5000);

-- find orders belonging to subcategories where avg profit is negative
select * from orders
where subcategory in (select subcategory from orders
					  group by subcategory
                      having avg(profit)<0);
                      
select subcategory from orders
					  group by subcategory
                      having avg(profit)<0;

-- joins : to get combined result from multiple related tables
select distinct shipmode from orders;

create table ship_details 
	(shipmode varchar(80) primary key,
    cost int,
    delivery_days int);

insert into ship_details values 
('first class', 300, 3),
('second class', 200, 5),
('standard class',100,6),
('premium',500,2);

select * from ship_details;

-- find orderid,pname,sales,profit,shipmode,cost,delivery days
-- inner join : retrieves only matching records 
-- syntax 
select columns from table1
join table2
on table1.common_column = table2.common_column;

select o.orderid,o.pname,o.sales,o.profit,s.shipmode,
s.cost,s.delivery_days from orders o
join ship_details s
on o.shipmode=s.shipmode;

-- left join , right join , full outer join 

-- left join 
-- syntax 
select columns from table1
left join table2
on table1.common_column = table2.common_column;

select o.orderid,o.pname,o.shipmode,s.cost,s.delivery_days
from orders o
left join ship_details s
on o.shipmode = s.shipmode;

-- right join
select columns from table1
right join table2
on table1.common_column = table2.common_column;

-- find all shipping details along with matching orders
select o.orderid,o.pname,s.shipmode,s.cost,s.delivery_days
from orders o
right join ship_details s
on o.shipmode = s.shipmode;
-- where s.shipmode ='premium';

-- full outer join 
-- union
-- syntax
select columns from table1
left join table2
on table1.common_column = table2.common_column
union
select columns from table1
right join table2
on table1.common_column = table2.common_column;

select o.orderid,o.pname,o.shipmode,s.cost,s.delivery_days
from orders o
left join ship_details s
on o.shipmode = s.shipmode
union
select o.orderid,o.pname,s.shipmode,s.cost,s.delivery_days
from orders o
right join ship_details s
on o.shipmode = s.shipmode;

