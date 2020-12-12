-- -------------------------------------------------------- # Datasets Used: cricket_1.csv, cricket_2.csv 
-- cricket_1 is the table for cricket test match 1. 
-- cricket_2 is the table for cricket test match 2. 
-- -------------------------------------------------------- 
# Q1. Find all the players who were present in the test match 1 as well as in the test match 2. -- 
show databases;

use inclass_day2;
show tables;


select player_id,player_name from cricket_1
union
select player_id,player_name from cricket_2;

 
# Dataset Used: cric_combined.csv -- -------------------------------------------------------- 
# Q6. Write a MySQL query to find the top 5 players having the highest popularity to charisma ratio. 
select player_name from cric_combined order by PC_Ratio desc limit 5;

-- -------------------------------------------------------- # Dataset Used: new_cricket.csv -- 
# Q10. Write a MySQL query to display all the NULL values imputed with 0. 
select * from new_cricket;
#select isnull(Charisma,0) from new_cricket;
select coalesce(Charisma,0) from new_cricket;
select *,ifnull(Charisma,0) from new_cricket; 

select ifnull(Charisma,0) from new_cricket;
select ifnull(`Player_Id_[0]`,0) from new_cricket;
select ifnull(`Runs_[0]`,0) from new_cricket;


# Q11. Separate all Player_Id into single numeric ids (example PL1 = 1).
select substring(Player_Id,3) from new_cricket ;




select * from churn1;

#Q13. Write a query to display the rounding of lowest integer value of monthlyservicecharges and rounding of higher integer value of totalamount 
# for those paymentmethod is through Electronic check mode. 

select floor(monthlyservicecharges) ,ceil(Totalamount) from churn1 where PaymentMethod = 'Electronic check';


# Q14. Rename the table churn1 to “Churn_Details”. 
rename table churn1 to Churn_Details;


# Q15. Write a query to create a new column new_Amount that contains the sum of TotalAmount and MonthlyServiceCharges. 
alter table Churn_Details add column new_Amount float;
update Churn_Details set new_Amount = TotalAmount+MonthlyServiceCharges;
select * from Churn_Details limit 5;

# Q16. Rename column new_Amount to Amount. 
alter table Churn_Details rename column new_Amount to Amount;

# Q17. Drop the column “Amount” from the table “Churn_Details”.
alter table Churn_Details drop column Amount;
 
# Q18. Write a query to extract the customerID, InternetConnection and gender 
# from the table “Churn_Details ” where the value of the column “InternetConnection” has ‘i’ 
# at the second position. 

select customerID, InternetConnection,gender from Churn_Details where InternetConnection like '_i%';

# Q19. Find the records where the tenure is 6x, where x is any number. 
select * from Churn_Details where tenure like '6_';



# Q20. Write a query to display the player names in capital letter and arrange in alphabetical order along with the charisma, 
#display 0 for whom the charisma value is NULL.  

select upper(player_name),ifnull(Charisma,0) 
from new_cricket order by upper(player_name) ;


use Bank;
show tables;
desc Bank_Holidays;
#Use bank databse (Inclass assignment 1) 
# Question 13: # 13) Step 1: Insert today’s date details in all fields of Bank_Holidays 
-- Step 2: After step1, perform the below 
-- Postpone Holiday to next day by updating the Holiday field 
insert into Bank_Holidays values(curdate(),current_date(),current_date());
select * from Bank_Holidays;
update Bank_Holidays set Holiday = adddate(Holiday,1);	


# Question 14: # 14) Modify the Start_time data with today’s date in the Bank_Holidays table 
update Bank_Holidays set start_time = curdate();


# Question 15: # 15) Update the End_time with current european time in the Bank_Holidays table. 
update Bank_Holidays set end_time = utc_timestamp();


# Question 7: # 7) How many characters does the Product : ‘PayCard’ stores in the Bank_Inventory table. 
select * from Bank_Inventory;
select length(product) from Bank_Inventory where product = 'PayCard';


# b) How many characters does the Geo_Location field value ‘Delhi-City’ stores in the Bank_Inventory table 
select length(Geo_Location) from Bank_Inventory where Geo_Location = 'Delhi-City';

# Question 19: # 19) Display Holiday field as DD-MM-YYYY format in Bank_holidays table. -- Ex: 10-February-2020 
select date_format(Holiday,"%d-%M-%Y") from Bank_Holidays;

# Question 20: # 20) Display the first five characters of the Geo_location field of Bank_Inventory. 
select substring(Geo_Location,1,5) from Bank_Inventory;