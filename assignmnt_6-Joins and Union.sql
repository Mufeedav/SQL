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
('Michael', 'Williams', 83783942, 4.80, 5, 'Germany');

-- 1)Perform inner join
select country.country_name,country.population,country.area,person.rating,person.country_id 
from country inner join person on country.id=person.country_id;
-- left join
select country.country_name,country.population,country.area,person.rating,person.country_id 
from person left join country on country.id=person.country_id;
-- right join
select country.id,country.country_name,country.area,person.rating 
from country right join person on country.id=person.country_id;

-- 2)List all distinct country names from both the Country and Persons tables.
select country_name from country union select country_name from person;

-- 3)List all country names from both the Country and Persons tables, including duplicates.
select country_name from country union all select country_name from person;

-- 4)Round the ratings of all persons to the nearest integer in the Persons table.
alter table person add rounded_rating int;
update person set rounded_rating=round(rating) where id<>0;
select rating,rounded_rating from person;



