----- Use Case 1 Ability to create a payroll service database.
----- Using MSSQL Client use create database query to create a payroll_service database.
----- Also you can see the DB created by using show database query.
----- And go to the database created by using use payroll_service query. 

create database Payroll_Service;
use Payroll_Service;
exec sp_databases;  

select * 
from sys.databases;

--uc2  Ability to create a employee payroll table in the payroll service database to manage employee payrolls
-- Use payroll_service database in MSSQL Client
-- Use Create Table employee_payroll Query to create employee payroll table with columns id, name, salary and start date as column.
-- Note Id is set to auto increment. 
-- Understand the SQL data types to be used for the table
-- Note: SQL Queries as case insensitive


create Table employee_payroll
(
id int  NOT NULL Identity(1,1) primary key,
name varchar(20)  NOT NULL,
salary float NOT NULL,
startdate Date NOT NULL);

select * from employee_payroll -- Show table


---UC3:- Ability to create employee payroll data in the payroll service database as part of CURD Operation.
-- Use payroll_service database in MSSQL Client.
---Use INSERT INTO employee_payroll Query to create employees payroll data into the employee_payroll table.


-- insert into employee_payroll(name,salary,startdate)
-- values('Jack','2500','2021-05-13');
INSERT INTO employee_payroll VALUES('Omprakash', '50000', '2021-05-14');
INSERT INTO employee_payroll ( name, salary,startdate)
VALUES ('Om', '5000','2008-11-11');
select * from employee_payroll -- Show table

-- UC4:- Ability to retrieve all the employee payroll data that is added to payroll service database.
-- Use payroll_service database in MSSQL Client. 
-- Use SELECT * FROM employee_payroll to retrieve all the data from the employee_payroll table.

select * from employee_payroll


---UC5:- Ability to retrieve salary data for a particular employee as well as all employees who have 
---joined in a particular data range from the payroll service database.
-- Use SELECT salary FROM employee_payroll WHERE name = 'Bill’ Query to View Bill’s salary.
-- Use Select query with Where condition View employees between start dates. 
-- Query: WHERE start BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());
-- Note: Where Condition Clause is used to retrieve the row needed from the table. 
---Note: Use of Database Functions like CAST() and NOW() in the Query.

-- UC5.1:- Use SELECT salary FROM employee_payroll WHERE name = 'Bill’ Query to View Bill’s salary.

select salary from employee_payroll
where name = 'Bill'; --where condition use

select *  from employee_payroll
where name = 'Bill'; --where condition use


-- UC5.2:- Use Select query with Where condition View employees between start dates.

select salary from employee_payroll
Where start BETWEEN CAST('2021-05-13'
AS DATE) AND GETDATE();



---UC6:- Ability to add Gender to Employee Payroll Table and Update the Rows to reflect the correct Employee Gender.
-- Use payroll_service database in MSSQL Client 
-- Use Alter Table Command to add Field gender after the name field
-- Use Update Query to set the gender using where condition with the employee name
-- E.g. UPDATE employee_payroll set gender = 'M' where name = 'Bill' or name = 'Charlie';

--UC6.1:- Use Alter Table Command to add Field gender after the name field

alter table employee_payroll add gender varchar(1);
select *  from employee_payroll

SELECT TOP 5 * FROM [INFORMATION_SCHEMA].[COLUMNS] WHERE TABLE_NAME='employee_payroll'; --- show table information

-- UC6.2:- Use Update Query to set the gender using where condition with the employee name.

 UPDATE employee_payroll set gender = 'M' where name = 'Bill' or name = 'Charlie';

 ---UC7:- Ability to find sum, average, min, max and number of male and female employees.
