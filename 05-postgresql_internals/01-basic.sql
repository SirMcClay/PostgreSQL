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

