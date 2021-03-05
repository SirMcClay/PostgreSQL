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

-- To remove unique constraint just use this
ALTER TABLE products
DROP CONSTRAINT products_name_key;

-- To set multi column unique constraint do like this
ALTER TABLE products
ADD UNIQUE (name, department);
-- this tie the column uniqueness just if both columns are inserted with the
  -- values equal to a identical name and department row

-- This insert is ok because the duo are not the same of an existing row
INSERT INTO products (name, department, price, weight)
VALUES ('Shirt', 'Housewares', 24, 1);

-- But with this below the table just have a row with this combination of values
  -- for name and department columns and then trown an error
INSERT INTO products (name, department, price, weight)
VALUES ('Shirt', 'Clothes', 24, 1);