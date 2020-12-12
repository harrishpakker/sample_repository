############################################ Questions ############################################
# Question 1:
# 1) Print customer Id, customer name and average account_balance maintained by each customer for all 
# of his/her accounts in the bank.(8 Rows)
select * from BANK_CUSTOMER;
select * from BANK_ACCOUNT;
select * from BANK_ACCOUNT_TRANSACTION;
select * from Bank_Account_Relationship_Details;
select * from Bank_Account_Details;
show tables;


select BANK_CUSTOMER.customer_id, BANK_CUSTOMER.customer_name,avg(Balance_amount) 
from BANK_CUSTOMER 
join BANK_ACCOUNT 
on BANK_CUSTOMER.customer_id = BANK_ACCOUNT.Customer_id 
group by BANK_CUSTOMER.customer_id,BANK_CUSTOMER.customer_name; 


# Question 2:
# 2) Print customer_id , account_number and balance_amount , 
# condition that if balance_amount is nil then assign transaction_amount  for account_type = "Credit Card"(4 Rows)
show tables;
select * from BANK_ACCOUNT limit 3;
select * from BANK_ACCOUNT_TRANSACTION limit 3;
select * from Bank_Account_Details limit 3;
select b.Customer_id,t.Account_Number,Balance_amount,
case
when Balance_amount = 0 then Transaction_amount
end as balance_amount
from Bank_Account_Details b
join BANK_ACCOUNT_TRANSACTION t
on b.Account_Number = t.Account_Number
where Account_type = "Credit Card";

# Question 3:
# 3) Print account_number and balance_amount , transaction_amount,Transaction_Date from Bank_Account_Details and 
# bank_account_transaction for all the transactions occurred during march,2020 and april, 2020(12 Rows)
select Bank_Account_Details.Account_Number,Balance_amount,Transaction_amount,Transaction_Date
from Bank_Account_Details
join BANK_ACCOUNT_TRANSACTION 
on Bank_Account_Details.Account_Number = BANK_ACCOUNT_TRANSACTION.Account_Number
where Transaction_Date between '2020-03-01' and '2020-04-30';

# Question 4:
# 4) Print all of the customer id, account number,  balance_amount, transaction_amount , Transaction_Date 
# from bank_customer, Bank_Account_Details and bank_account_transaction tables where excluding 
# all of their transactions in march, 2020  month (22 Rows)
select Customer_id, Account_Number, Balance_amount, Transaction_amount, Transaction_Date
from Bank_Account_Details 
left join BANK_CUSTOMER using (Customer_id)
left join BANK_ACCOUNT_TRANSACTION using (Account_Number)
where month(Transaction_Date) <> 3; -- 13 rows

# Question 5:
# 5) Print only the customer id, account_number, balance_amount,transaction_amount ,transaction_date who did transactions 
# during the first quarter. Do not display the accounts if they have not done any transactions in the first quarter.(16 Rows)
select Customer_id, Account_Number, Balance_amount, Transaction_amount, Transaction_Date
from Bank_Account_Details 
join BANK_ACCOUNT_TRANSACTION 
using (Account_Number)
where month(Transaction_Date) < 4; 

# Question 6:
# 6) Print account_number, Event and Customer_message from BANK_CUSTOMER_MESSAGES and Bank_Account_Details to 
# display an “Adhoc" Event for all customers who have  “SAVINGS" account_type account.(8 Rows)
select account_number, event, customer_message
from BANK_CUSTOMER_MESSAGES join Bank_Account_Details
where account_type = 'SAVINGS' and event = 'adhoc';

# Question 7:
# 7) Print all Customer_id, Account_Number, Account_type, and display deducted balance_amount by  
# subtracting only negative transaction_amounts for Relationship_type =
#  "P" ( P - means  Primary , S - means Secondary ) .(27 Rows)
select Customer_id,Account_Number,Account_type,Balance_amount - (-Transaction_amount) as deducted_balance
from Bank_Account_Details
join BANK_ACCOUNT_TRANSACTION
using (Account_Number)
where Relationship_type = 'P' and Transaction_amount<0; -- 11 rows

# Question 8:
# a) Display records of All Accounts , their Account_types, the transaction amount.
# b) Along with first step, Display other columns with corresponding linking account number, account types (15 Rows)
show tables;
select Account_Number,Account_type,Transaction_amount
from Bank_Account_Details
left join BANK_ACCOUNT_TRANSACTION
using(Account_Number) ;

select ba.Account_Number,ba.Account_type,Transaction_amount,Linking_Account_Number
from Bank_Account_Details ba
join BANK_ACCOUNT_TRANSACTION bt
using(Account_Number) 
left join Bank_Account_Relationship_Details br
on bt.Account_Number = br.Linking_Account_Number ;


Error Code: 1052. Column 'Account_Number' in field list is ambiguous

# Question 9:
# a) Display records of All Accounts , their Account_types, the transaction amount.
# b) Along with first step, Display other columns with corresponding linking account number, account types 
# c) After retrieving all records of accounts and their linked accounts, display the  
# transaction amount of accounts appeared  in another column.(26 Rows)

# Question 10:
# 10) Display all saving account holders have “Add-on Credit Cards" and “Credit cards" (3 Rows)

# Question 11:
# 11)  Display  records of “SAVINGS” account linked with “Credit cards" account_type and its credit
# aggregate sum of transaction amount. (1 Row)

# Ref: Check linking relationship in bank_transaction_relationship_details.
        # Check transaction_amount in bank_account_transaction. 

# Question 12:
# 12) Display all type of “Credit cards”  accounts including linked “Add-on Credit Cards" 
# type accounts with their respective aggregate sum of transaction amount. (2 Rows)

# Ref: Check linking relationship in bank_transaction_relationship_details.
        # Check transaction_amount in bank_account_transaction. 

# Question 13:
# 13) Display “SAVINGS” accounts and their corresponding aggregate sum of transaction amount 
# of all recurring deposits (2 Rows)

# Question 14:
# 14) Display recurring deposits and their transaction amounts in  Feb 2020  along with 
# associated SAVINGS account_number , balance. (2 Rows)

# Question 15:
# 15) Compare the aggregate sum transaction amount of current month versus aggregate transaction 
# with previous months.Display account_number, transaction_amount , 
-- sum of current month transaction amount ,
-- current month transaction date , 
-- sum of previous month transaction amount , 
-- previous month transaction date.(19 Rows)
 
# Question 16:
# 16) Display individual accounts absolute transaction of every next month is greater than the previous months .(16 Rows)
 
# Question 17:
# 17) Display the customer names who have all three account types - 
# savings, recurring and credit card account holders.(1 Row)

# Question 18:
# 18) Display savings accounts and its corresponding Recurring deposits transactions are more than 4 times.(1 Row)

# Question 19:
# 19) Display savings accounts and its recurring deposits account with their aggregate 
# transactions per month occurs in 3 different months.(1 Row)

# Question 20:
# 20) Find the no. of transactions of credit cards including add-on Credit Cards(3 Rows)
	




