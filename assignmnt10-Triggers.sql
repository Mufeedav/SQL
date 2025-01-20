create database schooldb;
use schooldb;

-- 1. Create a table named teachers with fields id, name, subject, experience and salary 
-- and insert 8 rows.
create table teachers(
id int primary key auto_increment,
name varchar(25),
subject varchar(25),
experience int,
salary decimal(10,2));

INSERT INTO teachers (name, 
subject, experience, salary) VALUES
('John Doe', 'Mathematics', 5, 45000.00),
('Jane Smith', 'English', 8, 52000.00),
('Alice Johnson', 'Science', 6, 48000.00),
('Bob Brown', 'History', 10, 55000.00),
('Charlie White', 'Geography', 7, 47000.00),
('David Black', 'Physics', 4, 46000.00),
('Eve Green', 'Chemistry', 9, 53000.00),
('Frank Blue', 'Biology', 11, 60000.00);

-- 2.Create a before insert trigger named before_insert_teacher that will raise an error 
-- “salary cannot be negative” 
-- if the salary inserted to the table is less than zero. 
delimiter $$
create trigger before_insert_teacher
before insert on teachers 
for each row
begin
IF new.salary<0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT= 'salary cannot be negative';
END IF;
END $$
DELIMITER ;


INSERT INTO teachers (name, subject, experience, salary) VALUES
('Serah Jennifer', 'Chemistry', 5, 53000.00);
INSERT INTO teachers (name, subject, experience, salary) VALUES
('Catherine','Physics',1,-1000);

-- 3. Create an after insert trigger named after_insert_teacher that inserts a row with 
-- teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table.
--  tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted.



create table teacher_log(
teacher_id int,
action varchar(50),
timestamp datetime,
foreign key ( teacher_id ) references teachers(id));


delimiter $$
create trigger after_insert_teacher
after insert on teachers
for each row
begin
insert into teacher_log values(new.id,'insert',now());
end $$
 delimiter ;
 
 INSERT INTO teachers (name, subject, experience, salary) VALUES
('Jennifer', 'social science', 5, 53000.00);
select *from teachers;
select *from teacher_log;

-- 4. Create a before delete trigger that will raise an error 
-- when you try to delete a row that has experience greater than 10 years.

delimiter $$
create trigger before_delete_teacher
before delete on teachers
for each row
begin
IF OLD.experience>10 then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete teacher with experience more than 10 years';
end IF;
end $$
delimiter ;

 INSERT INTO teachers (name, subject, experience, salary) VALUES
('Bob', 'social science', 15, 75000.00);
DELETE FROM TEACHERS WHERE name='Bob';

 -- 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
delimiter $$
create trigger after_delete_teacher
after delete on teachers
for each row
begin
insert into teacher_log values(old.id,'delete',now());
end $$
delimiter ;




