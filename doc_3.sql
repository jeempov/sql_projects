-- SQL DOCUMENT 3

--1. List all customers who live in Texas (use JOINs)

select customer_id, first_name, last_name, address.district
from customer 
inner join address
on address.address_id = customer.address_id 
where district = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full Name

select payment.customer_id, payment.amount, CONCAT(first_name, ' ', last_name) as full_name
from customer
inner join payment
on payment.customer_id = customer.customer_id
where payment.amount > 6.99
order by payment.amount ASC;

--3. Show all customers names who have made payments over $175(use subqueries)

select payment.customer_id, payment.amount, CONCAT(first_name, ' ', last_name) as full_name
from customer
inner join payment
on payment.customer_id = customer.customer_id
where payment.customer_id in (
	select customer_id 
	from payment
	where payment.amount > 175
)
order by payment.amount DESC;

--4. List all customers that live in Nepal (use the city table) 
--customer.address_id -> address.address id 
--address.city_id -> city.city_id
--city.country_id -> country.country

select customer.first_name, customer.last_name, country
from customer 
inner join address
on address.address_id = customer.address_id 
inner join city
on address.city_id = city.city_id
inner join country
on city.country_id = country.country_id
where country = 'Nepal';

--5. Which staff member had the most transactions?

select COUNT(payment.staff_id), first_name 
from payment 
full join staff 
on payment.staff_id = staff.staff_id
group by staff.first_name
order by count desc;

--6. How many movies of each rating are there?

select rating, COUNT(*)
from film
group by rating
order by rating asc;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

select CONCAT(first_name, ' ', last_name) as full_name, max(payment.amount) as max_amount
from customer
inner join payment
on payment.customer_id = customer.customer_id
where payment.customer_id in (
	select customer_id 
	from payment
	where payment.amount > 6.99
)
group by full_name
order by max_amount DESC;

--8. How many free rentals did our stores give away?

select COUNT(amount) as free_rentals
from payment 
where amount < 0;