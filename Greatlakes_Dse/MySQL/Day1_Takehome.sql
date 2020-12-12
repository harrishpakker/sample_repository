/* Prerequisites */
-- Use the Bank_Holidays and bank_inventory tables from Online_Day1_Inclass file to answer the below questions
show databases;
use Bank;
show tables;
# Question 1:
# 1) Increase the length of geo_location size of 30 characters in the bank_inventory table.
select * from Bank_Inventory;
desc Bank_Inventory;
alter table Bank_Inventory modify geo_location varchar(30);

# Question 2:
# 2) Update  estimated_sale_price of bank_inventory table with an increase of 15%  when the quantity of product is more than 4.
update Bank_Inventory set Estimated_sale_price = Estimated_sale_price + (Estimated_sale_price * (15/100)) where Quantity>4;

# Question 3:
# 3) Insert below record by increasing 10% of estimated_sale_price to the given estimated_sale_price 
		-- Product : DailCard
		-- Quantity: 2 
		-- price : 380.00 
		-- Puchase_cost : 8500.87
		-- estimated_sale_price: 9000.00
insert into Bank_Inventory values ('DailCard',2,380.00,8500.87,9000.00,null);
update Bank_Inventory set Estimated_sale_price = Estimated_sale_price + (Estimated_sale_price * (10/100)) ;
 
# Question 4:
# 4) Delete the records from bank_inventory when the difference of estimated_sale_price and 
-- Purchase_cost is less than 5% of estimated_sale_price 
delete from Bank_Inventory where Estimated_sale_price-Purchase_cost < (0.05 * Estimated_sale_price);

# Question 5:
# 5) Update the end time of bank holiday to 2020-03-20 11:59:59 for the holiday on 2020-03-20
select * from Bank_Holidays;
 
# Use tables cricket_1 and cricket_2 from Online_Day2_InClass to answer the queries. 
show databases;
use inclass_day2;


# Question 6:

# Q6.Extract Player_Id and Player_name of those columns where charisma is null.
select Player_Id,Player_name from new_cricket where charisma is null ;
select * from new_cricket;


# Question 7:

# Q7.Write MySQL query to extract Player_Id , Player_Name , charisma where charisma is greater than 25.
select Player_Id,Player_name from new_cricket where charisma >25 ;

# Question 8:

# Q8.Write MySQL query to extract Player_Id , Player_Name who scored fifty and above
select Player_Id,Player_name from new_cricket where Runs>50; 


# Question 9:

# Q9.Write MySQL query to extract Player_Id , Player_Name who have popularity in the range of 10 to 12.
select Player_Id,Player_name from new_cricket where Popularity between 10 and 12; 

# Question 10:

# Q10.Write MySQL query to extract Player_id, Player_Name where the Runs and Charisma both are greater than 50.
select Player_Id,Player_name from new_cricket where Runs>50 and charisma >50; 
