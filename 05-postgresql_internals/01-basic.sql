-- Show PostgreSQL directory and folder where all database files are stored
SHOW data_directory;

-- Show all existing databases and your ids (same name of folder of that database)
SELECT oid, datname
FROM pg_database;

-- Show all files and objects, etc which are related to a database that you query
SELECT *
FROM pg_class;