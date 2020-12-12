use sample;
show tables;
drop table student;
create table student(id int,name varchar(30),marks int default 100);
insert into student values(1,'harrish',30);
insert into student values(2,'pakker',10);
insert into student values(3,'jasmine',11);
insert into student values(4,'andrew',33);
insert into student(id,name) values(5,'messi');
(select max(id) from student);
insert into student values((select max(id) from student)+1,'messi',50);
INSERT INTO student (id, name, marks)
SELECT MAX(id) + 1, 'messi', 50
FROM student;
commit;
select * from student;
SELECT MAX(id) + 1, 'messi', 50
FROM student;
desc student;
delete from student
order by id desc limit 1;
rollback;
use inclass;
select * from web;
select * from website_stats;
select * from web where id in 
(select website_id from website_stats where ad_clicks < 220 or no_users like '25500');

select * from website_stats where no_users like '25500';
select concat(day,'    ',no_users) from website_stats;