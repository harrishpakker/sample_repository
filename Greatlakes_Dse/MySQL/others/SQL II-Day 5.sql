use temp;
## Create a table books (book_no, title, author, publication, price, no_of_pages, edition)
## book_no -- primary key
## price -- should be greater than 0
## no_of_pages -- should be greater than 0

CREATE TABLE Books (
Book_no INT PRIMARY KEY,
Title VARCHAR(50),
Author VARCHAR(30),
Publication VARCHAR(50),
Price DECIMAL(8,2) CHECK (Price > 0),
No_of_Pages INT CHECK (No_of_Pages > 0),
Edition INT
);
desc books;
##Error null value in primary key
insert into books(title, author, price) values ('Harry potter', 'jk rowling',3234.55);

## Correct entry
insert into books(book_no, title, author, price) values (1, 'Harry potter', 'jk rowling',3234.55);
## Error -- 0 value for no_of_pages
insert into books values (2,'Wings of fire', 'APJ Kalam', 'dgd', 100.00, 0,1);
##Correct entry
insert into books values (2,'Wings of fire', 'APJ Kalam', 'dgd', 100.00, 200,1);
## Duplicate entry in primary key column 
insert into books values (2,'Stories of grandma', 'S. Murthy', 'dgd', 100.00, 200,1);
## Correct entry
insert into books values (3,'Stories of grandma', 'S. Murthy', 'dgd', 100.00, 200,1);
## Type mismatch
insert into books values (4,'Stories of grandma', 'S. Murthy', 'dgd', 'Hundred', 200,1);
## Correct entry
insert into books values (5,'Stories of grandma', 'S. Murthy', 'dgd', '200.50', 200,1);

## Create members table (mem_id, name, email_id, mobile, address, type)
## mem_id is primary key
## email_id should not be null
## mobile should be unique

create table members (
member_id int primary key,
member_name varchar(30),
email_id varchar(50) not null,
mobile int unique,
address varchar(50),
type varchar(10));

## create table membership (mem_type, deposit_amount, monthly_charges, validity_months)
## mem_type is primary key

create table membership (
type varchar(10) primary key,
deposit_amt decimal(8,2),
monthly_charges decimal(8,2),
validity_in_months int);

alter table members add foreign key(type) references membership(type);

insert into membership values ('Kids plan', 1000, 200,12), ('Gold', 2000,500,24), ('Diamond', 2000,400,36);

insert into members values (1, 'Deepali', 'dee@dfg.com', 12367890,'ddrdgserrg', 'Gold');
## Error due to foreign key
insert into members values (2, 'abc', 'dfs@gd.vxvo',345455435,'sdsdfg','monthly');
## Correct entry
insert into members values (2, 'abc', 'dfs@gd.vxvo',345455435,'sdsdfg','Kids plan');
## Error
delete from membership where type = 'Kids plan';
## Possible
delete from membership where type = 'Diamond';
## error
update membership set type = 'Holiday' where type ='Kids plan';
## on update cascade
alter table members drop foreign key members_ibfk_1;
alter table members add foreign key(type) references membership(type) on update cascade;

update membership set type = 'Holiday' where type ='Kids plan';

Select * from members;

## on delete cascade
alter table members drop foreign key members_ibfk_1;
alter table members add foreign key(type) references membership(type) on update cascade on delete cascade;

delete from membership where type = 'Holiday';

select * from members;

## Inclass solution -- Day 2

-----------------------------------------------------------------
# Dataset Used: website_stats.csv and web.csv
-----------------------------------------------------------------
select * from website_stats;
# Q9. Show day, number of users and the number of users the next day (for all days when the website was used)
SELECT day, no_users,
	LEAD(no_users) OVER(ORDER BY day) no_user_next_day
FROM website_stats;

select * from web;
# Q10. Display the difference in ad_clicks between the current day and the next day for the website 'Olympus'
select day, (ad_clicks - lead(ad_clicks) over(order by day) ) as diff_clicks
from web,website_stats where website_stats.website_id = web.id and web.name = 'olympus';


# Q11. Write a query that displays the statistics for website_id = 3 such that for each row, show the day, the number of users and the smallest number of users ever.
SELECT day, no_users,
	FIRST_VALUE(no_users) OVER(ORDER BY no_users) smallest_num_of_users
FROM website_stats
WHERE website_id = 3;
 ## Solution 2

SELECT day, no_users,
	min(no_users) OVER() smallest_num_of_users
