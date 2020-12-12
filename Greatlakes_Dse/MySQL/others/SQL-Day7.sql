use join_demo;
show tables;
select * from customer;
select * from account;
select * from customer, account;

select * from customer cross join account;
select name from customer1;
select * from customer, account where customer.cust_id = account.cust_id;

select customer.cust_id, name, acct_num from customer, account where customer.cust_id = account.cust_id;

SELECT 
    c.cust_id, name, acct_num
FROM
    customer c,
    account a
WHERE
    c.cust_id = a.cust_id;
    
use temp;
select * from student;
select * from grades;
select * from student, grades;

select * from student, grades where student.roll = grades.roll;
select * from student natural join grades;
use join_demo;

select * from customer natural join account;

select * from customer c join account a where c.cust_id = a.cust_id;

select * from customer join account using (cust_id);

SELECT AC.Acct_Num, AC.Acct_type, IR.Rate Modified_rate, IR.Acct_type Interest_type
FROM   ACCOUNT AC
JOIN INTEREST IR
WHERE IR.RATE >  0.07 AND 	AC.Acct_Type NOT LIKE '%CARDS%';

select * 
from customer c inner join account a
on c.cust_id = a.cust_id; 


use bank;
# Question 1:
# 1) Print customer Id, customer name and average account_balance maintained by each customer for all 
# of his/her accounts in the bank.(8 Rows)
select c.customer_id, customer_name, avg(balance_amount)
from bank_customer c join bank_account a
where c.customer_id = a.customer_id
group by c.customer_id;

select c.customer_id, customer_name, avg(balance_amount)
from bank_customer c inner join bank_account a
on c.customer_id = a.customer_id
group by c.customer_id;


select customer_id, customer_name, avg(balance_amount)
from bank_customer  join bank_account using(customer_id)
group by customer_id;
# Question 2:
# 2) Print customer_id , account_number and balance_amount , 
# condition that if balance_amount is nil then assign transaction_amount  for account_type = "Credit Card"(4 Rows)
select * from bank_account_details;
select customer_id, a.account_number, 
case 
when balance_amount = 0 then transaction_amount
else balance_amount
end as balance
from bank_account_details a join bank_account_transaction t on a.account_number = t.account_number
where account_type = "Credit Card";

# Question 3:
# 3) Print account_number and balance_amount , transaction_amount,Transaction_Date from Bank_Account_Details and 
# bank_account_transaction for all the transactions occurred during march,2020 and april, 2020(12 Rows)
select * from bank_account_transaction;
select account_number, balance_amount, transaction_amount, transaction_date
from bank_account_details join bank_account_transaction using(account_number)
where transaction_date between "2020-03-01" and "2020-04-30";

select a.account_number,balance_amount,transaction_amount,transaction_date
from bank_account_details a inner join bank_account_transaction t
on a.account_number=t.account_number
where transaction_date between "2020-03-01" and "2020-04-30";

select a.account_number,a.balance_amount,t.transaction_amount,t.transaction_date
from bank_account_details a inner join bank_account_transaction t
on a.account_number=t.account_number
where t.transaction_date between "2020-03-01" and "2020-04-30";

select a.account_number,a.balance_amount,t.transaction_amount,t.transaction_date
from bank_account as a inner join bank_account_transaction as t
on a.Account_Number=t.Account_Number
where month(Transaction_Date) in (3,4);



# Question 5:
# 5) Print only the customer id, account_number, balance_amount,transaction_amount ,transaction_date who did transactions 
# during the first quarter. Do not display the accounts if they have not done any transactions in the first quarter.(16 Rows)
select customer_id, a.account_number, transaction_amount, transaction_date
from bank_account_details a join bank_account_transaction t 
where a.account_number= t.account_number and month(transaction_date) in (1,2,3);


# Question 6:
# 6) Print account_number, Event and Customer_message from BANK_CUSTOMER_MESSAGES and Bank_Account_Details to 
# display an “Adhoc" Event for all customers who have  “SAVINGS" account_type account.(8 Rows)
select account_number, event, customer_message
from BANK_CUSTOMER_MESSAGES cross join Bank_Account_Details  
where account_type = "SAVINGS" and event = "adhoc";

join - where
natural join
join -using()
inner join - on

