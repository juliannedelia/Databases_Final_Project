create database final_project;
use final_project;

create table student(id integer, 
					major varchar(20), 
					state varchar(20),
					income integer,
					highschool varchar(20),
					application varchar(20),
					ethnicity varchar(20));

create table school(school varchar(20),
					major varchar(20));

create table region(area varchar(20),
					state varchar(20));

insert into student values(1234, 'journalism', 'NY', 65000, 'public', 'RD', 'white');
insert into student values(5867, 'secondary', 'ohio', 75000, 'private', 'ED1', 'afrAmer');
insert into student values(9826, 'CLEG', 'california', 45000, 'homeSchool', 'ED2', 'asian');
insert into student values(1037, 'IR', 'asia', 85000, 'private', 'ED1', 'latino');
insert into student values(6342, 'math', 'texas', 35000, 'public', 'RD', 'other');
insert into student values(7281, 'finance', 'colorado', 150000, 'boarding', 'ED2', 'white');
insert into student values(2980, 'primary', 'florida', 85000, 'homeSchool', 'ED1', 'latino');
insert into student values(3356, 'arts', 'NJ', 120000, 'boarding', 'ED2', 'white');
insert into student values(0953, 'film', 'wisconsin', 55000, 'public', 'RD', 'afrAmer');

select * from student;

insert into school values('SOC','journalism');
insert into school values('SOC','PR');
insert into school values('SOC','film');
insert into school values('SOC','commStud');
insert into school values('SPA','CLEG');
insert into school values('SPA','poliSci');
insert into school values('SPA','law');
insert into school values('SPA','justLaw');
insert into school values('KSB','finance');
insert into school values('KSB','accounting');
insert into school values('KSB','busiAdmin');
insert into school values('KSB','busiEnt');
insert into school values('CAS','math');
insert into school values('CAS','science');
insert into school values('CAS','arts');
insert into school values('CAS','humanities');
insert into school values('SOE','primary');
insert into school values('SOE','secondary');
insert into school values('SIS','IR');

select * from school;

insert into region values('northEast', 'massachusetts');
insert into region values('northEast', 'NJ');
insert into region values('northEast', 'NY');
insert into region values('northEast', 'connecticut');
insert into region values('northEast', 'pennslyvania');
insert into region values('south', 'texas');
insert into region values('south', 'georgia');
insert into region values('south', 'florida');
insert into region values('south', 'carolinas');
insert into region values('south', 'virginia');
insert into region values('midWest', 'ohio');
insert into region values('midWest', 'iowa');
insert into region values('midWest', 'wisconsin');
insert into region values('midWest', 'illinois');
insert into region values('midWest', 'indiana');
insert into region values('westCoast', 'california');
insert into region values('westCoast', 'washington');
insert into region values('westCoast', 'oregon');
insert into region values('westCoast', 'colorado');
insert into region values('westCoast', 'nevada');
insert into region values('international', 'asia');
insert into region values('international', 'southAsia');
insert into region values('international', 'europe');
insert into region values('international', 'latinAmer');

select * from region;

/*------------------------------------------------------------------------------------------*/

/*Select statements*/
select id, state, ethnicity
from student
where income >= 100000;

select id, major 
from student 
where application = 'ED1';

select id, application  
from student 
where income >= 50000;

select id, state, ethnicity
from student 
where income < 80000;

select school.school, student.major, income
from school, student
where school.major = student.major
and income < 100000;

select id, income from student
order by income asc;  

select school.school, student.major
from school, student
where school.major = student.major
order by school;

select id, state, income
from student
where state in
	(select state
	from region
	where area = 'midWest');

/*union operation*/
select state
from student
union
select state 
from region;

/*insert a set of tuples (by using another select statement)*/
insert into student(state)
select 'westCoast' from region where state = 'california';
select * from student;

/*Update queries*/

alter table student
add stuName varchar(255);

update student
set stuName = 'Lauren London'
where id = 1234;

update student
set stuName = 'Grayson York'
where id = 5867;

update student
set stuName = 'LeeAnn Colbert'
where id = 9826;

update student
set stuName = 'Billy Tifft'
where id = 1037;

update student
set stuName = 'Marci Glass'
where id = 6342;

update student
set stuName = 'Denis Winton'
where id = 7281;

update student
set stuName = 'Helena Linton'
where id = 2980;

update student
set stuName = 'Dorris Peterson'
where id = 3356;

update student
set stuName = 'Frank Chambers'
where id = 0953;

select * from student;

insert into student values(7865, 'compSci', 'georgia', 42000, 'public', 'ED2', 'other', 'Rebecca Saga');
insert into school values('CAS', 'compSci');

select * from student;

/*Delete statement*/
delete from region where state = 'iowa';
select * from region;

/*Create View*/
create view StuNameID as
select stuName, id
from student
order by stuName;

select * from StuNameID;

/*Triggers*/
Delimiter $$
create trigger region_income_insert after insert on student
for each row
begin
delete from region;
insert region
select state, income from student
order by income;
end;
$$

Delimiter $$
create trigger major_delete after delete on school
for each row
begin
delete from school where major=old.major;
end;
$$

Delimiter $$
create trigger addstate before insert on
region
for each row
begin
declare temp Int;
set temp=0;
select count(*) into temp from region
where state=new.state;
if temp=0 then
insert into Mylog values(concat('state ',new.state, ' is
not in the system'));
insert into anytable values('Just to cause error');
end if;
end;
$$

Delimiter $$
Create trigger major_checking before insert on
school
For each row
Begin
Declare temp int; set temp=0;
Select count(*) into temp
From school where major=new.major;
If temp=0 then
Insert into mylog values('Invalid Major');
Insert into anytable values('This major is not offered');
End if;
End;
$$





