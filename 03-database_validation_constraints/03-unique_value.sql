-- How to handle with unique values on a column

-- Here we insert a duplicate product with the same name of another product
INSERT INTO products (name, department, price, weight)
VALUES ('Shirt', 'Tools', 24, 1);

-- GOTCHA!! We cant alter the column name to UNIQUE while we have duplicated 
  -- names inside our table. First we have to change one of the duplicated values
  -- we test this:
ALTER TABLE products
ADD UNIQUE (name);
-- and got an error

-- You can change the name to eliminate duplicate writing SQL or using pgAdmin
  -- directly

-- Now we apply the cosntraint above. And everytime we try to add a product with
  -- an existing name we got an error
INSERT INTO products (name, department, price, weight)
VALUES ('Shirt', 'Tools', 24, 1);
=> db error
