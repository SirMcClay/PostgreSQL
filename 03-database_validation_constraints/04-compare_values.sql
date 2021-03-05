-- Here we going to constraint compare values using >, <, >=, <=, =

-- We can update our table products inserting this price check
ALTER TABLE products
ADD CHECK (price > 0);
-- GOTCHA!! You cant do this alter if there are a row with column price equal 
  -- or less than 0

-- Now we try to insert a row with price less than zero and we got an error
INSERT INTO products (name, department, price, weight)
VALUES ('Belt', 'House', -99, 1);

-- The same apply to other tests

-- Now we create a new table called orders and implement a multi column check
CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	created_at TIMESTAMP NOT NULL,
	est_delivery TIMESTAMP NOT NULL,
	CHECK (created_at < est_delivery)
);

-- Now try to inser a order where est_delivery is before created_at which broke
  -- our check constraint and surely we got an db error
INSERT INTO orders (name, created_at, est_delivery)
VALUES ('Shirt', '2000-NOV-20 01:00 AM', '2000-NOV-10 01:00 AM');
