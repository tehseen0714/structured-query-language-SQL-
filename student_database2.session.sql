------1] to create tabe student_data--------
create table student_data (usn varchar (10) primary key ,
name varchar (50) ,  branch varchar(20) , date_of_birth
date , mark1 int , mark2 int , mark3 int,
total int , gpa decimal (3,2));

----2] to insert the values--------
insert into student_data values
('S001','Amit','CSE','2002-05-10',80,75,85,240,8.0);
insert into student_data values
('S002','Rahul','EC','2001-03-15',70,65,60,195,6.5);
insert into student_data values
('S003','samar','CS','2002-08-10',90,92,88,270,9.0);
insert into student_data values
('S004','amar','EEE','2002-09-10',60,70,65,195,6.5);
insert into student_data values
('S005','neha','CS','2002-10-10',85,80,82,247,8.2);

------3]to display student table----
select * from student_data;


------4]find gpa score of all students------
select name, gpa from student_data;


------5]student born in 2002-----
select * from student_data where year (date_of_birth)=2002;


------6]list of students of cs branch----
Select name from student_data
where branch ='CS';


-----7]find maximum gpa branch wise------
select branch , max(gpa)as max_gpa
from student_data
group by branch;


-----8] find students whose name strats with 'S'----
select * from student_data where name like 's%';


-----9]find students whose name ends with 'AR'-----
select * from student_data where name like '%ar';


-----10]students details with usn is'S001'----
select * from student_data
where usn='S001';


