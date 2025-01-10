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
population int,
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
('James', 'Brown',331002651, 4.56, 1, 'United States'),
('Mary', 'Johnson', 25499884, 4.38, 4, 'Australia'),
('Michael', 'Williams', 331002651, 4.56, 1, 'United States'),
('Linda', 'Jones', 67081000, 4.4, 6, 'France'),
('David', 'Miller', 126476461, 4.6, 7, 'Japan'),
('Sarah', 'Davis', 211049527, 4.3, 8, 'Brazil'),
('Robert', 'Garcia', 1380004385, 4.9, 9, 'India'),
('Emily', 'Martinez', 1393409038, 4.5, 10, 'China'),
('Jonnathan','james',331002651, 4.56, 1, 'United States'),
('Bob','Micheal', 67081000, 4.4, 6, 'France'),
('Lissy','Jacob', 67081000, 4.4, 6, 'France');

-- 1. Find the number of persons in each country.
select country_name,(select count(*) from person p 
where p.country_id=c.id) as number_of_persons from country c;  

-- 2. Find the number of persons in each country sorted from high to low.
select country_name,
(select count(*) from person p where p.country_id=c.id) as number_of_persons 
from country c
order by number_of_persons desc;

 -- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0
select country_name, 
       (select avg(rating) 
        from person p 
        where p.country_id = c.id) as average_rating from country c
where (select avg(rating) 
       from person p 
       where p.country_id = c.id) > 3.0;
       
-- 4. Find the countries with the same rating as the USA. (Use Subqueries)
select country_name
from country c
where exists (
	select 1
    from person p
    where p.country_id = c.id and p.rating = (select rating from person
	where country_name = 'United States'
	limit 1
    )
);

-- 5. Select all countries whose population is greater than the average population of all nations.
select country_name, population
from country
where population > (select avg(population) from country
);



--                  VIEW
-- Create the 'Product' database
create database Product;
use Product;

-- Create the 'Customer' table
create table Customer (
    Customer_Id INT PRIMARY KEY AUTO_INCREMENT,  
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15), 
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(20),
    Country VARCHAR(50)
);

-- 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. 
-- Then perform the SELECT operation for the customer_info view.
create view customer_info as
select 
    concat(First_name, ' ', Last_name) as Full_name,  
    Email  
from Customer;

-- 2. Create a view named US_Customers that displays customers located in the US
create view US_Customers as
select Customer_Id,First_name,Last_name,Email,Phone_no,Address,City,State,Zip_code,Country
from Customer
where Country = 'United States';

-- 3. Create another view named Customer_details with 
-- columns full name(Combine first_name and last_name), email, phone_no, and state.
create view Customer_details as
select concat(First_name, ' ', Last_name) AS Full_name, Email,Phone_no,State from Customer;

-- 4. Update phone numbers of customers who live in California for Customer_details view.
UPDATE Customer
SET Phone_no = 'new_phone_number'  
WHERE State = 'California'
  AND Customer_Id > 0;
  
 
  -- 5. Count the number of customers in each state and show only states with more than 5 customers.
 SELECT State, COUNT(*) AS Customer_Count
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

-- 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view
SELECT State, COUNT(*) AS Customer_Count
FROM customer_details
GROUP BY State;

-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
SELECT *
FROM customer_details
ORDER BY State ASC;