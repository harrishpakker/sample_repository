use hr;
show tables;
select * from employees;
INSERT INTO employees
VALUES (207,'Jose ','Urman','JMURMAN','515.124.4469',STR_TO_DATE('07-MAR-1998', '%d-%M-%Y'),'FI_ACCOUNT',7800,NULL,100,90);
DELETE FROM employees WHERE employee_id=207;
-- 1. Find out those employees whose managers are working in different department (hr schema)


select a.employee_id,a.first_name,a.salary from employees a 
join employees b on a.manager_id = b.employee_id
where a.department_id <> b.department_id;

-- 2. Gather employee name and salary data of employees who receive salary greater than their manager's salary. (hr schema)
select employee_id,first_name,salary from employees a where salary > (select salary from employees b where a.manager_id = b.employee_id);

select a.employee_id,a.first_name,a.salary from employees a 
join employees b on a.manager_id = b.employee_id
where a.salary > b.salary;

show tables;
select * from employees;
-- 3. For all the employees fetch the employee id, employee name, manager id and their corresponding manager name.
-- If an employee is not reporting to any manager display 'NA' (hr schema)
select a.employee_id,a.first_name,ifnull(a.manager_id,'NA') as manager_id,ifnull(b.first_name,'NA') manager_name from employees a left join employees b 
on a.manager_id = b.employee_id;

select * from departments;
-- 4. Display the employee name along with their department name. Show all the employee name 
-- even those without department and show all the department names even if it doesnt have an employee  (hr schema)
select a.employee_id,a.first_name,a.department_id,department_name from employees a left join departments b 
on a.department_id = b.department_id 
union 
select a.employee_id,a.first_name,a.department_id,department_name from employees a right join departments b 
on a.department_id = b.department_id ;



show tables;
-- 5. Display the order id's which have the maximum quantity ordered greater than 20 (hr schema)
select * from order_header where order_id in 
(select order_id from order_items group by order_id having max(ORDERED_QTY) > 20); 

use hr;
-- 6. Display the state province of employees who get commission_pct greater than 0.25 (hr schema)
select * from locations where location_id in 
(select location_id from departments where department_id in
(select department_id from employees where commission_pct > 0.25));

-- 7. Display the manager details who have more than 5 employees reporting to them (hr schema)
select manager_id,count(*) from employees group by manager_id having count(*) > 5 ;
use hr;
with subquery as (select manager_id,count(*) from employees group by manager_id having count(*) > 5 )
select employee_id,concat(first_name,' ',last_name) from employees,subquery where employees.employee_id = subquery.manager_id;
     
                    
-- 8. Collect only the duplicate employee records (hr schema)
select * from employees;
select email,count(*) from employees  group by email;

            
-- 9. Display the top 3 most frequently rented movies in descending order.
-- Get the movie name and times rented (sakila schema)
use sakila;
show tables;
select * from rental;
select * from inventory;
select * from film;
select * from payment;
select * from film_list;
select distinct film_id,count(film_id) over(partition by film_id  ) count from inventory;
with subquery as (select distinct film_id,count(film_id) over(partition by film_id) count from inventory)
select subquery.film_id,count,title from subquery,film where subquery.film_id = film.film_id  order by count desc;

select * from(
select f.title,count(rental_date) as 'Times_rented',rank() over(order by count(rental_date) desc) as 'rank'
from film f join inventory i on f.film_id=i.film_id join rental r on r.inventory_id = i.inventory_id
group by f.title) z where z.rank<4;






