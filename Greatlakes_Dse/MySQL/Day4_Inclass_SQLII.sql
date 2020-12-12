
DROP TABLE IF EXISTS `account_details`;
CREATE TABLE IF NOT EXISTS `account_details` (
  `acc_id` int(10) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `ssn` char(10) NOT NULL,
  `acc_holder_id` int(10) NOT NULL,
  `balance` decimal(20,4) DEFAULT '0.0000',
  PRIMARY KEY (`acc_id`));
  
INSERT INTO `account_details` (`acc_id`, `acc_holder_id`, `balance`, `first_name`, `last_name`, `ssn`) VALUES
	(1, 100, 132.1020, 'Joseph', 'Cane', '098765432'),
	(2, 300, 4435.2030, 'Kim', 'Karry', '087654321'),
	(3, 120, 2345223.6600, 'Jim', 'Anderson', '123456780'),
	(4, 90, 98763.2300, 'Jessie', 'Thomson', '765432109'),
	(5, 110, 34221.1000, 'Palak', 'Patel', '654321890'),
	(6, 80, 7634.8000, 'Max', 'Jerrard', '456789012'),
	(7, 10, 876964.7000, 'Peter', 'Koshnov', '512345670'),
	(8, 110, 299876.6000, 'Monica', 'Irodov', '120088551'),
	(9, 100, 7659809.5300, 'Petro', 'Jenkins Jr', '123456789'),
	(10, 200, 111.1200, 'Jeff', 'Joshua', '765432189' );
    
select * from account_details;
# Q.1 Write a tansactional query that transfers 1000 dollars from Monica's account to Joseph's account
start transaction;
update account_details set balance = balance - 1000 where first_name = 'Monica';
update account_details set balance = balance + 1000 where first_name = 'Joseph';
select * from account_details;
commit;

# Q.2 Suppose while writing the above query you update i.e. transfer 1000 dollars to Peter's account instead of Joseph's account.
rollback;
# Write a query to discard all the changes and end the transaction
#############################################################################################################################################
# Create table to answer the follwoing question
Create table id_passwords( user_id varchar(20), 
							passwords varchar(20));
insert into id_passwords values
		('deborah_a', 'pass123'),
		('pique_xav', '123789pix'),
        ('jenny_fawx', '##**000'),
        ('alpha_m','infinity');
select * from id_passwords;

# Q.3 Write a query to make sure that no other mysql session should be able to insert any user ids or passwords
LOCK TABLE id_passwords WRITE;
############################################################################################################################################# 
-- ----------------------------------------------------
# Datasets Used: employee_details.csv and department_details.csv
-- ----------------------------------------------------
unlock tables;
# Q.4 Create a view "details" that contains the columns employee_id, first_name, last_name and the salary from the table "employee_details".
create view details as select employee_id, first_name, last_name ,salary from employee_details;
 
# Q.5 Update the view "details" such that it contains the records from the columns employee_id, first_name, last_name, salary, hire_date and job_id 
-- --  where job_id is ‘IT_PROG’.
select * from employee_details;
drop view details;
 alter view details as select employee_id, first_name, hire_date ,job_id from employee_details where job_id like "%it_prog%";
 
# Q.6 Create a view "check_salary" that contains the records from the columns employee_id, first_name, last_name, job_id and salary from the table "employee_details" 
-- --  where the salary should be greater than 50000.
create view check_salary as select employee_id, first_name, last_name, job_id , salary from employee_details where salary>50000;

# Q.7 Create a view "location_details" that contains the records from the columns department_name, manager_id and the location_id from the table "department_details" 
-- --  where the department_name is ‘Shipping’.
CREATE VIEW location_details AS 
SELECT department_name, manager_id, location_id
FROM department_details 
WHERE department_name = 'Shipping';
 
 
# Q.8 Create a view "salary_range" such that it contains the records from the columns employee_id, first_name, last_name, job_id and salary from the table "employee_details" 
-- --  where the salary is in the range (30000 to 50000).
#Solution:
CREATE VIEW salary_range AS 
SELECT employee_id, first_name, last_name, job_id, salary 
FROM employee_details 
WHERE SALARY BETWEEN 30000 AND 50000;
 
 
# Q.9 Create a view "pattern_matching" such that it contains the records from the columns employee_id, first_name, job_id and salary from the table name "employee_details" 
-- --  where first_name ends with "l".
#Solution:
CREATE VIEW pattern_matching AS 
SELECT employee_id, first_name, job_id, salary 
FROM employee_details 
WHERE first_name LIKE '%l';


