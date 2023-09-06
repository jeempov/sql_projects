insert into customer_brandon(
	customer_id,
	first_name,
	last_name,
	address,
	billing_info
)VALUES(
	1,
	'Brandon',
	'Apol',
	'555 Circle Dr Chicago, IL 60614',
	'4242-4242-4242-4242 623 05/20'
);

-- Seller data
insert into seller_brandon(
	seller_id,
	brand_name,
	contact_number,
	address
)VALUES(
	1,
	'Coding Temple LLC',
	'773-5550-4490',
	'222 W Ontario St Chicago, IL'
);


-- Inventory data
insert into inventory_brandon(
	upc,
	product_amount
)VALUES(
	1,
	20
);

-- Product data
insert into product_brandon(
	item_id,
	amount,
	prod_name,
	seller_id,
	upc
)VALUES(
	1,
	20.00,
	'Python 101',
	1,
	1
);

--order data
insert into order_brandon(
	order_id,
	sub_total,
	total_cost,
	upc
)VALUES(
	1,
	40.00,
	43.50,
	1
);

--cart data
insert into cart_brandon(
	cart_id,
	customer_id,
	order_id
)VALUES(
	1,
	1,
	1
);

drop table cart_brandon

select * from cart_brandon

alter table customer_brandon 
add column eye_color VARCHAR(10)

select * from customer_brandon

