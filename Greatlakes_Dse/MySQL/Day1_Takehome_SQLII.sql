# Datasets used: employee_details.csv and Department_Details.csv
# Use subqueries to answer every question

CREATE SCHEMA IF NOT EXISTS Employee;
USE Employee;
# import csv files in Employee database.

SELECT * FROM department_details;
SELECT * FROM employee_details;

#Q1. Retrive employee_id , first_name , last_name and salary details of those employees whose salary is greater than the average salary of all the employees.
select * from employee_details where salary > (select  avg(salary) from employee_details);

#Q2. Display first_name , last_name and department_id of those employee where the location_id of their department is 1700
select first_name,last_name,department_id from employee_details where department_id in
(select department_id from department_details where location_id = 1700);
-- select department_id from department_details where location_id = 1700;
-- select distinct department_id from employee_details;

#Q3. From the table employees_details, extract the employee_id, first_name, last_name, job_id and department_id who work in  any of the departments of Shipping, Executive and Finance.
select * from employee_details where department_id in 
(select department_id from department_details where department_name in ('Shipping','Executive','Finance'));

#Q4. Extract employee_id, first_name, last_name,salary, phone_number and email of the CLERKS who earn more than the salary of any IT_PROGRAMMER.
select * from employee_details where job_id like '%clerk%' and salary > any(select salary from employee_details where job_id like "%prog%");

#Q5. Extract employee_id, first_name, last_name,salary, phone_number, email of the AC_ACCOUNTANTs who earn a salary more than all the AD_VPs.
select * from employee_details where job_id like '%accountant%' and salary > all(select salary from employee_details where job_id like "%ad_vp%");

#Q6. Write a Query to display the employee_id, first_name, last_name, department_id of the employees who have been 
#recruited in the recent half timeline since the recruiting began. 
-- select year(now())-year(cast(hire_date as date)) from employee_details;
-- select year(now());
-- select cast(hire_date as date) from employee_details;
-- desc employee_details;

#Q7. Extract employee_id, first_name, last_name, phone_number, salary and job_id of the employees belonging to the 'Contracting' department 
select employee_id, first_name, last_name, phone_number, salary,job_id from employee_details
where department_id in (select department_id from department_details where department_name like '%contracting%');

#Q8. Extract employee_id, first_name, last_name, phone_number, salary and job_id of the employees who does not belong to 'Contracting' department
select * from employee_details where department_id not in (select department_id from department_details where department_name like "contracting");

#Q9. Display the employee_id, first_name, last_name, job_id and department_id of the employees who were recruited first in the department



#Q10. Display the employee_id, first_name, last_name, salary and job_id of the employees who earn maximum salary for every job.
select * from employee_details a where salary = (select max(salary) from employee_details b where a.job_id = b.job_id);

select * from employee_details where salary in (select max(salary) from employee_details group by job_id);
