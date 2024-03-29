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

-- Insert a product without a price (may be a problem in future time)
INSERT INTO products (name, department, weight)
VALUES
	('Pants', 'Clothes', 3);

-- Try to set a constraint to price column but GOTCHA!
  -- We cant do this if we have a row with a NULL value inside products table
ALTER TABLE products
ALTER COLUMN price
SET NOT NULL;

-- Update all rows from price NULL to price 9999
UPDATE products
SET price = 9999
WHERE price IS NULL;

-- Now we can run our ALTER TABLE above with no problems

-- Now we try to insert a new product to our products table and will see an error
  -- that our constraint was violated
INSERT INTO products (name, department, weight)
VALUES ('Shoes', 'Clothes', 5);