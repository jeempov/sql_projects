-- customer table for presidents

create table customer_jim(
	customer_id serial primary key,
	first_name VARCHAR(100),
	last_name varchar(100),
	email varchar(200),
	address varchar(150),
	city VARCHAR(150),
	customer_state VARCHAR(100),
	zipcode VARCHAR(50)
);


-- Orders table for Presidents
create table order_jim(
	order_id SERIAL primary key,
	order_date DATE default CURRENT_date,
	amount NUMERIC(5,2),
	customer_id INTEGER,
	foreign key(customer_id) references customer(customer_id)
);

insert into customer_jim(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
VALUES(1, 'George', 'Washington', 'gwash@usa.gov', '3200 Mt Vernon Hwy', 'Mt Vernon', 'VA', '22121');

insert into customer_jim(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
VALUES(2, 'John', 'Adams', 'yaboijohn@usa.gov', '1200 Hancock', 'Quincy', 'MA', '02169');

insert into customer_jim(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
VALUES(3, 'Thomas', 'Jefferson', 'goawayuk@usa.gov', '931 Thomas Jefferson Parkway', 'Charlottesville', 'VA', '02169');

insert into customer_jim(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
VALUES(4, 'James', 'Madison', 'madjames@usa.gov', '11350 Conway', 'Orange', 'VA', '02169');

insert into customer_jim(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
VALUES(5, 'James', 'Monroe', 'jmonroe@usa.gov', '2050 James Monroe Parkway', 'Charlottesville', 'VA', '021569');

select * from customer_jim

-- insert info into order_jim 

insert into order_jim(order_id, amount, customer_id)
VALUES(1,234,56.1);

insert into order_jim(order_id, amount, customer_id)
VALUES(2,78.50,3);

insert into order_jim(order_id, amount, customer_id)
values(3,124.00, 2);

insert into order_jim(order_id, amount, customer_id)
VALUES(4, 65.50, 3);

insert into order_jim(order_id, amount, customer_id)
VALUES(5, 55.50, NULL);

select * from order_jim;

-- Time to do some joins
select first_name, last_name, order_date, amount
from customer_jim
inner join order_jim 
on customer_jim.customer_id = order_jim.customer_id;

-- left join
select first_name, last_name, order_date, amount
from customer_jim
left join order_jim
on customer_jim.customer_id = order_jim.customer_id
where order_date is not null;

-- right join
select first_name, last_name, order_date, amount
from customer_jim
right join order_jim
on customer_jim.customer_id = order_jim.customer_id

-- customer_jim = Table A
-- order_jim = table B

-- full join
select first_name, last_name, order_date, amount
from customer_jim
full join order_jim
on customer_jim.customer_id = order_jim.customer_id;

drop table order_jim;
drop table customer_jim;