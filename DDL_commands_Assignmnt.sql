-- creating database school_1
create database school_1;
use school_1;

-- creating table
create table student(
Roll_no int primary key auto_increment,
Name varchar(50),
Marks int,
grade char(1) check(grade in ('A','B','C','D'))
);

-- inserting values to table
insert into student
values (1,"Abi",90,'A');

insert into student 
values (2,"cijo",85,'B');

insert into student (name,marks,grade)
values 
("Digil",95,'A'),
("Susan",70,'C'),
("Zeeshan",90,'A');

-- display table
select * from student;

-- add column
alter table student
add Contact varchar(15);


-- drop column
alter table student
drop  column grade;

-- rename table
rename table student to Classten;

select * from Classten;

-- delete rows from table
truncate table Classten;

-- drop table
drop table Classten;