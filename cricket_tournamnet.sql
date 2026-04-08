------1]create table team ------
create table team
(team_id int primary key, team_name varchar(50),
city varchar (50), coach VARCHAR(50));


------2]create table player------
create table player (player_id int primary key,
name varchar(50), age int , team_id int,
foreign key (team_id) references team (team_id));


--------3]create table stadium -----
create table stadium 
(stadium_id int primary key, 
stadium_name varchar(50),
city varchar(30));


------4]create table matches------
create table matches
(match_id int primary key,
team1 int, team2 int , stadium_id int, 
match_date date,
foreign key (team1) references team (team_id),
foreign key (team2) references team(team_id),
foreign key (stadium_id) references
 stadium (stadium_id));


------5]create table award------
create table award 
(match_id int, player_id int,
primary key(match_id),
foreign key (match_id) references
 matches(match_id),
foreign key (player_id) references 
player(player_id));


-----6]insert values for table team-----
 insert into team values
 (1,'rcb','bangalore','coach1');
insert into team values
 (2,'mi','mumbai','coach2');
 insert into team values
 (3,'csk','chennai','coach13')


------7]insert values of table player-----
 insert into player values
 (101,'virat',34,1);
 insert into player values
 (102,'rohit',36,2);
 insert into player values
 (103,'dhoni',41,3);
 insert into player values
 (104,'suraj',29,1);
 insert into player values
 (105,'surya',32,1);


------8]insert values into stadium----
 insert into stadium values
 (201,'chinnaswamy','bangalore');
 insert into stadium values
 (202,'wankhade','mumbai');


-----9]insert values into matches----
 insert into matches values
 (301,1,2,201,'2026-01-01');
 insert into matches values
 (302,2,3,202,'2026-02-01');
insert into matches values
(303,1,3,201,'2026-01-03');


-----10]insert values into award----
insert into award values
(301,101);
insert into award values
(302,102);
insert into award values
(303,104);


------11]display table team----
select * from team;

------12] display table player-----
select * from player;


-----13]display table stadium-----
select * from stadium ;


------14]display table matches-----
select * from matches;


------15]display table award-----
select * from award;


-----16]youngest player(name,team,age)
select p.name ,t.team_name,p.age
from player p
join team t on p.team_id=t.team_id
where p.age=(select min(age from player));


------17]stadium where maximum matches were played--
select s.stadium_name, count(*) as matches_count
from matches m 
join stadium s on m.stadium_id=s.stadium_id
group by s.stadium_name
order by matches_count desc
limit 1;


------18]teams who won maximum matches-----
select t.team_name ,count(*) as wins
from matches m
join team t on m.team1=t.team_id
group by t.team_name
order by wins desc
limit 1; 


------19]team who won maximum matches-----
select t.team_name
from team t
join matches m on t.team_id=m.team1 or
 t.team_id= m.team2
 group by t.team_name
 having count(distinct m.stadium_id)=1;


