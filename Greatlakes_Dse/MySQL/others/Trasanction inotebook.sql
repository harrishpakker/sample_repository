use bank;
START TRANSACTION; 
/* 	Check bank balance   */
Select Balance_amount from BANK_ACCOUNT where Account_Number = '4000-1956-2001' ;
/* 	Withdraw money from ATM */
Insert into BANK_ACCOUNT_Transaction values ('4000-1956-2001' ,  -2300.00,  'ATM Withdrawal' , 'CA' , now() ) ;
UPDATE BANK_Account SET    balance_amount  = balance_amount - 2300 WHERE  Account_Number = '4000-1956-2001' ;
/* 	Bank charges 0.2% on withdrawn money */
Insert into  BANK_ACCOUNT_Transaction values ('4000-1956-2001' ,  -2300.00 * 0.02,   'ATM Withdrawal' ,  'CA' , now());
/* 	Update the old balance with new balance. */
Update BANK_ACCOUNT set  balance_amount = balance_amount - 2300 * 0.02  where Account_Number = '4000-1956-2001' ;
COMMIT ;
##-------------------------------------------------------------------------------------------
use temp;
delete from books;
select * from books;
show tables;
rollback;

### --------------------------------------------------------------------------------------

## Savepoints
use bank;
SELECT *
FROM   bank_CUSTOMER 
WHERE  CUSTomer_ID in 
      (123002, 123003 , 123004 );
      
START TRANSACTION;
SAVEPOINT customer_1;
DELETE FROM bank_CUSTOMER WHERE CUSTomer_ID=123004;
SAVEPOINT customer_2;
DELETE FROM bank_CUSTOMER WHERE CUSTomer_ID=123003;
SAVEPOINT customer_3;
DELETE FROM bank_CUSTOMER WHERE CUSTomer_ID=123002;

ROLLBACK TO customer_3;
commit;
SELECT *
FROM   bank_CUSTOMER 
WHERE  CUSTomer_ID in 
      (123002, 123003 , 123004 );
      
      Rollback TO customer_1;  ##Error
rollback;  ## No change
commit;
##----------------------------------------------------------------------------------------
SELECT * FROM bank_CUSTOMER WHERE CUSTomer_ID in ( 123007, 123006, 123005 );


START TRANSACTION;
SAVEPOINT customer_1;
DELETE 
FROM bank_CUSTOMER 
WHERE CUSTomer_ID =123007;
SAVEPOINT customer_2;
DELETE 
FROM bank_CUSTOMER 
WHERE CUSTomer_ID =123006;
SAVEPOINT customer_3;
DELETE 
    FROM bank_CUSTOMER 
    WHERE Customer_Id=123005;
RELEASE SAVEPOINT customer_2;

ROLLBACK  to customer_2 ; ## Error
ROLLBACK  to customer_3 ; ## Error

ROLLBACK TO Customer_1 ; ## Execute
##--------------------------------------------------------------------------
commit;
### Set Transaction

 /* Instance - 1 */

SET TRANSACTION READ WRITE;  

/* 	Check bank balance   */
Select Balance_amount 
from bank_ACCOUNT 
where Account_Number = '4000-1956-2001' ;

/* 	Update balance */
Update bank_ACCOUNT 
set   balance_amount = balance_amount - 2300  
where Account_Number = '4000-1956-2001' ;  ## Allowed

commit;

##----------------------------------------------------

###READ Only : 
SET TRANSACTION READ ONLY ;  

Select Balance_amount 
from bank_ACCOUNT 
where Account_Number = '4000-1956-2001' ;

/* 	Update balance */
Update bank_ACCOUNT 
set   balance_amount = balance_amount - 2300  
where Account_Number = '4000-1956-2001' ;  ### Error



### Session - 1 commit
commit;

SET SESSION TRANSACTION READ WRITE ;

/* In read and write mode */

START Transaction;  

SET SESSION TRANSACTION READ ONLY ; /* Effective from next transaction */

Update Bank_ACCOUNT 
set   
balance_amount = balance_amount - 2300  
where Account_Number = '4000-1956-2001';

/* 	DML is executed */

COMMIT  ; /* End the current transaction */ 

###--------------------------------------------------------------------
/* Second transaction: */

START transaction ;
/* 	Update will not execute */
Update ACCOUNT 
set   
balance = balance - 2300  
where Acct_Num = '4000-1956-2001' ;  ## Error Read only error

##------------------------------------------------------------------
commit;
## -------------------------------------------------------------------
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
Start transaction;

/* 	Check bank balance   */
Select Balance_amount from bank_ACCOUNT where Account_Number = '4000-1956-2001' ;

/* 	Update balance */
Update bank_ACCOUNT set   balance_amount = balance_amount - 2300  where Account_Number = '4000-1956-2001' ;

/* 	Check bank balance   */
Select Balance_amount from bank_ACCOUNT where Account_Number = '4000-1956-2001' ;

## -----------------------------------------------------------------------

###---------------------------------------

##Session 2  -- On command line
Select Balance_amount
from bank_ACCOUNT
where Account_Number = '4000-1956-5698' ; ### Allowed multiple read

Update bank_ACCOUNT 
set   balance_amount = balance_amount - 1500  
where Account_Number = '4000-1956-5698' ; ### Not allowed 
###-----------------------------------
commit;
##________________________________________________________________________________________

SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 

/* 	Check bank balance   */
Select Balance_amount from BANK_ACCOUNT where Account_Number = '4000-1956-2001' ;

/* 	Update balance */
Update BANK_ACCOUNT set   balance_amount = balance_amount - 2300  where Account_Number = '4000-1956-2001' ;

/* 	Check bank balance   */
Select Balance_amount from BANK_ACCOUNT where Account_Number = '4000-1956-2001' ;
###---------------------------------------

##Session 2  -- On command line
SELECT * 
FROM BANK_ACCOUNT 
WHERE Account_Number = '4000-1956-2001';  ##Executed
 ##Session 2  -- On command line
 Update BANK_ACCOUNT 
set   
balance_amount = balance_amount - 2300  
where Account_Number = '4000-1956-2001' ; ## Error ... Delayed wait
###---------------------------------
### Trasanction 1 commit for main session
commit;


###--------------------------------
### Lock demo
## Session 1
START TRANSACTION;

SELECT * FROM bank_ACCOUNT 
WHERE Account_Number = '4000-1956-2001' LOCK IN SHARE MODE;  ### Shared lock 

## ---------------------------------------------------

## --------------------------------
## session 2 -- command line
SELECT * FROM bank_ACCOUNT 
WHERE Account_Number = '4000-1956-2001';  ##Executes

 ## Session 1
UPDATE bank_ACCOUNT 
Set balance_amount = 
balance_amount -  balance_amount * 0.04 
WHERE Account_Number = '4000-1956-2001';  ## Lock gets upgraded to execlusive

## --------------------------------
## session 2 -- command line

UPDATE bank_ACCOUNT 
Set balance_amount = 
balance_amount -  balance_amount * 0.04 
WHERE Account_Number = '4000-1956-2001'; ### -- Delayed responce

## -----------------------------------
 ## Session 1
commit;
