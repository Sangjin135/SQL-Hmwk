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

-- 5a

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


