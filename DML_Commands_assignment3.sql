-- create database
create database Employees;
use Employees;

-- 1.create table
Create table Managers(
Manager_ID int primary key auto_increment,
First_name varchar(50) not null,
Last_name varchar(50),
DOB date,
Age int check (age>=25),
Last_update date default (current_date()),
Gender char(1) check(Gender in('M','F','O')),
Department varchar(50),
Salary int not null
);

-- insert values
insert into Managers(First_name,Last_name,DOB,Age,Gender,Department,Salary)
values
("Cijo","Joseph",'1991-12-2',33,'M',"HR",35000),
("Jessy","Paul",'1984-10-23',40,'F',"IT",50000),
("Haritha","Babu",'1990-05-04',34,'F',"Marketing",35000),
("Harik","Umar",'1985-02-08',39,'M',"Finance",45000),
("Nithya","James",'1991-02-10',33,'F',"Operatins",34000),
("Aaliya","Parveen",'1999-02-08',25,'F',"Finance",25000),
("Kripa","Suresh",'1999-09-09',25,'F',"Finance",23000),
("Nikhila","Shameer",'1994-02-08',30,'F',"IT",25000),
("Hari","Kumar",'1985-02-08',39,'M',"HR",39000),
("Mohsin","Umar",'1991-10-11',33,'M',"IT",35000);

select *from Managers;

-- 2.Display the name and dob of manager with manager id 1
select First_name,Last_name,DOB from Managers where Manager_ID=1;

-- 3.display annual income of all managers
select Manager_ID,concat(First_name,' ',Last_name) as Name, (Salary*12) as Annual_Income from Managers;

-- 4. Write a query to display records of all managers except ‘Aaliya’.
Select *from Managers where First_name!="Aaliya";

-- 5. Write a query to display details of managers whose department is IT and earns more than 25000 per month. 
select *from managers where (department='IT' and Salary>25000);

 -- 6. Write a query to display details of managers whose salary is between 10000 and 35000.
 select *from Managers where Salary between 10000 and 35000;