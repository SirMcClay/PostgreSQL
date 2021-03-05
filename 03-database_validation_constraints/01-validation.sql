-- Create a products table without any validation
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40),
	departament VARCHAR(40),
	price INTEGER,
	weight INTEGER
);

