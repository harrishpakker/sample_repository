use HR;
select * from employees;
#select min(salary),first_name from employees;
select count(distinct salary) from employees;
select count(*),job_id from employees group by job_id ;
select count(distinct job_id) from employees;
select sum(salary),job_id from employees group by job_id ;

select max(salary) ,department_id from employees group by department_id;

select sum(salary),avg(salary),month(hire_date),department_id 
from employees 
group by department_id,month(hire_date) ;


use Bank;

create table Bank_Inventory_pricing(Product varchar(15),Quantity int,Price real,purchase_cost decimal(6,2),Estimated_sale_price float,Month integer);

Insert into Bank_Inventory_pricing values ( 'PayCard' , 2 , 300.45, 8000.87, 9000.56, 1 ) ; Insert into Bank_Inventory_pricing values ( 'PayCard' , 2 , 800.45, 5000.80, 8700.56, 1 ) ; Insert into Bank_Inventory_pricing values ( 'PayCard' , 2 , 500.45, 6000.47, 7400.56, 1 ) ; Insert into Bank_Inventory_pricing values ( 'PayPoints' , 4 , 390.87, 7000.67, 6700.56, 2) ; Insert into Bank_Inventory_pricing values ( 'SmartPay' , 5 , 290.69, 5600.77, 3200.12 , 1) ; Insert into Bank_Inventory_pricing values ( 'MaxGain', 3 , NULL, 4600.67, 3233.11 , 1 ) ; Insert into Bank_Inventory_pricing values ( 'MaxGain', 6 , 220.39, 4690.67, NULL , 2 ) ; Insert into Bank_Inventory_pricing values ( 'SuperSave', 7 , 290.30, NULL, 3200.13 ,1 ) ; Insert into Bank_Inventory_pricing values ( 'SuperSave', 6 , 560.30, NULL, 4200.13 ,1 ) ; Insert into Bank_Inventory_pricing values ( 'SuperSave', 6 , NULL, 2600.77, 3200.13 ,2 ) ; Insert into Bank_Inventory_pricing values ( 'SuperSave', 9 , NULL, 5400.71, 9200.13 ,3 ) ; Insert into Bank_Inventory_pricing values ( 'SmartSav', 3 , 250.89, 5900.97, NULL ,1 ) ; Insert into Bank_Inventory_pricing values ( 'SmartSav', 3 , 250.89, 5900.97, 8999.34 ,1 ) ; Insert into Bank_Inventory_pricing values ( 'SmartSav', 3 , 250.89, NULL , 5610.82 , 2 ) ; Insert into Bank_Inventory_pricing values ( 'EasyCash', 3 , 250.89, NULL, 5610.82 ,1 ) ; Insert into Bank_Inventory_pricing values ( 'EasyCash', 3 , 250.89, NULL, 5610.82 , 2 ) ; Insert into Bank_Inventory_pricing values ( 'EasyCash', 3 , 250.89, NULL, 5610.82 , 3 ) ; Insert into Bank_Inventory_pricing values ( "BusiCard" , 1, 3000.99 , NULL, 3500, 3) ; Insert into Bank_Inventory_pricing values ( "BusiCard" , 1, 4000.99 , NULL, 3500, 2) ; 

select * from Bank_Inventory_pricing;

Create table Bank_branch_PL (Branch varchar(15), Banker Int, Product varchar(15) , Cost Int, revenue Int, Estimated_profit Int, month Int);

Insert into Bank_branch_PL values ( 'Delhi', 99101, 'SuperSave', 30060070, 50060070, 20050070, 1 ) ; Insert into Bank_branch_PL values ( 'Delhi', 99101, 'SmartSav', 45060070, 57060070, 30050070, 2) ; Insert into Bank_branch_PL values ( 'Delhi', 99101, 'EasyCash', 66660070, 50090090, 10050077, 3) ; Insert into Bank_branch_PL values ( 'Hyd', 99101, 'SmartSav', 66660070, 79090090, 10050077, 3) ; Insert into Bank_branch_PL values ( 'Banglr', 77301, 'EasyCash', 55560070, 61090090, 9950077, 3) ; Insert into Bank_branch_PL values ( 'Banglr', 77301, 'SmartSav', 54460090, 53090080, 19950077, 3) ; Insert into Bank_branch_PL values ( 'Hyd', 77301, 'SmartSav', 53060090, 63090080, 29950077, 3) ; Insert into Bank_branch_PL values ( 'Hyd', 88201, 'BusiCard', 40030070, 60070080, 10050070,1) ; Insert into Bank_branch_PL values ( 'Hyd', 88201, 'BusiCard', 70030070, 60070080, 25060070,1) ; Insert into Bank_branch_PL values ( 'Hyd', 88201, 'SmartSav', 40054070, 60070080, 20050070, 2) ; Insert into Bank_branch_PL values ( 'Banglr', 99101, 'SmartSav', 88660070, 79090090, 10050077, 3) ; 

select * from Bank_branch_PL;