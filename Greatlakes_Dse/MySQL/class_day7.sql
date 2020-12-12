use HR;
show databases;
select * from employees;
select avg(salary) 
from employees 
where department_id = (select department_id from departments where department_name = 'Sales');


select * from employees;
select * from employees where first_name like "%susan%";

select e1.employee_id , e2.salary
from employees e1, employees e2
where e1.first_name like "%susan%" and e1.salary < e2.salary;

select employee_id,salary 
from employees 
where salary > (select salary from employees where first_name like "%susan%");

select *
from employees 
where department_id <> (select department_id from employees where first_name like "%den%");

select * 
from employees a,employees b
where a.first_name = "Den" and a.department_id <> b.department_id;

select * from employees;
show tables;
select * from regions;
select * from locations;
select * from countries;

select * from countries where region_id = (select region_id from regions where region_name = "Europe");

select country_id,country_name,a.region_id 
from countries a
join regions b
on a.region_id = b.region_id
where b.region_name like "europe";

select * from employees where salary > all(select salary from  employees where year(hire_date) = 1990);
select salary from  employees where year(hire_date) = 1990;
select * from employees where salary > (select salary from  employees where year(hire_date) = 1990);
select * from jobs;
select * from employees where salary > any(select max_salary from jobs where job_id in ('ST_CLERK','IT_PROG'));
select max_salary from jobs where job_id in ('ST_CLERK','IT_PROG');



# Which departments are available at ‘Seattle’ location.
select * from employees;
show tables;
select * from departments;
select * from locations;
select * from departments where location_id = (select location_id from locations where city like "%seattle%");
# Which employees have salary more than average salary of organization.
select * from employees where salary > (select avg(salary) from employees);
# List the departments which are at same locations as of sales.
select department_name from departments where location_id = (select location_id from departments where department_name = "Sales");

# List the employees who have salary more than any employees of HR department. 
-- select * from employees where salary > (select salary from)
use HR;
select employee_id,first_name,last_name,department_id
from employees
where salary > any(select salary
from employees
where job_id like 'HR%'); 



create database inclass;
use inclass;

show tables;
use inclass;
show tables;

# Dataset used: titanic_ds.csv # Use subqueries for every question 
#Q1. Display the first_name, last_name, passenger_no , fare of the passenger who paid less than the maximum fare. (20 Row) 
select * from titanic;
select first_name,last_name,Passenger_No from titanic where fare < (select max(fare) from titanic);
#Q2. Retrieve the first_name, last_name and fare details of those passengers who paid fare greater than average fare. (11 Rows)
select first_name,last_name,Passenger_No from titanic where fare > (select avg(fare) from titanic); 
#Q4. Display first_name,embark_town where deck is equals to the deck of embark town ends with word 'town' (7 Rows) 
-- select first_name,embark_town from titanic where deck = (select deck from titanic where ) ;
select first_name,embark_town from titanic where deck in (select deck from titanic where embark_town like '%town'); 



# Dataset used: youtube_11.csv 
select * from youtube;
#Q5. Display the video Id and the number of likes of the video that has got less likes than maximum likes(10 Rows) 
select video_id,Likes from youtube where Likes < (select max(Likes) from youtube);
#Q6. Write a query to print video_id and channel_title where trending_date is equals to the trending_date of category_id 1(5 Rows) 
select video_id,Channel_Title from youtube where Trending_Date = (select Trending_Date from youtube where Category_id =1);
#Q7. Write a query to display the publish date, trending date ,views and description where views are more than views of Channel 'vox'.(7 Rows))
select Publish_Date,Trending_Date,Views,Description from youtube where Views > (select Views from youtube where Channel_Title like "%vox%");
#Q8. Write a query to display the channel_title, publish_date and the trending_date having category id in between 9 to Maximum category id . 
# Do not use Max function(3 Rows) 
select Channel_Title,Publish_Date,Trending_Date from youtube where Category_id = any(select Category_id from youtube where Category_id>=9);

#Q9. Write a query to display channel_title, video_id and number of view of the video that has received more than mininum views. (10 Rows) 
select Channel_Title,Video_id,Views from youtube where Views > (select min(Views) from youtube);