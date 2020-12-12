#################################### Questions #################################### # Question 1: # 1) Print sum of Purchase_cost and average of estimated_sale_price of table 
use Bank;
show tables;

# Bank_inventory_pricing during 2nd month .
select sum(purchase_cost),avg(Estimated_sale_price) from Bank_Inventory_pricing where month =2 ;


# Question 2: # 2) Print average of estimated_sale_price with two decimals from bank_inventory_pricing table. 
select format(avg(Estimated_sale_price),2) from Bank_Inventory_pricing;

# Question 5: # 5) Print the sum of purchase_cost of Bank_Inventory_pricing table with default value of 2000/- 
# if not updated with any value 
select sum(ifnull(purchase_cost,2000)) from Bank_Inventory_pricing ;


# Question 6: # 6) Print unique records of bank_inventory_pricing without displaying the month. 
select Product from Bank_Inventory_pricing group by Product;
select distinct Product,Quantity,Price,purchase_cost,Estimated_sale_price from Bank_Inventory_pricing;




# Question 7: # 7) print the average of Purchase_cost from the table Bank_inventory_pricing.If the purchase_cost is not updated 
# then it’s value is equal to estimated_sale_price. 
select avg(ifnull(purchase_cost,Estimated_sale_price))
from Bank_Inventory_pricing;


# Question 8: # 8) Print the count of unique Products used in Bank_inventory_pricing 
select count(*),Product from Bank_Inventory_pricing group by Product;
select count(distinct Product) from Bank_Inventory_pricing;



# Question 9: # 9) Print product and the difference of maximum and minimum purchase_cost of each product in Bank_Inventory_Pricing. 
select * from Bank_Inventory_pricing;
select Product,(max(purchase_cost)-min(purchase_cost))
from Bank_Inventory_pricing
group by Product;

# Question 13: # 13) Print product and its average of Estimated_sale_price when purchase_cost is not mentioned. 
select Product ,avg(Estimated_sale_price)
from Bank_Inventory_pricing
where Purchase_cost is null
group by Product;

# Question 16: # 16) Print each Product with its highest estimated_sale_price in bank_inventory_pricing 
select Product,max(Estimated_sale_price)
from Bank_Inventory_pricing
group by Product;



# Question 19: # 19) Calculate average estimated_sale_price for each product . 
# For any null estimated_sale_price, replace the value with purchase_cost 

select Product,avg(ifnull(Estimated_sale_price,purchase_cost))
from Bank_Inventory_pricing
group by Product;