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

