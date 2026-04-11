-- Active: 1775669452257@@127.0.0.1@3306@cscorner
create table customer
(customer_id int primary key,
name varchar(50),
city varchar(50));

create table orders(
    order_id int primary key,
    customer_id int,
    amount decimal (10,2),
    order_date date,
    foreign key (customer_id)
    references customer (customer_id)
);

insert into customer values
(1,'alice','mumbai');
 insert into customer values
(2,'bob','delhi');
insert into customer values
(3,'charlie','mumbai');
insert into customer values
(4,'david','bangalore');

select * from customer;

insert into orders values
(1,1,500,'2024-12-01');
insert into orders values
(2,1,1200,'2024-12-15');
insert into orders values
(3,2,700,'2024-12-20');
insert into orders values
(4,3,2000,'2024-12-22');
insert into orders values
(5,3,500,'2024-12-25');

select * from orders;

select city
from customer c
join orders o on c.customer_id=o.order_id
where amount>500
group by city
having count(*)>=2;

select c.city ,count(*) as
total_orders,sum(o.amount) as
total_revenue
from customer c
join orders o on c.customer_id=o.order_id
where o.amount>500
group by c.city;

select c.city ,count(*) as
total_orders,sum(o.amount) as
total_revenue
from customer c
join orders o on c.customer_id=o.order_id
where o.amount>500
group by c.city
order by total_revenue desc;