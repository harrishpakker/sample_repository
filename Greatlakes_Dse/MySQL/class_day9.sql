use HR;

show tables;
select * from employees;
select * from locations;

select department_id,avg(salary) from employees group by department_id having avg(salary) < (select salary from employees where first_name = "Lex");

select * from employees where department_id in
(select department_id from departments where location_id in 
(select location_id from locations where street_address like "%st%"));

select * from employees where department_id in
(select department_id from departments where location_id in 
(select location_id from locations where street_address like "%london%"));


use temp;
show tables;
select * from student;
update student set grad_marks = 0 where grad_marks = (select grad_marks from student where sname= 'ABC');
use HR;
#display nname of dept for rmployees with top 5 slary

select * from employees;

-- select department_name from departments where department_id in
-- (select department_id from employees order by salary  );
with temp_table(dept_id) as (select department_id from employees order by salary desc limit 5)
select department_name,department_id from departments,temp_table where department_id = temp_table.dept_id;


use inclass;
-- Display all details of the top 5 customers with respect to number of orders they placed. 
select * from customers;
select * from orders;
with temp_tab(cust_num) as (select customernumber from orders group by customernumber order by count(*) desc limit 5)
select * from customers,temp_tab where customerNumber = temp_tab.cust_num;



-- List the products which are not ordered 
select * from products where productcode not in
(select productcode from orderdetails);





-- Display the customer details along with their payment details if the payment is more than 50000. 
select * from customers;
show tables;
select * from productlines;
select * from orders;
select * from orderdetails;
select * from payments;


-- with temp_tab(ordernum,bill) as (select ordernumber,sum(quantityOrdered*priceEach) from orderdetails  group by ordernumber having sum(quantityOrdered*priceEach) > 50000)
-- select customernumber from orders where ordernumber = temp_tab.ordernum;
with temp_tab(custnum,checknum,paymentdate,amount) as (select * from payments where amount > 50000)
select customerNumber,checknum,paymentdate,amount from customers,temp_tab where customerNumber = custnum;

-- For each employee display the number customers for each them. 
select * from orders;
select * from employees;
select * from customers;

select salesRepEmployeeNumber,count(salesRepEmployeeNumber) from customers group by salesRepEmployeeNumber;
with temp_tab(empnum,count) as (select salesRepEmployeeNumber,count(salesRepEmployeeNumber) from customers group by salesRepEmployeeNumber)
select employeeNumber,count from employees,temp_tab where employeeNumber=empnum;

select * from employees;

-- Display office location details along with the number of employees working in it.
 
-- Display city of each manager. 
select * from employees;

select employeeNumber,lastname from employees a where reportsTo in (select reportsTo from employees b where b.reportsTo = a.employeeNumber );

select distinct a.employeeNumber,a.lastname from employees a,employees b where b.reportsTo = a.employeeNumber;


use HR;
select department_id,sum(salary) as total from employees group by department_id;
select * from employees;
select avg(salary) as 'Average Salary' from employees;
select distinct salary from employees;
select sum(salary) as 'Total Salary' from employees;
select variance(salary) from employees;

use sample;
show tables;
select * from billing;
select isnull(project_name) from billing;