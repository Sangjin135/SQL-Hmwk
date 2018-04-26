SQL Homework Code

use sakila;
-- 1a
select * from actor;

-- 1b
select concat(first_name," ",last_name) as Actor_Name from actor;

-- 2a
select * from actor
	where first_name like "Joe";
    
-- 2b
select * from actor
	where last_name like "%GEN%";
    
-- 2c
select * from actor
	where last_name like "%LI%"
    order by last_name, first_name;

-- 2d
select country_id, country 
from country
	where country in ('Afghanistan','Bangladesh', 'China');
    
-- 3a
alter table actor
	add column middle_name varchar(15) NOT NULL
    after first_name;

-- 3b
alter table actor
	change column middle_name middle_name blob(10);
    
-- 3c
alter table actor
	drop column middle_name;
    
-- 4a
select last_name, count(*) as Count
from actor
group by last_name;

-- 4b
SELECT last_name, COUNT(*) AS multicount
FROM actor
GROUP BY last_name
HAVING count(*) > 1;

-- 4c
update actor
set first_name = 'Harpo'
where actor_id = 172;

-- 4d
update actor
set first_name = 'Groucho'
where actor_id = 172;

-- 5
create table address

-- 6a
select address.address, address.address_id, staff.first_name, staff.last_name
from staff join address
on staff.address_id = address.address_id;

-- 6b
select staff.first_name, staff.last_name, sum(payment.amount)
from staff join payment
on staff.staff_id = payment.staff_id
group by staff.staff_id;

-- 6c
select film.title, count(film_actor.actor_id) as 'Actor Count'
from film inner join film_actor
on film.film_id = film_actor.film_id
group by film.title;

-- 6d
select film.title, count(inventory.inventory_id) as 'Count'
from film join inventory
on film.film_id = inventory.film_id
where film.title = 'Hunchback Impossible';

-- 6e
select customer.customer_id,customer.first_name, customer.last_name, payment.customer_id, sum(payment.amount)
from customer join payment
on customer.customer_id = payment.customer_id
group by customer.customer_id
order by customer.last_name asc;

-- 7a
select film.title, language.name
from film join language
on film.language_id = language.language_id
where (film.title like 'K%' or film.title like 'Q%') and film.language_id = 1;

-- 7b
select film.title, film.film_id, actor.first_name, actor.last_name, actor.actor_id
from film join film_actor
on film.film_id = film_actor.film_id
join actor
on film_actor.actor_id = actor.actor_id
where film.title = 'Alone Trip';

-- 7c
select customer.first_name, customer.last_name, customer.email, country.country
from customer join address
on customer.address_id = address.address_id
join city
on address.city_id = city.city_id
join country
on city.country_id = country.country_id
where country.country = 'Canada';

-- 7d
select film.title, category.name
from film join film_category
on film.film_id = film_category.film_id
join category
on film_category.category_id = category.category_id
where category.name = 'Family';

-- 7e
select film.title, count(rental.rental_id)
from film join inventory
on film.film_id = inventory.film_id
join rental 
on rental.inventory_id = inventory.inventory_id
group by film.title
order by count(rental.rental_id) DESC;

-- 7f
select customer.first_name, customer.last_name, sum(payment.amount)
from customer join payment
on customer.customer_id = payment.customer_id
group by payment.customer_id
order by customer.last_name Asc;

-- 7g
select store.store_id, city.city, country.country
from store join address
on store.address_id = address.address_id
join city
on city.city_id = address.city_id
join country
on country.country_id = city.country_id;

-- 7h
select category.name, sum(payment.amount) as GrossRevenue
from film join inventory
on inventory.film_id =  film.film_id
JOIN film_category 
ON film_category.film_id = film.film_id
JOIN category 
ON category.category_id = film_category.category_id
JOIN rental 
ON rental.inventory_id = inventory.inventory_id
JOIN payment 
ON rental.rental_id = payment.rental_id
GROUP BY category.name 
ORDER BY sum(payment.amount) DESC 
LIMIT 5;

-- 8a
create view Genre_Dashboard as
select category.name, sum(payment.amount) as GrossRevenue
from film join inventory
on inventory.film_id =  film.film_id
JOIN film_category 
ON film_category.film_id = film.film_id
JOIN category 
ON category.category_id = film_category.category_id
JOIN rental 
ON rental.inventory_id = inventory.inventory_id
JOIN payment 
ON rental.rental_id = payment.rental_id
GROUP BY category.name 
ORDER BY sum(payment.amount) DESC 
LIMIT 5;

-- 8b
select * from Genre_Dashboard;

-- 8c
drop view Genre_Dashboard;



