-- Active: 1775669452257@@127.0.0.1@3306@cscorn
-------table customer-----
create table customers
(customers_id int primary key,
name varchar (50),
city varchar(50));


--------table orders-------
create table orders
(orders_id int primary key,
customers_id int,
amount decimal (10,2),
product varchar(50),
foreign key (customers_id) references customers( customers_id)
);


--------values of customer------
insert into customers values
(1,'alice','mumbai');
insert into customers values
(2,'bob','delhi');
insert into customers values
(3,'carol','chennai');


-------values of order-------
insert into orders values
(1,1,200,'keyboard');
insert into orders values
(2,1,500,'mouse');
insert into orderssvalues
(3,2,800,'monitor');
insert into orders values
(4,3,1200,'laptop');
insert into orders values
(5,1,1200,'headphones');


-------display table customers and orderss-----
select * from customers;
select * from orders;


-------excluding laptop-----
select * from orders
where product not like '%laptop%';


-----total products and spent per customer----
select c.name ,
count(*) as total_products,
sum(o.amount) as total_spent
from customers c
join orders o on c.customers_id=o.orders_id
where o.product not like '%laptop%'
group by c.customers_id,c.name;


-------total greater than 500 and sort by number of products----
select c.name ,
count(*) as total_products,
sum(o.amount) as total_spent
from customers c
join orders o on c.customers_id=o.orders_id
where o.product not like '%laptop%'
group by c.customers_id,c.name
having sum(o.amount)>500
order by total_products desc;
