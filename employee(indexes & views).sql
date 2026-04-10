-- Active: 1775669452257@@127.0.0.1@3306@cscorner
-------table employee----
create table employee
(emp_id int primary key,
emp_name varchar(50),
department varchar(50),
salary int);

-----values of table employees-----
insert into employee values
(1,'amit','hr',30000);
insert into employee values
(2,'ravi','it',50000);
insert into employee values
(3,'sita','hr',35000);
insert into employee values
(4,'kiran','it',60000);
insert into employee values
(5,'neha','finance',40000);
insert into employee values
(6,'arjun','it',55000);


----------create index------
create index idx_emp_salary
on employee(salary);


--------query using index-------
select * from employee where salary >40000;


-------create view it employee----
create view it_employee as
select emp_name ,salary
from employee
where department='it'


--------query the view------
select * from it_employee;


----------another view as high salary-----
create view high_salary as
select emp_name,department,salary
from employee
where salary>45000;


--------query the second view------
select * from high_salary;


------drop index------
drop index idx_emp_salary;

------drop view it employee------
drop view it_employee;

-------drop view high salary-----
drop view high_salary;
