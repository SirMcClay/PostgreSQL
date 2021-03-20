-- SCHEMAS - Are more like folders in a operate system to organize and isolate
  -- the database instances
  -- Every databasde has your own default schema called PUBLIC
  -- Each schema can have its own separate copy of a table

  -- CREATE A SCHEMA
  CREATE SCHEMA test;

  -- CREATE A TABLE INSIDE A SPECIFIC SCHEMA
  CREATE TABLE test.users (
    id SERIAL PRIMARY KEY,
    username VARCHAR
  );

  -- INSERT DATA INSIDE OUR USERS TABLE ON OUR TEST SCHEMA
  INSERT INTO test.users (username)
  VALUES
    ('alex'),
    ('lsdjfskldfjslkj');

  -- SELECT ALL DATA FROM OUR TEST SCHEMA
  SELECT * FROM test.users;

  -- SEARCH PATH
    -- Is a Postgres variable to tell the database on which schema will search
    -- the data when the user runs a statement 
    -- By default this value points to $USER variable that is the current user
    -- connected to the database and see if exists a schema with this name,
    -- if exists will prefer connect with this user schema, if not, will connect
    -- in the default PUBLIC schema
  -- TO PULL THE VARIABLE RUN:
  SHOW search_path;
  -- will by default return:
  "$user", public

  -- CHANGE SEARCH PATH 
    -- We can change the search path to tell the Postgres to connect first to
    -- schema which we choose
  SET search_path TO test, public;
  -- here we set the search path to try to connect first to test schema if cant
  -- then connect to public
  -- And now we can SELECT rows from users directly without call for the schema
  SELECT * FROM users;
  -- Will return data from table users inside the test schema