-- Use payroll_service database in MSSQL Client.
-- Use Database Function SUM, AVG, MIN, MAX, COUNT to do analysis by Male or Female.
-- Note: You will need to use GROUP BY GENDER grouping to get the result
-- E.g. SELECT SUM(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;

UPDATE employee_payroll SET Gender = 'M' WHERE id = 3;
select * from employee_payroll
insert into employee_payroll values('Orisa','4200','2012-10-25','F');
select * from employee_payroll;

--UC7.1:- Ability to find SUM number of male and female employees.

SELECT SUM(salary) FROM employee_payroll       -- The SUM() function returns the total sum of a numeric column. 
WHERE Gender = 'M' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.

SELECT SUM(salary) FROM employee_payroll          --The SUM() function returns the total sum of a numeric column. 
WHERE Gender = 'F' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.


--UC7.2:- Ability to find AVG number of male and female employees.

SELECT AVG(salary) FROM employee_payroll      --AVG() function returns the average value of a numeric column. 
WHERE Gender = 'M' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.

SELECT AVG(salary) FROM employee_payroll         --AVG() function returns the average value of a numeric column. 
WHERE Gender = 'F' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.


--UC7.3:- Ability to find MIN number of male and female employees.

SELECT MIN(salary) FROM employee_payroll        --The MIN() function returns the smallest value of the selected column.
WHERE Gender = 'M' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.

SELECT MIN(salary) FROM employee_payroll         --The MIN() function returns the smallest value of the selected column.
WHERE Gender = 'F' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.


--UC7.4:- Ability to find MAX number of male and female employees.


SELECT MAX(salary) FROM employee_payroll        --The MAX() function returns the largest value of the selected column.
WHERE Gender = 'M' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.

SELECT MAX(salary) FROM employee_payroll           --The MAX() function returns the largest value of the selected column.
WHERE Gender = 'F' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.



--UC7.5:- Ability to find COUNT number of male and female employees.

SELECT COUNT(salary) FROM employee_payroll        --The COUNT() function returns the number of rows that matches a specified criterion.
WHERE Gender = 'M' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.

SELECT COUNT(salary) FROM employee_payroll           --The COUNT() function returns the number of rows that matches a specified criterion.
WHERE Gender = 'F' 
GROUP BY Gender;   --The GROUP BY statement groups rows that have the same values into summary rows.

-- UC8:- Ability to extend employee_payroll data to store employee information like employee phone, address and department.
-- Ensure employee department is non nullable fields.
-- Add Default Value for address field.

-- UC8.1:- Ability to extend employee_payroll data to store employee information like employee phone.

alter table employee_payroll add phone bigint; 
select *  from employee_payroll
-- UC8.2:- Ability to extend employee_payroll data to store employee information like address.
-- Add Default Value for address field.

alter table employee_payroll add address varchar(20) NOT NULL default'KADAPA';
select *  from employee_payroll
-- UC8.3:- Ability to extend employee_payroll data to store employee information like department.
-- Ensure employee department is non nullable fields.

alter table employee_payroll add department varchar(20) NOT NULL default'CS';
select *  from employee_payroll
-- UC9:- Ability to extend employee_payroll table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay.

-- UC9.1:- Ability to extend employee_payroll table salary to have Basic Pay.

EXEC sp_RENAME 'employee_payroll.salary', 'Basic_Pay', 'COLUMN';  --SQL Server use sp_rename to rename the column in the Employee_payroll table from salary to Basic_Pay.
select *  from employee_payroll;

-- UC9.2:- Ability to extend employee_payroll table salary to have Deductions.

ALTER TABLE employee_payroll ADD Deductions FLOAT;
select *  from employee_payroll;


-- UC9.3:- Ability to extend employee_payroll table salary to have Taxable_Pay.

ALTER TABLE employee_payroll ADD Taxable_Pay FLOAT;
select *  from employee_payroll;

-- UC9.4:- Ability to extend employee_payroll table salary to have Income_Tax.

ALTER TABLE employee_payroll ADD Income_Tax FLOAT;
select *  from employee_payroll;

-- UC9.5:- Ability to extend employee_payroll table salary to have Net_Pay.

ALTER TABLE employee_payroll ADD Net_Pay FLOAT;
select *  from employee_payroll;

sp_help employee_payroll;--sp_help is executed with no arguments, summary information of objects of all types that exist in the current database is returned.

-- UC10:- Ability to make Terissa as part of Sales and Marketing Department.
-- Note: The Complete employee payroll roll need to be Inserted.
-- If a Salary is now going to be updated multiple rows has to be updated creating unnecessary redundancy
-- Further There is 2 Employee ID so according to Database there is two different Terissa

---UC10.1:- If a Salary is now going to be updated multiple rows has to be updated creating unnecessary redundancy.

INSERT INTO employee_payroll
(name, Basic_Pay, start, Gender, department, Deductions, Taxable_Pay, Income_Tax, Net_Pay) VALUES
('Terisa',3000000.00, '2018-01-03','F','Marketting',1000000.00, 2000000.00, 500000.00,1500000.00);
select *  from employee_payroll;

--UC10.2:- Further There is 2 Employee ID so according to Database there is two different Terissa
select * from employee_payroll where name='Terisa'
-- UC10:- Draw the ER Diagram for Payroll Service DB.
---       -Identifies the Entities – Entities can be Identified using Normalization Technique.
--        - Check each attribute and see if they are Composite or MultiValue.


--UC11:- Implement the ER Diagram into Payroll Service DB.
--       - Create the corresponding tables as identified in the ER Diagram along with attributes.
--       - For Many to Many relationship, create new Table called Employee Department having Employee Id and Department ID and redo the UC 7.

--- UC11.1:- Create EmployeeDetails Table

create table EmployeeDetails (Emp_id int not null Primary Key identity(1,1),
Emp_Name varchar(50) not null,
Gender char(1) not null,
Phone_Number varchar(12),
Payroll_id int not null Foreign key References PayrollDetails(Payroll_id),
Start_Date date not null default ' ');

select * from EmployeeDetails; -- Display Table


 DBCC CHECKIDENT (EmployeeDetails, RESEED, 0)  -- Reset the value of identity
 select * from EmployeeDetails; -- Display Table

 --- UC11.2:- insert values EmployeeDetails Table

insert into EmployeeDetails(Emp_Name,Gender,Phone_Number,Payroll_id) values
							('Omprakash','M','8788616249','2');
							

select * from EmployeeDetails; -- Display Table

delete EmployeeDetails where Emp_id=4;  --Delete Row
select * from EmployeeDetails; -- Display Table

delete EmployeeDetails where Emp_id=5;  --Delete Row
select * from EmployeeDetails; -- Display Table

sp_help EmployeeDetails;

--- UC11.3:- Create table PayrollDetails 

create table PayrollDetails(Payroll_id int not null Primary Key,
BasePay int not null,
Deduction int not null,
TaxtablePay as (BasePay-Deduction) persisted,
NetPay as (BasePay-Deduction-0.05*( BasePay-Deduction)) persisted,
IncomeTax as 0.05*(BasePay-Deduction) persisted);

select * from PayrollDetails

--- UC11.4:- Insert Values PayrollDetails Table

insert into PayrollDetails values (1,50000,4000),(2,20000,800),(3,45411,5889),(4,12554,47777);
select * from PayrollDetails



--- UC11.5:- Create Table Department   relation M-M

create table Department(Dept_id int not null identity(1,1) primary key,DeptName varchar(50) not null unique);
select * from Department;  --display dtable

--- UC11.6:- Insert Values Department Table

insert into Department values('Computer');
select * from Department;

insert into Department values('IT');
select * from Department;


insert into Department values('Mech');
select * from Department;


--- UC11.7:- Create Table DeptEmployee   relation M-M

create table DeptEmployee(Emp_id int not null Foreign key references EmployeeDetails(Emp_id),Dept_id int not null Foreign key references Department(Dept_id) );
select * from DeptEmployee;

--- UC11.8:- Insert Values DeptEmployee Table
insert into DeptEmployee values(1,3);
select * from DeptEmployee;


--- UC11.9:- Create Table Addresses  Relation 1-1

create table Addresses(Emp_id int not null primary key Foreign key references EmployeeDetails(Emp_id),
Street varchar(50) not null,
City varchar(50),
State varchar(50));

select * from Addresses;

--- UC11.10:- Insert Values Addresses Table

insert into Addresses Values(1,'Kadapa','almas','andhra');
select * from Addresses;

--- UC12:- Ensure all retrieve queries done especially in UC 4, UC 5 and UC 7 are working with new table structure.

---UC12.1 Rechecking UC4 get income Tax Employee

select Emp_id,Emp_Name,IncomeTax from EmployeeDetails,PayrollDetails where EmployeeDetails.Payroll_id=PayrollDetails.Payroll_id;

---UC12.3 Retrive income Tax UC5 get income Tax Employee

select Emp_id,Emp_Name,IncomeTax from EmployeeDetails,PayrollDetails where Emp_Name='Omprakash' and  EmployeeDetails.Payroll_id=PayrollDetails.Payroll_id;

---UC12.4 Retrive income Tax UC5 get income Tax Employee

select Emp_id,Emp_Name,IncomeTax from EmployeeDetails,PayrollDetails where Start_Date between CAST('1900-01-01' as date) and GETDATE() and  EmployeeDetails.Payroll_id=PayrollDetails.Payroll_id;


---UC12.5 Check MIN MAX Income Tax

select * from EmployeeDetails JT inner join(select ITJ.IncomeTax,ITJ.Payroll_id from PayrollDetails inner join (select MAX(IncomeTax) as MaxIncomeTax from PayrollDetails)ITJ1 on ITJ1.MaxIncomeTax=ITJ.IncomeTax)JT1 on JT1.Payroll_id=JT.Payroll_id;



