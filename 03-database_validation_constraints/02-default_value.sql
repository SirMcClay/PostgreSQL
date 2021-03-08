-- Change a column price propertie to have a default value if the value is not
  -- provided on row insert
ALTER TABLE products
ALTER COLUMN price
SET DEFAULT 999;
  -- or:
    -- DEFAULT 'aljdlkaljdl' -> if VARCHAR
    -- DEFAULT true -> if BOOLEAN
    -- DEFAULT '01:45 AM' -> if TIME

-- So insert a product without price
INSERT INTO products (name, department, weight)
VALUES ('Gloves', 'Tools', 1);