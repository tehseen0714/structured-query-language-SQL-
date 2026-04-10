-- Active: 1775669452257@@127.0.0.1@3306@cscorner
------table employees-----
create table employees
(emp_id int primary key,
emp_name varchar(50),
department varchar(50),
salary int);

-----values of table employees-----
insert into employees values
(1,'amit','hr',30000);
insert into employees values
(2,'ravi','it',50000);
insert into employees values
(3,'sita','hr',35000);
insert into employees values
(4,'kiran','it',60000);
insert into employees values
(5,'neha','finance',40000);
insert into employees values
(6,'arjun','it',55000);


-----row number(ranking)-----
select emp_name ,department,salary,row_number()
over (order by salary desc) as row_num
from employees;


--------- rank within department------
select emp_name,
department,salary,rank() over (partition by department order by 
salary desc ) as dept_rank from employees;


---------department average salary-------
select emp_name, department , salary, avg (salary) over(partition 
by department) as dept_avg
from employees;


------running total------
select 
emp_name,
salary,sum(salary) over (order by emp_id) as running_total
from employees;


--------previous salary------
select emp_name,
salary,
lag(salary) over (order by emp_id) as previous_salary
from employees;