FROM website_stats
WHERE website_id = 3;
# Q12. Write a query that displays name of the website and it's launch date. The query should also display the date of recently launched website in the third column.
SELECT name, launch_date,
	LAST_VALUE(launch_date) OVER
    (ORDER BY launch_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM web;
#### Solution 2
SELECT name, launch_date,
	first_VALUE(launch_date) OVER
    (ORDER BY str_to_date(launch_date,'%d-%m-%Y' ) desc)
FROM web;
desc web;

-----------------------------------------------------------------
# Dataset Used: play_store.csv and sale.csv
-----------------------------------------------------------------
# Q13. Write a query thats orders games in the play store into three buckets as per editor ratings received  
select * from play_store;
SELECT name, genre, editor_rating,
  NTILE(3) OVER (ORDER BY editor_rating DESC) bucket
FROM play_store;

# Q14. Write a query that displays the name of the game, the price, the sale date and the 4th column should display 
# the sales consecutive number i.e. ranking of game as per the sale took place, so that the latest game sold gets number 1. Order the result by editor's rating of the game

select ps.name, s.price, s.date,
	row_number() over(order by date desc) as latest_game_sold_rank
from play_store ps, sale s
where s.game_id=ps.id
order by editor_rating;

# Q15. Write a query to display games which were both recently released and recently updated. For each game, show name, 
#date of release and last update date, as well as their rank
#Hint: use ROW_NUMBER(), sort by release date and then by update date, both in the descending order

select name, released, updated,
	row_number() over(order by released desc, updated desc) as latest
from play_store;


-----------------------------------------------------------------
# Dataset Used: movies.csv, customers.csv, ratings.csv, rent.csv
-----------------------------------------------------------------
select * from movies;
select * from ratings;
# Q16. Write a query that displays basic movie informations as well as the previous rating provided by customer for that same movie 
# make sure that the list is sorted by the id of the reviews.
SELECT r.id, m.title, r.rating,
  	LAG(r.rating) OVER(PARTITION BY m.id ORDER BY r.id) by_customer
FROM ratings r, movies m
WHERE r.movie_id = m.id;


# Q17. For each movie, show the following information: title, genre, average user rating for that movie 
# and its rank in the respective genre based on that average rating in descending order (so that the best movies will be shown first).

WITH subquery AS(
    SELECT m.title, m.genre, AVG(r.rating) as avg
    FROM ratings r, movies m
    WHERE r.movie_id = m.id
    GROUP BY m.title, m.genre
  )
SELECT title, genre, AVG, 
	RANK() OVER(PARTITION BY genre ORDER BY AVG DESC) rank_
FROM subquery;

# Q18. For each rental date, show the rental_date, the sum of payment amounts (column name payment_amounts) from rent 
#on that day, the sum of payment_amounts on the previous day and the difference between these two values.
select * from rent;
WITH subquery AS(
    SELECT rental_date, SUM(payment_amount) AS payment_amounts
    FROM rent
    GROUP BY rental_date
  	ORDER BY rental_date
  )
SELECT rental_date, payment_amounts, LAG(payment_amounts) OVER(), 
payment_amounts-LAG(payment_amounts) OVER() as difference
FROM subquery;



select * from rent;
###################Conversion of string to date when data is imported from CSV #############
desc rent;
update rent set rental_date = str_to_date(rental_date,'%d-%m-%Y');
alter table rent modify rental_date date;

################# Inclass Day 3 #####################


-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 1. Create a table Airline_Details. Follow the instructions given below: 
-- -- Q1. Values in the columns Flight_ID should not be null.
-- -- Q2. Each name of the airline should be unique.
-- -- Q3. No country other than United Kingdom, USA, India, Canada and Singapore should be accepted
-- -- Q4. Assign primary key to Flight_ID
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------
-- Table Airline_Details
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Airline_Details (
  Flight_ID INT NOT NULL,
  Airline VARCHAR(100) NULL UNIQUE,
  Country VARCHAR(50) NULL CHECK (Country IN ('United Kingdom', 'USA', 'India', 'Canada', 'Singapore')),
  Punctuality FLOAT NULL,
  Service_Quality FLOAT NULL,
  AirHelp_Score FLOAT NULL,
  PRIMARY KEY (Flight_ID)
);

SELECT * FROM Airline_Details;
desc airline_details;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 2. Create a table Passengers. Follow the instructions given below: 
-- -- Q1. Values in the columns Traveller_ID and PNR should not be null.
-- -- Q2. Only passengers having age greater than 18 are allowed.
-- -- Q3. Assign primary key to Traveller_ID
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------
-- Table Passengers
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Passengers (
  Traveller_ID VARCHAR(5) NOT NULL,
  Name VARCHAR(50) NULL,
  PNR VARCHAR(10) NOT NULL,
  Flight_ID INT NULL,
  Ticket_Price INT NULL,
  age int check (age>18),
  PRIMARY KEY (Traveller_ID)
);
desc passengers;
SELECT * FROM PASSENGERS;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- Questions for table Passengers:  
-- -- Q3. PNR status should be unique and should not be null.
-- -- Q4. Flight Id should not be null.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

# 3.
ALTER TABLE Passengers MODIFY PNR VARCHAR(10) NOT NULL UNIQUE;
# 4.
ALTER TABLE Passengers MODIFY Flight_ID INT NOT NULL;



