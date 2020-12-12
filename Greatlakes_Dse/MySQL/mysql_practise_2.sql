use temp;
show tables;
select * from student;
insert into student values (103,'Harrish',80,'a@gmail.com','M');
insert into student values (104,'Pakker',80,'b@gmail.com','M');
insert into student values (105,'Qwerty',30,'c@gmail.com','F');
select sname,grad_marks from student where gender = 'M' 
union
select sname,grad_marks from student where grad_marks > 30 ;

select sname,grad_marks from student where gender = 'M' or grad_marks > 50 ;

select 5+7 as 'result';

select greatest(5,7,9); 

select round(4.4);

select char(67);

select insert ("great learning",6,0,"is");

select current_date();
select dayname(current_date());

select curdate();
select coalesce(5,10,'abc');
select now();