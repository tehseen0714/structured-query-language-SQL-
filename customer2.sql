-- Active: 1775669452257@@127.0.0.1@3306@cscorner

-------table customer-----
create table customers
(customers_id int primary key,
name varchar (50),
city varchar(50));


--------table orders-------
create table orderss
(orders_id int primary key,
customers_id int,
amount decimal (10,2),
order_date date,
foreign key (customers_id) references customers( customers_id)
);


--------values of customer------
insert into customers values
(1,'alice','mumbai');
insert into customers values
(2,'bob','delhi');
insert into customers values
(3,'carol','pune');


-------values of order-------
insert into orderss values
(1,1,2000,'2025-06-01');
insert into orderss values
(2,1,500,'2025-06-10');
insert into orderss values
(3,2,300,'2025-06-15');
insert into orderss values
(4,3,2500,'2025-06-17');


-------display table customers and orderss-----
select * from customers;
select * from orderss;


----customer spent atleast 2000 and order places after 1st june 2025--------
select c.name,c.city,sum (o.amount)
as total_spent
from customers c
join orderss o on c.customers_id=o.orders_id
where o.order_date>='2025-06-01'
group by c.customers_id,c.name,c.city
having sum (o.amount)>=2000;


------------total amount-------
select c.name,c.city,sum (o.amount)
as total_spent
from customers c
join orderss o on c.customers_id=o.orders_id
where o.order_date>='2025-06-01'
group by c.customers_id,c.name,c.city;


------------sort total amount in descending order-------
select c.name,c.city,sum (o.amount)
as total_spent
from customers c
join orderss o on c.customers_id=o.orders_id
where o.order_date>='2025-06-01'
group by c.customers_id,c.name,c.city
having sum (o.amount)>=2000
order by total_spent desc;