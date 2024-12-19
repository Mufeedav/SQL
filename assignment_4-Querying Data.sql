-- create database
create database world_Population_data;
use world_population_data;

-- create table country
create table country(
id int primary key auto_increment,
country_name varchar(50),
population int,
area int
);

-- create table Person
create table Person(
id int primary key auto_increment,
Fname varchar(50),
Lname varchar(50),
population varchar(50),
rating decimal(5,1),
country_id int,
country_name varchar(50),
foreign key (country_id) references country(id)
);

insert into country (country_name,population,area)
values
('United States', 331002651, 9833517),
('Canada', 37742154, 9984670),
('United Kingdom', 67886011, 243610),
('Australia', 25499884, 7692024),
('Germany', 83783942, 357022),
('France', 67081000, 643801),
('Japan', 126476461, 377975),
('Brazil', 211049527, 8515767),
('India', 1380004385, 3287263),
('China', 1393409038, 9596961);

select *from country;

insert into person (Fname,Lname,Population,rating,country_id,country_name)
values
('John', 'Doe', 331002651, 4.5, 1, 'United States'),
('Jane', 'Smith', 37742154, 3.9, 2, 'Canada'),
('James', 'Brown', 67886011, 4.7, 3, 'United Kingdom'),
('Mary', 'Johnson', 25499884, 4.3, 4, 'Australia'),
('Michael', 'Williams', 83783942, 4.8, 5, 'Germany'),
('Linda', 'Jones', 67081000, 4.4, 6, 'France'),
('David', 'Miller', 126476461, 4.6, 7, 'Japan'),
('Sarah', 'Davis', 211049527, 4.3, 8, 'Brazil'),
('Robert', 'Garcia', 1380004385, 4.9, 9, 'India'),
('Emily', 'Martinez', 1393409038, 4.5, 10, 'China');

select *from Person;

-- 1.List the distinct country names from the Persons table
select distinct Country_name from person ;

-- 2.)Select first names and last names from the Persons table with aliases. 
select Fname,Lname,concat(Fname,' ',Lname) as Full_Name from person;

-- 3)Find all persons with a rating greater than 4.0.
select concat(Fname,' ',Lname) as Full_Name from Person where rating>4.0;

-- 4)Find countries with a population greater than 10 lakhs.
select country_name from person where population> 1000000;

-- 5)Find persons who are from 'USA' or have a rating greater than 4.5.
select concat(Fname,' ',Lname) as Name from person where country_name='United states' or rating>4.5;

-- 6.Find all persons where the country name is NULL.
select concat(Fname,' ',Lname) as Name from person where country_name=null;

-- 7)Find all persons from the countries 'USA', 'Canada', and 'UK'.
select concat(Fname,' ',Lname) as Name from person where country_name in ('United states','Canada','United Kingdom');

-- 8)Find all persons not from the countries 'India' and 'Australia'. 
select concat(Fname,' ',Lname) as Name from person where country_name not in ('India','Australia');

-- 9)Find all countries with a population between 5 lakhs and 20 lakhs.
select country_name from person where population between 500000 and 2000000;

-- 10)Find all countries whose names do not start with 'C'.
select Country_name from person where not Country_name like 'C%';

