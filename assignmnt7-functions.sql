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
rating decimal(5,2),
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
('John', 'Doe', 331002651, 4.56, 1, 'United States'),
('Jane', 'Smith', 37742154, 3.93, 2, 'Canada'),
('James', 'Brown', 67886011, 4.77, 3, 'United Kingdom'),
('Mary', 'Johnson', 25499884, 4.38, 4, 'Australia'),
('Michael', 'Williams', 83783942, 4.80, 5, 'Germany'),
('Linda', 'Jones', 67081000, 4.4, 6, 'France'),
('David', 'Miller', 126476461, 4.6, 7, 'Japan'),
('Sarah', 'Davis', 211049527, 4.3, 8, 'Brazil'),
('Robert', 'Garcia', 1380004385, 4.9, 9, 'India'),
('Emily', 'Martinez', 1393409038, 4.5, 10, 'China');

-- 1. Add a new column called DOB in Persons table with data type as Date. 
alter table person 
add dob date;
desc person;

-- updating dob column
update person
set dob='1991-10-18' where id=1;

update person
set dob='1985-12-11' where id=2;

update person
set dob= '1981-08-11' where id=3;

update person
set dob='1990-10-10' where id=4;

update person
set dob='1992-02-02' where id=5;

update person
set dob='1994-05-24' where id=6;

update person
set dob='1995-02-20' where id=7;

update person
set dob='1991-11-02' where id=8;

update person
set dob='1991-05-05'where id=9;

update person
set dob='1993-01-05' where id=10;

 select * from person;

-- 2. Write a user-defined function to calculate age using DOB.

delimiter $$
create function dateofbirth(dob date)
returns int
deterministic
begin
declare age int;
set age = floor(datediff(curdate(),dob) )/ 365.25;

return age;
end $$;

delimiter ;

-- 3. Write a select query to fetch the Age of all persons using the function that has been created.
select id,fname,dateofbirth(dob) as age from person;

-- 4. Find the length of each country name in the Country table. 
select country_name,length(country_name) as length_of_country_name from country;

-- 5. Extract the first three characters of each country's name in the Country table.
select country_name, substring(country_name,1,3) as first_three_chars from country;

-- 6. Convert all country names to uppercase and lowercase in the Country table.
select country_name,upper(country_name) as uppercase,lower(country_name) as lowercase from country;