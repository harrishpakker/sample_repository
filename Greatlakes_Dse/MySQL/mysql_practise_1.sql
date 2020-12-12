create database temp;
show databases;
use temp;
create table customer ( firstname varchar(20),lastname varchar(20),custid int,country varchar(20));
insert into customer values ('harrish','pakker',1133,'India');
select * from customer;
insert into customer (firstname,lastname) values ('harrish','pakker');
insert into customer values 
('abc','xyz',1133,'India'),
('xyz','abc',1133,'India');
update customer set firstname = 'harrish' where firstname = 'xyz';
delete from customer where firstname = 'abc';