use temp;
show tables;
CREATE TABLE temp ( id INT, name VARCHAR(10) NOT NULL );
insert into temp values (1,'A'), (2,'B'),(2,'B'), (3,'C'),(3,'C'),(3,'C'), (4,'D');
SELECT id, name, ROW_NUMBER() OVER (PARTITION BY id, name ORDER BY id) AS row_num FROM temp; 


CREATE TABLE temp1 ( id INT, name VARCHAR(10) NOT NULL ); INSERT INTO temp1(id,name) VALUES(1,'A'), (2,'B'), (3,'C'), (4,'D'); 
select * from temp1; 
SELECT id, name, ROW_NUMBER() OVER (PARTITION BY id, name ORDER BY id) AS row_num FROM temp1; 

use HR;
select first_name, hire_date, salary, dense_rank() over( order by salary) as salry_rank from employees; 

select first_name, hire_date, salary, dense_rank() over( partition by year(hire_date) order by salary) as salary_rank from employees; 