-- Q1
select first_name, last_name
from actor 
where last_name = 'Wahlberg';

-- Q2
select count(amount) 
from payment
where amount between 3.99 and 5.99;

-- Q3
select film_id, COUNT(film_id)
from inventory
group by film_id
order by COUNT(film_id) desc;

-- Q4
select count(last_name)
from customer
where last_name = 'William';

-- Q5

select staff_id, count(staff_id)
from rental
group by staff_id
order by COUNT(staff_id) desc;

-- Q6

select COUNT(distinct district)
from address;

-- Q7
select film_id, COUNT(actor_id)
from film_actor
group by film_id
order by COUNT(film_id) desc;

-- Q8
select COUNT(customer_id)
from customer
where last_name like '%es' and store_id = '1';

-- Q9 

select COUNT(amount), amount
from payment
where customer_id between 380 and 430
group by amount
having COUNT(rental_id) > 250;

-- Q10

select COUNT(distinct rating)
from film;

select COUNT(rating), rating
from film
group by rating
order by COUNT(rating) desc;

