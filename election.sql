create table constituency (
    constituency_id int primary key,
    name varchar(50),
    state varchar(50),
    number_of_voters int
);

create table party (
    party_id int primary key,
    party_name varchar(50),
    party_symbol varchar(50)
);

create table candidate (
    candidate_id int primary key,
    name varchar(50),
    phone_no varchar (50),
    age int,
    party_id int,
    constituency_id int,
    foreign key (party_id) references party (party_id),
    foreign key (constituency_id) references 
    constituency (constituency_id)
);

create table voter 
(voter_id int primary key ,
name varchar(50),
age int,
address varchar(50),
house_no varchar(10),
city varchar(50),
state varchar(50),
pincode varchar(10),
constituency_id int,
foreign key (constituency_id) references constituency 
(constituency_id));


insert into constituency values
(1,'bangalore south','karnataka',0);
insert into constituency values
(2,'mysore','karnataka',0);
insert into constituency values
(3,'chennai central','tamil nadu ',0);

insert into party values
(1,'abc party','lotus');
insert into party values
(2,'xyz party','hand');
insert into party values
(3,'pqr party','cycle');


insert into candidate values
(101,'Ravi','9876543212',45,1,1);
insert into candidate values
(102,'sita','9876554365',50,2,1);
insert into candidate values
(103,'arun','9876543288',38,1,2);
insert into candidate values
(104,'meena','9876543555',42,3,3);


insert into voter values
(201,'amit',25,'street1','12a','bangalore','karnataka',
'560001',1);
insert into voter values
(202,'john',30,'street2','45b','bangalore','karnataka',
'560001',1);
insert into voter values
(203,'priya',19,'street3','78c','mysore','karnataka',
'560001',2);
insert into voter values
(204,'kiran',17,'street4','80a','chennai','tamil nadu',
'600001',3);


select name 
from candidate
group by name
having count (distinct constituency_id )>1;

select state
from constituency
group by state
having count(*)=(select max(cnt) from 
(select count(*) as cnt from constituency
group by state) 
as temp);