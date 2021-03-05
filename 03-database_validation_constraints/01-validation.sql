-- Create a products table without any validation
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40),
	department VARCHAR(40),
	price INTEGER,
	weight INTEGER
);

-- Insert a product on our table
INSERT INTO products (name, department, price, weight)
VALUES
	('Shirt', 'Clothes', 20, 1);