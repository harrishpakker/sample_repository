use sample;
show tables;
select * from billing;
select *from SalesPeople;
desc SalesPeople;
insert into SalesPeople values (1234,'Harrish','Programmer','America',1234557556,5);

insert into SalesPeople values (1014,'Pakker','Teacher','UK',123,5);

insert into SalesPeople values (4567,'Harrish Pakker','Police','US',45855,3);
alter table SalesPeople add column price varchar(30);

 update SalesPeople set price = '$50.1' where EmployeeNumber = 1001;
  update SalesPeople set price = '$30.16' where EmployeeNumber = 1014;
 update SalesPeople set price = '$40.123' where EmployeeNumber = 1234;
 update SalesPeople set price = '$10.70' where EmployeeNumber = 4567;


alter table SalesPeople add column number_calculation float;
update SalesPeople set number_calculation = PhoneNumber+YearsInPosition;

ALTER TABLE SalesPeople DROP priceyears;

select *,(convert(substring(price,2) , FLOAT))+YearsInPosition as 'NEWCOLUMN' from SalesPeople;

alter table SalesPeople add column priceyears float;
update SalesPeople set priceyears =  (convert(substring(price,2) , FLOAT))+YearsInPosition;

select * from SalesPeople;
select substring(price,2) from SalesPeople;
alter table SalesPeople add column empnumname varchar(50);
update SalesPeople set empnumname =  concat(EmployeeNumber,Name);