# Q.10 Drop multiple existing views "pattern_matching", "salary" and "location_details".
#Solution:
DROP VIEW pattern_matching, salary_range, location_details;
 
 
# Q.11 Create a view "employee_department" that contains the common records from the tables "employee_details" and "department_table".
#Solution:
CREATE VIEW employee_department AS
SELECT emp.employee_id, emp.first_name, emp.salary, emp.job_id, dept.department_name 
FROM 
	employee_details AS emp
		INNER JOIN 
	department_details AS dept
		ON emp.employee_id = dept.employee_id; 
-- ----------------------------------------------------
# Datset Used: admission_predict.csv
-- ----------------------------------------------------
use inclass;
# Q.12 A university focuses only on SOP and LOR score and considers these scores of the students who have a research paper. 
-- Create a view for that university.
select * from Admission_Predict;
create view sop_lor as select SOP,LOR from Admission_Predict where Research = 1;
select * from sop_lor;

# Q.13 Create and append a new column "SOP_LOR_AVG" to the view "SLR_Focus".
create view SOP_LOR_AVG as select *,(SOP+LOR)/2 from sop_lor;
use inclass;
#############################################################################################################################################
#Create Table:
CREATE TABLE BANK_CUSTOMER ( customer_id INT , 
			     customer_name VARCHAR(20), 
			     Address     VARCHAR(20),
			     state_code  VARCHAR(3) ,         
			     Telephone   VARCHAR(10)    );
		    
#Insert records:
INSERT INTO BANK_CUSTOMER VALUES (123001,"Oliver", "225-5, Emeryville", "CA" , "1897614500");
INSERT INTO BANK_CUSTOMER VALUES (123002,"George", "194-6,New brighton","MN" , "1897617000");
INSERT INTO BANK_CUSTOMER VALUES (123003,"Harry", "2909-5,walnut creek","CA" , "1897617866");
INSERT INTO BANK_CUSTOMER VALUES (123004,"Jack", "229-5, Concord",      "CA" , "1897627999");
INSERT INTO BANK_CUSTOMER VALUES (123005,"Jacob", "325-7, Mission Dist","SFO", "1897637000");
INSERT INTO BANK_CUSTOMER VALUES (123006,"Noah", "275-9, saint-paul" ,  "MN" , "1897613200");
INSERT INTO BANK_CUSTOMER VALUES (123007,"Charlie","125-1,Richfield",   "MN" , "1897617666");
INSERT INTO BANK_CUSTOMER VALUES (123008,"Robin","3005-1,Heathrow",     "NY" , "1897614000");

# Q.14 Suppose there is no customer_id: 123009 in the BANK_CUSTOMER table,
#One of the first user is trying to update the customer_id details with condition customer_id > 123008 and updating telephone as NULL.
#At the same time, if some other user is trying to insert a record with customer_id : 123009 with values ( 123009, 'Ropert' , '99-Bechkingam', 'CA' , 1867888950).
#During the above two transactions occuring at a same time, After first user checks the database , he recieves an additional record entry of 123009 which he doesn't expect.
#How will you restrict the second user entry?
#Solution:
#Session1 - User1
commit;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT * FROM BANK_CUSTOMER WHERE customer_id > 123008 for update;
Update BANK_CUSTOMER set telephone = null where customer_id > 123008  ;

#Session2 - User2
insert into BANK_CUSTOMER  values ( 123009, 'Ropert' , '99-Bechkingam', 'CA' , 1867888950);

## Session 1
commit;

