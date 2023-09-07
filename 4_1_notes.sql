-- explore data with SELECT ALL
select * from payment;

-- stored procedure example
-- simulate a late fee charge

create or replace procedure latefee(
	customer INTEGER,
	lateFeeAmount Decimal
)
language plpgsql
as $$
begin 
	-- Add a late fee to the customer payment amount
	update payment 
	set amount = amount + lateFeeAmount
	where customer_id = customer;
	
	-- Commit the above statement inside of a transaction
	commit;
end;
$$

-- Calling a stored procedure
call latefee(341,2.00)

select * from payment
where customer_id = 341

-- DELETE OR DROP the new stored procedure 
drop procedure latefee;

-- Stored functions
-- Make a stored function to insert data into the actor table

create or replace function add_actor(
	_actor_id integer, 
	_first_name varchar, 
	_last_name VARCHAR, 
	_last_update TIMESTAMP without TIME ZONE
)
returns void
as $MAIN$
begin 
	insert into actor(actor_id, first_name, last_name, last_update)
	VALUES(_actor_id, _first_name, _last_name, _last_update);
end;
$MAIN$
language plpgsql;

-- Bad way to call the function 
-- CALL add_actor(500, 'Kevin', 'Hart', CURRENT_TIMESTAMP);

--Good Call of function
select add_actor(50011, 'Kevin', 'Hart', NOW()::timestamp);

-- Verify that the new actor has been added

select * from actor
where actor_id > 500

drop function add_actor;