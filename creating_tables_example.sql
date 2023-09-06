-- Primary Keys can't be empty or duplicated
CREATE TABLE customer_brandon(
	customer_id SERIAL PRIMARY key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	billing_info VARCHAR(150)
);

-- Seller Table creation
CREATE TABLE seller_brandon(
	seller_id SERIAL PRIMARY KEY,
	brand_name VARCHAR(150),
	contact_number VARCHAR(15),
	address VARCHAR(150)
);

-- inventory table creation
CREATE TABLE inventory_brandon(
	upc SERIAL PRIMARY KEY,
	product_amount INTEGER
);

-- order table creation
CREATE TABLE order_brandon(
	order_id SERIAL PRIMARY KEY,
	order_date DATE DEFAULT CURRENT_DATE,
	sub_total NUMERIC(8,2),
	total_cost NUMERIC(10,2),
	upc INTEGER NOT NULL, -- NOT NULL means this can't be empty
	FOREIGN KEY(upc) REFERENCES inventory_brandon(upc)
);

-- product table creation
CREATE TABLE product_brandon(
	item_id SERIAL PRIMARY KEY,
	amount NUMERIC(5,2),
	prod_name VARCHAR(100),
	seller_id INTEGER NOT NULL,
	upc INTEGER NOT NULL,
	FOREIGN KEY(seller_id) REFERENCES seller_brandon(seller_id),
	FOREIGN KEY(upc) REFERENCES inventory_brandon(upc)
);

-- cart table creation
CREATE TABLE cart_brandon(
	cart_id SERIAL PRIMARY key,
	customer_id INTEGER NOT NULL,
	order_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer_brandon(customer_id),
	FOREIGN KEY(order_id) REFERENCES order_brandon(order_id)
);