# Q.15 Write a query such that users can perform concurrent DML operations on the same customer_id = 123002 in BANK_CUSTOMER. 
# One user performs an updates House Address for that customer_id with "2999 New brighton" 
# Other user performs an update Telephone number with 189891899
#Session  - 1  
START TRANSACTION;
SELECT * FROM BANK_CUSTOMER WHERE customer_id = 123002 For update;
UPDATE BANK_CUSTOMER set Telephone = 189891899 WHERE customer_id = 123002;
commit;

#Session  - 2  /* requested exclusive lock from Session -1. */
START TRANSACTION;
UPDATE BANK_CUSTOMER set Address = '2999 New brighton' WHERE customer_id = 123002;


# Q.16 Write a transaction on customer Id = 123001 in table: BANK_CUSTOMER to acquire shared lock . So others can also acquire the 
# shared lock but cannot modify any rows in the BANK_CUSTOMER table
START TRANSACTION;
SELECT * FROM BANK_CUSTOMER LOCK IN SHARE MODE;

#############################################################################################################################################
CREATE TABLE BANK_ACCOUNT ( Customer_id INT, 		   			  
							Account_Number VARCHAR(19),
							Account_type VARCHAR(25),
							Balance_amount INT ,
                            Account_status VARCHAR(10), 
                            Relationship_type varchar(1) ) ;
INSERT INTO BANK_ACCOUNT  VALUES (123001, "4000-1956-3456",  "SAVINGS"            , 200000 ,"ACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123001, "5000-1700-3456",  "RECURRING DEPOSITS" ,9400000 ,"ACTIVE","S");  
INSERT INTO BANK_ACCOUNT  VALUES (123002, "4000-1956-2001",  "SAVINGS"            , 400000 ,"ACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123002, "5000-1700-5001",  "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S"); 
INSERT INTO BANK_ACCOUNT  VALUES (123003, "4000-1956-2900",  "SAVINGS"            ,750000,"INACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123004, "5000-1700-6091",  "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S"); 
INSERT INTO BANK_ACCOUNT  VALUES (123004, "4000-1956-3401",  "SAVINGS"            , 655000 ,"ACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123005, "4000-1956-5102",  "SAVINGS"            , 300000 ,"ACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123006, "4000-1956-5698",  "SAVINGS"            , 455000 ,"ACTIVE" ,"P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123007, "5000-1700-9800",  "SAVINGS"            , 355000 ,"ACTIVE" ,"P"); INSERT INTO BANK_ACCOUNT  VALUES (123007, "4000-1956-9977",  "RECURRING DEPOSITS" , 7025000,"ACTIVE" ,"S"); 
INSERT INTO BANK_ACCOUNT  VALUES (123007, "9000-1700-7777-4321",  "CREDITCARD"    ,0      ,"INACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123008, "5000-1700-7755",  "SAVINGS"            ,NULL   ,"INACTIVE","P"); 


# Q.17 Write a transactional query such that a 3% interest is added in the balance_amount of all account_numbers 
# of a customer Id = 123001 in bank_account table. Make sure that no other users is able to make any update to the table
#Solution:
START TRANSACTION;
SELECT * FROM bank_account WHERE customer_id = 123001 FOR UPDATE ;
UPDATE bank_account set balance_amount = balance_amount +  0.03 * balance_amount where customer_id = 123001;


# Q.18 Three users are performing DML operations;
# Out of three users, one user increases  balance_amount by 0.03% of customer_id = 123001; in bank_account table.
# Write transactional query such that after the above update users can insert two different balance_amount concurrently for an account : '4000-1956-3401' parallely without any deadlock
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
		START transaction;
		SELECT * from BANK_ACCOUNT where account_number = '4000-1956-3401' for UPDATE;
         UPDATE bank_account set balance_amount = balance_amount +  0.03 * balance_amount where customer_id = 123001;
         commit;
#After transaction of session -1 is complete with commit , below two transactions can be done at a time.
#Session-2: ( insert intention lock -1 ) 

         START TRANSACTION;
         INSERT INTO bank_account (account_number, Balance_amount)
         VALUES ( '4000-1956-3401', 7700 ) ;

#Session-3: ( insert intention lock -2 )
