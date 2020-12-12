create schema product;
use product;
show tables;
-- 1. Update the product price with an decrease in 5% for product id's 2055. (use product schema)
select * from product;
select * from product_category;
update product set product_price = product_price * 0.95 where product_category_id = 2055;
select * from product where product_category_id = 2055;


-- 2. Create sales table with the below column details,
-- i) order_id - 101, 102, 103, 104, 105 --> Primary key
-- ii) order_date - yesterday's date
-- iii) expected_delivery_date - 7 days from order date (use product schema)
-- create table sales 
create table sales (order_id int primary key,order_date date,expected_delivery_date date);
insert into sales (order_id)
values (101),(102),(103),(104),(105);
select * from sales;
update sales set order_date = subdate(current_date(),1);
update sales set expected_delivery_date = adddate(order_date,7);

-- 3. Get only the first 7 characters from the product description (use product schema)
select substring(product_desc,1,7) from product;

-- 4. Get the id, description and price  of products which contain 'TV' in their description (use product schema)
select * from product;
select product_id,product_desc,product_price from product where product_desc like "%tv%";

-- 5. Get the product id and description of product whose length is greater than 10 and also height is less than 5 (use product schema)
select product_id,product_desc,product_price from product where length > 10 and height < 5;

-- 6. Find the products whose category id is the range of 2060 to 2070 and whose total stock is more than 23. (use product schema)
select * from product
where product_category_id between 2060 and 2070 and Quantity_in_stock > 23;


-- 7. For all the products weight, return the smallest integer not less than the weight value (use product schema)
select product_id,weight,ceil(weight),floor(weight)
from product;

show databases;
use sakila;
show tables;
-- 8. List last names of actors and the number of actors who have that last name, but only for names 
-- that are shared by at least two actors (use Sakila schema)
select first_name,last_name from actor a  where actor_id in (select actor_id from actor b where b.last_name = a.last_name and b.actor_id<>a.actor_id);

select last_name,count(*)
from actor group by last_name
having count(*) > 2;

-- 9. display the country_id and country names of the following 
-- countries: Austria, Brazil and Chad (use Sakila schema)
select * from country where country in ("Austria","Brazil","Chad");

-- 10. Find the full name of actors whose last name ends with YD. Sort the records based on the full name 
-- in descending order (use Sakila schema)
select concat(first_name," ",last_name) as full_name from actor where last_name like "%yd" order by full_name desc;


-- 11. Find the highest amount for rental id's (use Sakila schema)
show tables;
select * from payment;
select max(amount) from payment;
select * from rental;

-- 12. Find top three highest amount for rentals (use Sakila schema)
select distinct amount from payment order by amount desc limit 3;

-- 13. Find the fifth highest amount for rentals (use Sakila schema)
select distinct amount from payment order by amount desc limit 4,1;
select distinct amount from payment order by amount desc limit 5;
use sakila;
-- 14. Find out the id's of actor who have performed in more than 40 films (use Sakila schema)
select * from actor;
select * from actor_info;
select * from film_actor;
select actor_id,count(*) from film_actor group by actor_id having count(*) > 40;
select actor_id,count(*) from film_actor group by actor_id having count(*) > 40;

-- 15. Find rental id, rental date and day as rental_date_day in which the customers rented the inventory (use Sakila schema)
select * from rental;
select rental_id,rental_date ,day(rental_date) rental_date_day from rental;

-- 16. Get the film id and title of the film in upper case (use Sakila schema)
select * from film;
select film_id,upper(title) from film;

-- 17. Find the customers who have taken rentals for more than a week (use Sakila schema)
select * from rental;

select  distinct customer_id from rental where datediff(return_date,rental_date) > 7;

-- 18. Delivery cost for the goods is 10% of the total weight. Calculate and display the same. 
-- Note: If a product does not have weight detail, the delivery cost is 0.1$ (use product schema)
use product;
show tables;
select * from product;
select ifnull(weight * 0.1,1) as delivery_cost from product;

-- 19. For every product category find the total quantity in stock (use product schema)
select * from product;
select * from product_category;
select product_category_id ,count(*) from product group by product_category_id;

-- 20. Find the max price, min price and the difference between the maximum and minimum price for a category  (use product schema)
select product_category_id,max(product_price),min(product_price),max(product_price)-min(product_price) difference from product group by product_category_id;


-- 21. How many copies of the film 'DADDY PITTSBURGH' exist in the inventory system? (use Sakila schema)
use sakila;
show tables;
select * from film;
select * from inventory;
select inventory.film_id,count(*) from inventory
join film on film.film_id = inventory.film_id
where title = 'DADDY PITTSBURGH'
group by inventory.film_id ;

-- 22. List the total paid by each customer. List the customers alphabetically by last name
select * from payment;
select * from customer;
select customer_id,sum(amount) from payment group by customer_id;
select p.customer_id,sum(amount),c.last_name
from payment p
join customer c on p.customer_id = c.customer_id
group by p.customer_id
order by c.last_name;

-- 23.  Display the titles of movies starting with the letters K and Q whose language is English.
select * from film;
show tables;
select * from language;
select distinct language_id from film;
select title from film 
join language on language.language_id = film.language_id
where (title like "k%" or title like "q%") and name = 'English';

-- 24.     Display the 3 most frequently rented movies in descending order.
-- Get the movie name and times rented
show tables;
select * from film_list;
select * from sales_by_film_category;
select * from sales_by_store;
select * from inventory;
select * from rental;
select f.title as movie ,count(*)
from film f join inventory i on f.film_id = i.film_id
join rental r on r.inventory_id = i.inventory_id
group by f.title
order by count(*) desc limit 3;

-- 25.     Write a query to display how much business, in dollars, each store brought in.
select * from sales_by_film_category;
select * from sales_by_store;
select * from store;
select s.store_id as 'Store ID', concat(c.city,', ',cy.country) as `Store`, sum(p.amount) as `Total Sales` from payment as p 
join rental as r on r.rental_id = p.rental_id join inventory as i on i.inventory_id = r.inventory_id 
join store as s on s.store_id = i.store_id join address as a on a.address_id = s.address_id 
join city as c on c.city_id = a.city_id join country as cy on cy.country_id = c.country_id group by s.store_id; 
 
