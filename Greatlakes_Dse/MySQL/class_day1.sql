# Question 1: # 1) Create a Database Bank 
CREATE DATABASE Bank; 
USE Bank; 
# Question 2: # 2) Create a table with the name “Bank_Inventory” with the following columns -- Product with string data type and size 10 -- 
-- Quantity with numerical data type -- 
-- Price with data type that can handle all real numbers -- purcahase_cost with data type which always shows two decimal values -- 
-- estimated_sale_price with data type float -- 
CREATE TABLE Bank_Inventory ( Product VARCHAR(10), Quantity INT, Price REAL, Purchase_cost DECIMAL(10,2), Estimated_sale_price FLOAT ); 
SHOW TABLES;

# Question 3: # 3) Display all columns and their datatype and size in Bank_Inventory 
SHOW COLUMNS FROM Bank_Inventory; 
DESC Bank_Inventory; 
# Question 12: # 12) Create a table named as Bank_Holidays with below fields 
-- a) Holiday field which displays or accepts only date -- b) Start_time field which also displays or accepts date and time both. 
-- c) End_time field which also displays or accepts date and time along with the timezone also. 
CREATE TABLE Bank_Holidays ( Holiday DATE, Start_Time DATETIME, End_Time TIMESTAMP );

 # 4) Insert two records into Bank_Inventory . -- 1st record with values -- 
 -- Product : PayCard -- Quantity: 2 -- price : 300.45 -- Puchase_cost : 8000.87 -- estimated_sale_price: 9000.56 -- 
 -- 2nd record with Paypoint, 4, 200.89, 7000.67, 6700.56 
 INSERT INTO Bank_Inventory VALUES ('PayCard',2,300.45,8000.87,9000.56); 
 INSERT INTO Bank_Inventory VALUES ('Paypoint',4,200.89,7000.67,6700.56); 
 select * from Bank_Inventory;
 show tables;
 
 # Question 11: # 11) Bank_inventory table consists of 'PayCard' product details. 
 -- For 'PayCard' product, Update the quantity from 2 to 10 
 UPDATE Bank_Inventory SET Quantity = 10 WHERE Product = 'PayCard';
 SELECT * FROM Bank_Inventory; 
 
 # Question 5: # 5) Add a column : Geo_Location to the existing Bank_Inventory table with data type varchar and size 20
 Alter table Bank_Inventory 
 add column Geo_Location varchar(20);
 
# Question 6: # 6) What is the value of Geo_Location for product : ‘PayCard’? 
select Geo_Location from Bank_Inventory where product = 'PayCard';

# Question 8: 
# a) Update the Geo_Location field from NULL to ‘Delhi-City’ 

UPDATE Bank_Inventory set Geo_Location = 'Delhi-City' where Geo_Location is NULL;


# Question 9: # 9) update the Product field from CHAR to VARCHAR size 10 in Bank_Inventory 
 Alter table Bank_Inventory 
 modify product varchar(10);
 
# Question 10: # 10) Reduce the size of the Product field from 10 to 6 and check if it is possible 
#not possible

# Question 16: # 16) Select all columns from Bank_Inventory without mentioning any column name 
select * from Bank_Inventory;

# Question 17: # 17) Display output of PRODUCT field as NEW_PRODUCT in Bank_Inventory table 
select product as NEW_PRODUCT from Bank_Inventory;


# Question 18: # 18) Display only one record from bank_Inventory 
select * from Bank_Inventory limit 1;
 
show columns from Bank_Inventory;
desc Bank_Inventory;
 
 