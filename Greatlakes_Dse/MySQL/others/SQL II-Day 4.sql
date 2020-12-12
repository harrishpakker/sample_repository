use hr;

SELECT 
    employee_id, YEAR(hire_date), department_id, salary
FROM
    employees
ORDER BY YEAR(hire_date) , department_id , salary;

select sum(salary) total from employees;



SELECT 
    department_id, SUM(salary) dept_sal
FROM
    employees
GROUP BY department_id
ORDER BY department_id;

SELECT         employee_id,  year(hire_date), department_id, salary,         
SUM(salary) OVER() AS total,         
SUM(salary) OVER(PARTITION BY department_id) AS dept_sal       
FROM employees       
ORDER BY employee_id,  year(hire_date), department_id, salary; 



## Row_number()
select first_name, hire_date,salary from employees order by salary;

select first_name, hire_date, salary,
row_number() over() as salary_rank
from employees;

select first_name, hire_date, salary,
row_number() over( order by salary) as salary_rank
from employees;

select first_name, hire_date, salary, department_id,
row_number() over( partition by department_id) as salary_rank
from employees;

## Unique rows with row_number()
use db;
CREATE TABLE temp (
    id INT,
    name VARCHAR(10) NOT NULL
);
INSERT INTO temp(id,name) 
VALUES(1,'A'),
      (2,'B'),
      (2,'B'),
      (3,'C'),
      (3,'C'),
      (3,'C'),
      (4,'D');
select * from temp;

SELECT id, name, ROW_NUMBER() 
OVER (PARTITION BY id, name ORDER BY id) AS row_num 
FROM temp;

## Rank()
use hr;
select first_name, hire_date from employees order by salary;

select first_name, hire_date, salary,
rank() over(order by salary) as salary_rank
from employees;

select first_name, hire_date,
rank() over( order by salary) as salry_rank
from employees;

select first_name, hire_date, salary,
rank() over( partition by year(hire_date) order by salary ) as salary_rank
from employees;

## Dense_rank()

select first_name, hire_date, salary,
dense_rank() over( order by salary) as salry_rank
from employees;

select first_name, hire_date, salary,
dense_rank() over( partition by year(hire_date) order by salary) as salary_rank
from employees;

## Percent_rank()

select first_name, hire_date, salary,
percent_rank() over( order by salary ) as salary_rank
from employees;

select first_name, hire_date, department_id, salary,
percent_rank() over( partition by department_id order by salary) as salary_rank
from employees;

select first_name, hire_date, salary,
percent_rank() over( partition by year(hire_date) order by salary) as salary_rank
from employees;

## cume_dist()
select first_name, hire_date from employees order by salary;

select first_name, hire_date, salary,
cume_dist() over (order by salary) as cumulative 
from employees;

select first_name, hire_date, department_id, salary,
cume_dist() over (partition by department_id order by salary) as cumulative 
from employees;

## Lag()

select last_name, first_name, department_id, hire_date,    
          LAG(first_name, 1, "No Body") over (partition by department_id
                                  order by hire_date) prev_hire_date
     from employees
   order by department_id, hire_date, last_name, first_name;
   
   ## Lead()
   
   select last_name, first_name, department_id, hire_date,
           LAG(hire_date, 1, null) over (partition by department_id
                                   order by hire_date) prev_hire_date,
           LEAD(hire_date, 1, null) over (partition by department_id
                                   order by hire_date) following_hire_date
      from employees
   order by department_id, hire_date, last_name, first_name;
   
   
   ##first_value()
   
   select first_name, employee_id, salary,
   first_value(first_name) over(order by salary) as min_sal_name
   from employees 
   order by salary;

   select first_name, employee_id, salary, department_id,
   first_value(first_name) over(partition by department_id order by salary)
   from employees 
   order by department_id,salary;
   
   ##last_value()
   
   select first_name, employee_id, salary,
   last_value(first_name) over(order by salary RANGE BETWEEN
            UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING)
   from employees 
   order by salary;

   select first_name, employee_id, salary, department_id,
   last_value(first_name) over(partition by department_id order by salary RANGE BETWEEN
            UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING)  as lastvalname
   from employees 
   order by department_id,salary;
   
   
   ##Nth_value()
   
   select first_name, employee_id, salary,
   nth_value(first_name,3) over(order by salary)
   from employees 
   order by salary;

   select first_name, employee_id, salary, department_id,
   nth_value(first_name,3) over(partition by department_id order by salary)
   from employees 
   order by department_id,salary;
   
   
  ##ntile()
   
   select first_name, employee_id, salary,
   ntile(3) over(order by salary)
   from employees 
   order by salary;

   select first_name, employee_id, salary, department_id,
   ntile(3) over(partition by department_id order by salary)
   from employees 
   order by department_id,salary;
   
   ### Inclass solution

use inclass;

-- --------------------------------------------------------------
# Dataset Used: wine.csv
-- --------------------------------------------------------------

SELECT * FROM wine;

# Q1. Rank the winery according to the quality of the wine (points).-- Should use dense rank
select distinct winery from wine ;
SELECT winery, points,
	dense_RANK() OVER(ORDER BY points DESC) AS RNK
    FROM wine;


# Q2. Give a dense rank to the wine varities on the basis of the price.
select distinct variety from wine;
SELECT variety, price,
	DENSE_RANK() OVER(partition by variety ORDER BY price DESC) AS RNK
    FROM wine;
    


# Q3. Use aggregate window functions to find the average of points for each row within its partition (country). 
-- -- Also arrange the result in the descending order by country.

SELECT country, province, winery, variety, 
	AVG(points) OVER(PARTITION BY country) AS AvgPoints_CountryWise
    FROM wine
    ORDER BY country DESC;


-----------------------------------------------------------------
# Dataset Used: students.csv
-- --------------------------------------------------------------
select * from students;
# Q4. Rank the students on the basis of their marks subjectwise.
SELECT student_id , subject , name , marks ,RANK()
OVER (PARTITION BY subject ORDER BY marks DESC)
AS 'rank' FROM students;


# Q5. Provide the new roll numbers to the students on the basis of their names alphabetically.
select name, row_number() over(order by name) roll
from students;-- should use row_number


# Q6. Use the aggregate window functions to display the sum of marks in each row within its partition (Subject).
SELECT *, SUM(marks) OVER (PARTITION BY subject) 'total_marks' FROM students;


# Q7. Display the records from the students table where partition should be done 
-- on subjects and use sum as a window function on marks, 
-- -- arrange the rows in unbounded preceding manner.
SELECT *, SUM(marks) OVER (PARTITION BY subject ORDER BY marks ROWS UNBOUNDED PRECEDING) AS 'new' FROM  students;
SELECT *, SUM(marks) OVER (PARTITION BY subject ) AS 'new' FROM  students;

# Q8. Find the dense rank of the students on the basis of their marks subjectwise. 
#Store the result in a new table 'Students_Ranked'
CREATE TABLE Students_Ranked AS
SELECT *, DENSE_RANK ()
OVER(PARTITION BY subject ORDER BY marks DESC)
AS 'dense_RNK' FROM students;
select * from students_ranked;
