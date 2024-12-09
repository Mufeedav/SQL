-- creating database
create database Sales;
use Sales;

-- creating table
create table Orders(
Order_id int auto_increment primary key ,
Customer_name varchar(50) not null,
Product_category varchar(50),
Ordered_item varchar(50),
Contact_No varchar(15) unique);

-- add new column
alter table orders
add order_quantity int;

select* from orders;

-- rename table
rename table orders to sales_orders;

-- insert values to table
insert into sales_orders(Customer_name,Product_category,Ordered_item,Contact_No,order_quantity)
values("Akhil","Electronics","Mobile Phone",8798789879,1);

insert into sales_orders(Customer_name,Product_category,Ordered_item,Contact_No,order_quantity)
values
("Sreeja","Electronics","Laptop",2348789879,3);

insert into sales_orders(Customer_name,Product_category,Ordered_item,Contact_No,order_quantity)
values
("Saral","Accessories","Head Phone",1234567898,5),
("Thomson","Electronics","Tablet",5443233213,2),
("Cijo","Electronics","Tablet",322343213,4),
("Sumit","Accessories","head phone",8764567898,1),
("Daksha","Furniture","Chair",128767898,5),
("Rustham","Electronics","Printer",877878878,2),
("Greeta","Accessories","Monitor",545454545,1),
("Hari","Furniture","Table",7686786788,1);

select *from sales_orders;

-- retrieve specified column
select Customer_name,Ordered_item from sales_orders;

-- update
update sales_orders set Ordered_item="Samsung_tablet" where Order_id=4;

-- delete
drop table sales_orders;