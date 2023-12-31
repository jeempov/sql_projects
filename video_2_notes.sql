-- Hello World SQL query, SELECT all records from the actor table
select * from actor;

-- Query for first_name and last_name in the actor table
select first_name, last_name
from actor;

-- Query for a first_name that equals Nick using the WHERE clause

select first_name, last_name
from actor
where first_name = 'Nick';

-- Query for a first_name that is equal to Nick using the LIKE and WHERE clauses
select first_name, last_name
from actor
where first_name like 'Nick';

-- Query for all first_name data that starts with a J using LIKE and WHERE -- using a wildcard, wildcard includes all possible values after 
select first_name, actor_id
from actor
where first_name like 'J%';

-- Query for all first_name data that starts with K and has two letters after the K using LIKE and WHERE clauses using underscore (underscore ensures it has at least the amount of underscores values)
select first_name, last_name, actor_id 
from actor
where first_name like 'K__';

-- Query for all first_name data that starts with a K and ends with th
--using LIKE and WHERE and using BOTH wildcard and underscore
select first_name, last_name, actor_id
from actor
where first_name like 'K__%';

-- Comparing operators are:
-- Greater than (>)
-- Less than <
-- Greater than or equal to >=
-- Less than or equal to <=
-- Not equal <>

-- Explore Data with SELECT all query (specific to changing into a new table)
select * 
from payment;

-- Query for data that shows customer who paid an amount GREATER than $2
select customer_id, amount
from payment
where amount > 2.00;

-- Query for data that shows customers who paid an amount LESS than $7.99
select customer_id, amount
from payment
where amount < 7.99;

-- Query for data that shows customers who paid
-- an amount LESS than or EQUAL to $7.99

SELECT customer_id, amount
FROM payment 
WHERE amount <= 7.99;

-- Query for data that shows customers who paid an amount GREATER than or EQUAL to 2.00 in ASCENDING order
select customer_id, amount
from payment
where amount >= 2.00
order by amount asc;

-- Query for the data that shows customers who paid
-- an amount BETWEEN 2.00 and 7.99
-- Using the BETWEEN with the AND clause
select customer_id, amount
from payment
where amount between 2.00 and 7.99;

-- Query for data that shows customers who paid 
-- an amount NOT EQUAL to 0.00
-- Ordered in DESCENDING order
select customer_id, amount
from payment
where amount <> 0.00
order by amount desc;

-- SQL Aggregations: SUM, AVG, COUNT, MIN, MAX

-- Query to display the sum of amounts paid that are greater 
select SUM(amount)
from payment 
where amount > 5.99;

-- Query to display the average of amounts paid that are greater than 5.99
select AVG(amount)
from payment
where amount > 5.99;

-- Query to display the count of amounts paid that greater than 5.99
select COUNT(amount) -- you can add AS (something) to rename the returned column
from payment
where amount > 5.99;

-- Query to display the count of unique amounts paid that are greater than 5.99
select COUNT(distinct amount)
from payment 
where amount > 5.99;

-- Query to display minimum amount greater than 7.99
select MIN(amount) as Min_Num_Payments
from payment
where amount > 7.99;

-- Query to display max amount greater than 7.99
select MAX(amount) as Max_Num_Payments
from payment
where amount > 7.99;

--Query to display all amounts (as a demo of groupby)
select amount
from payment
where amount = 7.99;

-- Query to display different amounts grouped together 
-- and count the amounts, and ordered by ascending (default)
select amount, COUNT(amount)
from payment
group by amount
order by amount;

-- Query to display customer_ids with the summed amount for each customer_id
select customer_id, SUM(amount)
from payment
group by customer_id 
order by SUM(amount) desc;

-- query to display customer_ids with the amounts for each customer id, one after another
-- separate example of group by
select customer_id, amount
from payment
group by amount, customer_id 
order by customer_id desc;

-- query to explore the data inside of the customer table
select * from customer; 

-- query to display customer IDs that show up more than 0 times
-- group by the customer's email
select COUNT(customer_id), email
from customer 
where email like 'j__.w%'
group by email 
having COUNT(customer_id) > 0;