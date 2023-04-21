use sakila;

-- 1] Which actors have the first name 'Scarlett'.

select*
from actor;

select first_name
from actor
where first_name like "Scarlett";

-- 2] Which actors have the last name 'Johansson'.

select last_name
from actor
where last_name like "Johansson";

-- 3] How many distinct actors' last names are there?

select count(distinct last_name)
from actor;


-- 4] Which last names are not repeated?

select distinct last_name
from actor;

-- 5] Which last names appear more than once?

select last_name,count(*)
from actor
group by last_name
having count(last_name) >1;  

-- 6] Which actor has appeared in the most films?

select count(first_name),first_name
from actor_info
group by first_name;

select film_info,first_name,count(first_name),count(film_info)
from actor_info
group by first_name,film_info
having count(first_name) or count(film_info)>1;

-- 7] What is the average length of all the films in the sakila DB?

select avg(length)as avg 
from film;


-- 8] What is the average length of films by category?

select avg(length(title)) as avgcategory
from film;


-- 9] Which film categories are long? (compare with avg length).

select title, length
from film
where length > (select avg(length) from film );
