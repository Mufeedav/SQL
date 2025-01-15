create database employeedb;
use employeedb;

-- create table
create table Worker(
WorkerID int key auto_increment,
FirstName char(25),
LastName char(25),
Salary int,
JoiningDate datetime,
Department char(25));

-- 1. Create a stored procedure that takes in IN parameters for all the columns 
-- in the Worker table and adds a new record to the table and then invokes the procedure call.

delimiter $$
create procedure NewRecord
(IN first_name char(25),IN last_name char(25),IN salary int,IN joining_date datetime,IN deptmnt char(25))
begin
INSERT INTO Worker(FirstName,LastName,Salary,JoiningDate,Department)
VALUES(first_name,last_name,salary,joining_date,deptmnt);
end $$
delimiter ;

CALL NewRecord('John','Smith',40000,'2020-12-04 09:30:00','HR');
CALL NewRecord('David','George',35000,'2020-05-25 09:30:00','IT');
select * from worker;

-- 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. 
-- It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. 
-- Then make the procedure call. 

delimiter $$
create procedure WorkerSalary(IN worker_id int,OUT p_salary int)
begin
select salary into p_salary from worker where WorkerID=worker_id;
end $$
delimiter ;

CALL WorkerSalary(1,@p_salary);
select @p_salary as worker1_Salary;

-- 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. 
-- It should update the department of the worker with the given ID. 
-- Then make a procedure call.

delimiter $$
create procedure update_dptmnt(IN worker_id int,dept char(25))
begin
update worker 
set Department=dept where WorkerID=worker_id;
end $$
delimiter ;

CALL update_dptmnt(1,'IT');
select *from Worker;
worker
-- 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount.
-- It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. 
-- Make procedure call.

delimiter $$
create procedure count_dpt_employee(IN dpt char(25),OUT p_workercount int)
begin
select count(*) into p_workercount from worker where department=dpt;
end $$
delimiter ;


call count_dpt_employee('IT',@p_workercount);
select @p_workercount;

--  5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary.
-- It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter 
-- and call the procedure.

delimiter $$
create procedure dpt_avgsalary(IN dpt CHAR(25), OUT p_avgSalary decimal(10,2))
BEGIN
select avg(Salary) into p_avgSalary FROM Worker WHERE Department=dpt;
END $$
delimiter ;

CALL dpt_avgsalary('IT',@dpt_avgsalary);
SELECT @dpt_avgsalary AS Average_Salary_By_Department;








