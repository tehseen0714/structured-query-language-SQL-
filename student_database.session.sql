 -----1]to create table branch-------
create table if not exists branch (branch_id int primary key,
branch_name varchar(50),hod varchar(50));


-------2]to create table student-----
create table if not exists student (usn varchar (10) primary key,
name varchar(50),address varchar(100),branch_id int ,
foreign key (branch_id) references 
branch (branch_id));


-----3] to create table author-----
create table if not exists author (author_id int primary key,
author_name varchar(20),country varchar(20),age int);


-------4] to create table book-------
create table if not exists book(book_id int primary key,
book_name varchar(50), author_id int,publisher varchar(50),
branch_id int, foreign key (author_id) references author (author_id),
foreign key (branch_id) references branch (branch_id));
  

-------5] to create table borrow-----
create table if not exists borrow( usn varchar(10), book_id int, 
borrowed_date date, primary key(usn,book_id),
foreign key (usn) references student (usn),
foreign key (book_id) references book (book_id));


------6] Values insertion of table branch------
insert into branch values
(1001,'cse','Ali');
insert into branch values
(1002,'ece','kumar');

--------7]display table branch-----
select * from branch;


-------8]Values insertion of table student----
insert into student 
values
('s1','amit','delhi',1001);
insert into student 
values
('s2','neha','mumbai',1002);
insert into student
values
('s3','rahul','pune',1001);


------9] display table student
select * from student;


-------10] Values insertion of table author-----
insert into author values(101,'chetan bhagat','india',45);
insert into author values(102,'APJ Abdul kalam','india',70);


------11] display table author-----
select * from author;


------12] Values insertion of table book-----
insert into book values(201,'c programming',101,'pearson','1001');
insert into book values(202,'Data strucrure',101,'mcgrawhill','1001');
insert into book values(203,'wings of fire',102,'universities press',
'1002');


-----13] display table book-----
select * from book;


-----14] Values insertion of table borrow----
insert into borrow values ('s1',201,'2024-01-22');
insert into borrow values ('s1',202,'2024-01-23');
insert into borrow values ('s2',203,'2024-01-22');


-----15] display table borrrow-----
select * from borrow;


-----16]select names of  all students----
select name from students;


------17]select names of all books----
select book_name from book;


------18] select students of branch_id=1001-----
select * from student where branch_id=1001;


------19]select publisher name pearson----
select * from book where publisher='pearson';


------20]count number of students----
select count(*) from student;


-----21]count number of books----
select count(*) from book;


------22]select name and bookid----
select s.name ,b.book_id from student s , borrow b where s.usn=b.usn;


-----23]arrange book names in ascending order------
select book_name from book order by book_name asc;


-----24]student who did not borrow any book-------
select  name from student where usn not in (select usn from borrow);

