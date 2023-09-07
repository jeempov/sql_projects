insert into customer_jim(
	first_name,
	last_name,
	email,
	phone_number
)VALUES(
	'Jebidiah',
	'Cornwallace',
	'jebcorn@aol.com',
	1234567890
);

insert into movie(
	runtime_minutes,
	mpaa_rating,
	genre,
	movie_name
)VALUES(
	142,
	'R',
	'Prison Drama',
	'Shawshank Redemption'
);

insert into ticket_order(
	total_tickets,
	price,
	customer_id
)VALUES(
	3,
	51,
	1
);

insert into ticket(
	showtime,
	theater_id,
	order_id,
	film_id
)VALUES(
	'15:15:00',
	11,
	1,
	1
);

insert into concession_purchase(
	price,
	total_items,
	customer_id
)VALUES(
	20,
	1,
	1
);

insert into concession(
	item_name,
	purchase_id
)VALUES(
	'small popcorn',
	1
);