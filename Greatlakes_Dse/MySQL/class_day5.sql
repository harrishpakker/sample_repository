use HR;
show tables;
select * from employees limit 5;

select avg(salary),count(*)
from employees 
where salary > 3000
group by department_id ;


select avg(salary),count(*)
from employees 
group by department_id
having avg(salary)>4000 ;

select avg(salary),count(*)
from employees 
where salary > 3000
group by department_id
having avg(salary)>4000 ;

select count(*),month(hire_date)
from employees
group by month(hire_date)
order by month(hire_date);

select count(*),month(hire_date)
from employees
where manager_id is not null
group by month(hire_date)
order by month(hire_date);

select count(*),manager_id
from employees
group by manager_id
having count(*) = 1 and manager_id is not null;

select employee_id,first_name,salary,
case 
when salary >= 7000 then 'A'
when salary >= 6000 then 'B'
when salary >= 5000 then 'C'
when salary >= 4000 then 'D'
when salary >= 3000 then 'E'
else 'F'
end as "Salary Grade"
from employees;


use Bank;
show tables;
# Question 3: # 3) Print the Products which are appearing in bank_inventory_pricing more than once during the month : 1 
select * from Bank_Inventory_pricing;

select product, count(*) 
from Bank_Inventory_pricing
where month=1 
group by product 
having count(*) > 1; 

# Question 4: # 4) Print Products that are appearing more than once in bank_inventory_pricing and whose purchase_cost is 
# greater than estimated_sale_price , assuming estimated_sale_price is 0 when there is no value given 

select product, count(*) 
from Bank_Inventory_pricing
where purchase_cost > ifnull(Estimated_sale_price,0)
group by product 
having count(*) > 1;


# Question 10: # 10) Print the sum of Purchase_cost of Bank_inventory_pricing during 1st and 2nd month 
select sum(purchase_cost),Month
from Bank_Inventory_pricing
where Month = 1 or Month=2
group by Month;

# Question 11: # 11) Print Products with an average value of Purchase_cost per product only when exceeding average of 6000. 
select avg(purchase_cost)
from Bank_Inventory_pricing
group by Product
having avg(purchase_cost)>6000;

# Question 12: # 12) Print products whose average of purchase_cost is less than sum of purchase_cost of Bank_inventory_pricing.
select Product
from Bank_Inventory_pricing
group by Product
having avg(purchase_cost)<sum(purchase_cost);

# Question 14: # 14) Display maximum estiamted_sale_price of each product when the product total quantity is exceeding 4 
# and its purchase_cost is updated. 
select Product,max(Estimated_sale_price),sum(Quantity)
from Bank_Inventory_pricing
where purchase_cost is not null
group by product
having sum(Quantity) > 4;

# Question 15: # 15) Print products whose average of purchase_cost per product is less than 200 
# from the table Bank_inventory_pricing
select Product,avg(purchase_cost) 
from Bank_Inventory_pricing
group by Product
having avg(ifnull(purchase_cost,0))<200;

# Question 17: # 17) 
# Question 17: # 17) Print product with an increase in average of estimated_sale_price by 15% when average product_cost is more than average 
# estimated_sale_price 
select product,avg(estimated_sale_price)*1.15
from Bank_Inventory_pricing
group by product 
having avg(purchase_cost) > avg(Estimated_sale_price);

# Question 18: # 18) For product = ‘BusiCard’, print average of purchase_cost on condition that when purchase_cost 
# is not updated , choose any of the higher value between price and estimated_sale_price 
select product,avg(ifnull(purchase_cost,greatest(price,estimated_sale_price)))
from Bank_Inventory_pricing
where product = 'BusiCard';

# Question 20: # 20) Print products and their avg price on condition that products appeared in at least three different months. 
select product,avg(price),count(distinct month)
from Bank_Inventory_pricing
group by product
having count(distinct month)>=3 ;