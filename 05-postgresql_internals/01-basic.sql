-- Show PostgreSQL directory and folder where all database files are stored
SHOW data_directory;

-- Show all existing databases and your ids (same name of folder of that database)
SELECT oid, datname
FROM pg_database;

-- Show all files and objects, etc which are related to a database that you query
SELECT *
FROM pg_class;

-- Heap file - contains a collection of data aggregate on blocks
-- Block / page - contains a collection of data aggregate on tuples or rows
-- Tuple / row - a unit of data row of our table

-- INDEX - A tool to speedup some type of querys
  -- How to create a INDEX
  CREATE INDEX ON users (username);
  -- This query above creates a INDEX of our users table username propertie
  CREATE INDEX <your-name-for-index> ON users (username);
  -- The above query is to you create a custom name for your index - We highly
    -- recommend you to keep the default conventions
  -- To delete a INDEX proceed like below:
  DROP INDEX users_username_idx;
