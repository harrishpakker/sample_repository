# DEcide salary hike for employees based on current salary less then 5K -20%, 5k to 10k -- 15% 10k to 20k -- 10% 20k onwards -- 5%
use HR;
show tables;
select * from employees;
select year(now()) - year(hire_date) from employees;
select case 
when salary < 5000 then salary * 1.20
when salary < 10000 then salary * 1.15
when salary < 20000 then salary * 1.10
else salary * 1.05
end hike_salary
from employees;

select salary from employees order by salary desc limit 1,1;

select max(salary) from employees where salary < (select max(salary) from employees );

SELECT DISTINCT(salary) FROM employees ORDER BY salary DESC LIMIT 0,1;

SELECT DISTINCT(salary) FROM employees ORDER BY salary DESC LIMIT 1 offset 0;
SELECT DISTINCT(salary) FROM employees ORDER BY salary desc;

select * from employees
where row(manager_id,department_id) = (select manager_id,department_id from departments where location_id = 1800 );

select manager_id,department_id from departments;

select * from employees a where 2 = (select count(employee_id) from employees b where b.salary > a.salary );


-- Display details of those employees who have changed jobs at least once. 
show tables;
select * from job_history;
select employee_id from employees a where 1 < (select count(*) from employees b where b.employee_id = a.employee_id);

select * from employees where employee_id in (select employee_id from job_history group by employee_id having count(employee_id)>=1); 
-- Find the employees who changed their jobs in other departments. 


use inclass;


show tables;