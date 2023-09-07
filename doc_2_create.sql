-- customer table creation
create table customer_jim(
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(320),
	phone_number NUMERIC(11)
);

-- movie table creation
create table movie(
	film_id SERIAL primary key,
	runtime_minutes INTEGER,
	mpaa_rating VARCHAR(5),
	genre VARCHAR(30),
	movie_name VARCHAR(50)
);


-- ticket_order table creation
create table ticket_order(
	order_id SERIAL primary key,
	total_tickets INTEGER, 
	price NUMERIC(5,2),
	customer_id INTEGER not NULL,
	foreign KEY(customer_id) references customer_jim(customer_id)
);

-- ticket table creation
create table ticket(
	showtime TIME,
	theater_id INTEGER,
	order_id INTEGER not NULL,
	film_id INTEGER not NULL,
	foreign key(order_id) references ticket_order(order_id),
	foreign key(film_id) references movie(film_id)
);

-- concession_purchase table creation
create table concession_purchase(
	purchase_id SERIAL primary key,
	price NUMERIC(5,2),
	total_items INTEGER,
	customer_id INTEGER,
	foreign key(customer_id) references customer_jim(customer_id)
);

-- concession table creation
create table concession(
	item_id SERIAL,
	item_name VARCHAR(50),
	purchase_id INTEGER,
	foreign key(purchase_id) references concession_purchase(purchase_id)
);

