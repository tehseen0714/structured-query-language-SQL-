-- Active: 1775669452257@@127.0.0.1@3306@cscorner
------table state------
create table state
(state_id int primary key,
state_name varchar(50)
);


-------table tourist place-----
create table tourist_place
(place_id int primary key,
place_name varchar(50),
state_id int,
distance_km int,
history text,
foreign key (state_id) references state(state_id));


------table tourist-----
create table tourist
(tourist_id int primary key,
name varchar (50),
age int,
country varchar(50));

-------table tourist email------
create table tourist_email
(email_id int primary key,
tourist_id int,
email varchar (50),
foreign key (tourist_id) references tourist (tourist_id));


-------table visit-----
create table visit
(visit_id int primary key,
tourist_id int,
place_id int,
visit_date date,
foreign key (tourist_id) references tourist (tourist_id),
foreign key (place_id) references tourist_place (place_id));


--------values of table state------
insert into state values
(1,'karnataka');
insert into state values
(2,'tamil nadu');
insert into state values
(3,'kerala');


------values of table tourist place------
insert into tourist_place values
(101,'mysore palace',1,150,'historical place');
insert into tourist_place values
(102,'hampi',1,350,'ancient ruins');
insert into tourist_place values
(103,'ooty',2,250,'hill station');
insert into tourist_place values
(104,'munnar',3,350,'tea garden');


-----values of table tourist-------
insert into tourist values
(201,'amit',25,'india');
insert into tourist values
(202,'john',30,'usa');
insert into tourist values
(203,'priya',28,'india');
insert into tourist values
(204,'lee',35,'china');


------values of table tourist email-----
insert into tourist_email values
(1,201,'amit@gmail.com');
insert into tourist_email values
(2,201,'amit@yahoo.com');
insert into tourist_email values
(3,202,'john@gmail.com');
insert into tourist_email values
(4,203,'priya@gmail.com');
insert into tourist_email values
(5,204,'lee@gmail.com');


------values of table visit-----
insert into visit values
(1,201,101,'2024-01-10');
insert into visit values
(2,201,102,'2024-01-15');
insert into visit values
(3,202,101,'2024-02-10');
insert into visit values
(4,203,103,'2024-03-05');
insert into visit values
(5,204,104,'2024-03-10');
insert into visit values
(6,202,102,'2024-04-01');

----display table state----
select * from state;


-----display table tourist place-----
select  * from tourist_place;

------display table tourist----
select * from tourist;


------display table tourist emial-----
select * from tourist_email;

------display table visit-------
select * from visit;


-----state with maximum tourist place-------
select s.state_name
from state s
join tourist_place t on s.state_id=t.state_id
group by s.state_name
having count(*)=(select max (cnt)
from (select count (*) cnt 
from tourist_place
group by state_id)x
);



-----tourist place with maximum visitors-----
select tp.place_name, count(v.tourist_id) as visitors
from tourist_place tp
join visit v on tp.place_id=v.place_id
group by tp.place_name
having count(v.tourist_id)=(
    select max(cnt)
    from(
        select count(*) cnt
        from visit
        group by place_id
    )x
);


-------tourists who visisted places in karnataka----
select distinct t.name
from tourist t
join visit v on t.tourist_id=v.tourist_id
join tourist_place tp on v.place_id=tp.place_id
join state s on tp.state_id=s.state_id
where s.state_name='karnataka';


----tourits who visisted at least one place but not all places----
select t.name
from tourist t
where t.tourist_id in (select tourist_id from visit)
and t.tourist_id not in(
    select tourist_id
    from visit
    group by tourist_id
    having count(distinct place_id)=(select count(*)
    from tourist_place)
);


-----tourist places visited by tourists from all countries------
select tp.place_name
from tourist_place tp
join visit v on tp.place_id=v.place_id
join tourist t on v.tourist_id=t.tourist_id
group by tp.place_name
having count(distinct t.country)=(select count(distinct country)
from tourist);