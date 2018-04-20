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
select * from country
	where country in ('Afghanistan','Bangladesh', 'China');
    
-- 3a
alter table actor
	add middle_name varchar(15);

-- 3b
alter table actor
	modify column middle_name blob;
    
-- 3c
alter table actor
	drop column middle_name;
    
-- 4a
