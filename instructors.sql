-----1]create table instructor----
create table instructors
(instructor_id int auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar (50) unique);


------2]create table courses------
create table courses
(course_id int primary key,
course_name varchar(100) not null,
price decimal(10,2) check (price>=0),
instructor_id int,
foreign key (instructor_id) references instructors
(instructor_id));
 

-----3]create table enrollments------
create table enrollments
(enrollment_id int primary key,
student_id int ,
course_id int,
enrollment_date date,
grade int,
foreign key (course_id) references
 courses (course_id));


------4]insertion of vales for table instructors-----
insert into instructors values
(1,'abc','xyz','abc@gmail.com');
insert into instructors values
(2,'def','qqw','def@gmail.com');
insert into instructors values
(3,'aqa','xns','aqa@gmail.com');

------5] dipslay table instructor----
select * from instructors;

------6]values insertion of table courses------
insert into courses values
(101,'c',150,1);
insert into courses values
(102,'c++',200,1);
insert into courses values
(103,'python',200,2);
insert into courses values
(104,'java',100,3);
insert into courses values
(105,'sql',300,2);


------7]display table courses-----
select * from courses;


------8]values insertion of table enrollments-----
insert into enrollments values
(1,201,101,'2025-07-04',85);
insert into enrollments values
(2,202,102,'2025-07-04',90);
insert into enrollments values
(3,203,103,'2025-07-04',75);
insert into enrollments values
(4,204,101,'2025-07-04',88);


-----9]display table enrollments-----
select * from enrollments;


-----10]increase sql price by 10%-----
update courses 
set price=price+(price*0.10)
where course_name='sql';


-----11]delete rerollment_id=101-----
delete from enrollments
where enrollment_id=101;


------12]course price between 50 and 200------
select * from courses
where price between 50 and 200;


------13]instructors email ending with gmail.com-----
select * from instructors 
where email like '%gmail.com';


------14]instructor id 1,3,5------
select * from courses
where instructor_id in(1,3,5);


-----15] order courses by price high-low----
select * from courses
order by price desc;


-----16]total revenue from enrollments------
select sum(price) as total_revenue
from courses c
join enrollments e on c.course_id=e.course_id;


----17] instructor with more than 2 courses
select instructor_id ,count(*)
from courses
group by instructor_id
having count(*)>2;

----18] average grade per course-----
select course_id ,avg(grade) as avg_grade
from enrollments
group by course_id;


-----19]inner join------
select e.student_id, c.course_name, i.first_name
from enrollments e
join courses c on e.course_id=c.course_id
join instructors i on c.instructor_id=i.instructor_id;


------20]left join-------
select i.first_name, c.course_name
from instructors i
left join courses c
on i. instructor_id=c.instructor_id;

----21]courses cheaper than average price-------
select *from courses
where price<(select avg(price)from courses);