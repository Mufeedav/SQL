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

-- 1. Write an SQL query to print the first three characters of Country_name from the Country table.
select country_name,left(country_name,3) as first3chars from country;

-- 2. Write an SQL query to concatenate first name and last name from Persons table.
select concat(fname,' ',Lname) as full_name from person;

-- 3. Write an SQL query to count the number of unique country names from Persons table.
select count(distinct country_name ) as count_of_unique_country_names from person;

-- 4. Write a query to print the maximum population from the Country table. 
select max(population) as Maximum_Population from country;

--  5. Write a query to print the minimum population from Persons table.
select min(population) as minimum_population from person;

-- 6. Insert 2 new rows to the Persons table making the Lname NULL. 
-- Then write another query to count Lname from Persons table.

insert into person (Fname,Lname,Population,rating,country_name)
values
('Jonnathan', null, 331882651, 3.56, 'United Kingdom'),
('Jenny',null,455676776,4.12,'Korea');

select *from person;
select count(Lname) from person;

-- 7. Write a query to find the number of rows in the Persons table. 
select count(*) as No_of_rows from person;

-- 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
select population from country limit 3;

-- 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT)
select *from country order by rand() limit 3;

-- 10. List all persons ordered by their rating in descending order. 
select * from person order by rating desc;

-- 11. Find the total population for each country in the Persons table. 
select country_name, sum(population) as total_sum from person group by country_name;

-- 12. Find countries in the Persons table with a total population greater than 50,000
select country_name, sum(population) from person group by country_name having sum(population)>50000;

-- 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, 
-- ordered by the average rating in ascending order.
#select count(*),avg(rating) from person;
#select count(*),avg(rating) from person group by country_name;

select count(*), avg(rating) from person group by country_name having count(*)>1 order by avg(rating) asc;