-- 10. Find the total payment received every year and display the same for the respective records ( for all the payment id's) (sakila schema)
show tables;
select * from payment;
select payment_id , year(payment_date),
sum(amount) over(partition by year(payment_date) )from payment;


-- 11. Find the overall payment received so far and the amount received for a month of a year, find the proportion and 
-- sort the result based on the highest proportion coming first. Display the calculated results for all the payment id's (sakila schema)
select * from payment;
-- select payment_id ,concat(month(payment_date), ' / ', year(payment_date)), year(payment_date),
-- sum(amount) over() as 'amount_received',
-- sum(amount) over (partition by concat(month(payment_date), ' / ', year(payment_date))) as 'amount_received_month',
-- ()

-- from payment;
select payment_id, amount, concat(month(payment_date), '-', year(payment_date)), sum(amount) over () as 'amount_recd', 
sum(amount) over (partition by concat(month(payment_date), '-', year(payment_date))) as 'amount_recd_month', (sum(amount) over (partition by 
concat(month(payment_date), '-', year(payment_date)))) / (sum(amount) over ()) as amount_recd_prop from payment order by amount_recd_prop desc; 

-- 12. For department id 80 and commission percentage more than 30% collect the below details:
-- employee id's of each department, their name, department id and the number of employees 
-- in each department (hr schema)
use hr;
select employee_id,concat(first_name,' ',last_name),department_id from employees 
where commission_pct > 0.3 and department_id = 80;

SELECT employee_id, CONCAT(first_name, ' ', last_name) Employee_name, department_id, (SELECT COUNT(employee_id) FROM employees e2 
WHERE e1.department_id = e2.department_id) No_of_Employees_in_dept FROM employees e1 WHERE department_id = 80 AND commission_pct > 0.30; 

-- 13. Show the employee id's , employee name, manager id, salary, average salary
-- of employees reporting under each manager and the difference between them

select employee_id,first_name,manager_id,salary,avg(salary) over(partition by manager_id) avg_salary,
(salary - avg(salary) over(partition by manager_id)) as difference from employees;



-- 14. Get the order date, order id, product id, product quantity and Quantity ordered 
-- in a single day for each record (order schema)
select oh.order_date, oh.order_id, p.product_id,QTY_IN_STOCK,sum(ORDERED_QTY) over(partition by order_date )
from order_header oh join order_items oi on oh.ORDER_ID=oi.ORDER_ID join product p on oi.product_id = p.PRODUCT_ID; 


-- 15. Divide the employees into 10 groups with highest paid employees coming first.
-- For each employee fetch the emp id, department id salary and the group they belong to (hr schema)
select employee_id,department_id,salary,ntile(10) over(order by salary desc) from employees;

select name,ntile(3) over(order by editor_rating) from play_store;


use sakila;
show tables;
-- 16. Filter out the customer ids, the number of orders made and map them to customer types
-- 	number of orders  = 1 --> 'One-time Customer'
-- 	number of orders  = 2 --> 'Repeated Customer'
-- 	number of orders  = 3 --> 'Frequent Customer'
-- 	number of orders  > 2 --> 'Loyal Customer'
select * from customer;
WITH cte AS ( SELECT online_customer.customer_id as cus_id, COUNT(*) orderCount FROM order_header 
INNER JOIN online_customer on order_header.customer_id = online_customer.customer_id GROUP BY online_customer.customer_id ) 
SELECT cus_id, orderCount, CASE orderCount WHEN 1 THEN 'One-time Customer' 
WHEN 2 THEN 'Repeated Customer' WHEN 3 THEN 'Frequent Customer' ELSE 'Loyal Customer' end customerType FROM cte ORDER BY cus_id; 

-- 17. Get the total orders as well as the break up for the total shipped, in-process and cancelled order status in a single row. (order schema)
SELECT count(ORDER_ID) as total_orders, SUM(IF(ORDER_STATUS = 'Shipped', 1, 0)) AS Shipped, SUM(IF(ORDER_STATUS = 'In Process', 1, 0)) AS In_Process, 
SUM(IF(ORDER_STATUS = 'Cancelled', 1, 0)) AS Cancelled FROM order_header; 

-- 18. create a view to get all the product details of cheapest product in each product category (use product type id)
CREATE VIEW cheap_prod AS select * from product where (product_category_id, product_price) in 
(select product_category_id, min(product_price) from product group by product_category_id); 

-- 19. create a view high_end_product with product_id, product_desc, product_price, product_category_id, product_category_description 
-- having product price greater than the minimum price of the category 2055 
create view high_end_product as SELECT p.product_id, p.product_desc, p.product_price, pc.product_category_id, pc.product_category_description 
FROM product p 
join product_category pc on p.product_category_id = pc.product_category_id where p.product_price > (select min(product_price) from product 
where product_category_id = 2055 
group by product_category_id); select * from high_end_product; 

-- 20. Make a copy of the product table with name prod_copy and Update the product price of categories with description containing
--  promotion-medium with 10% increase in price
create table prod_copy select * from product;

update prod_copy 
set product_price = product_price * 1.1 where product_category_id in 
(select product_category_id from product_category where product_category_description like "%promotion-medium%");
