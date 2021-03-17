-- SCHEMA MIGRATION - Refers all the time to the structure of a database
  -- add table, add column, change type, change column name, merge column
  -- and so on
  -- TLDR: CHANGE STRUCTURE

-- DATA MIGRATION - Refers all the time to manipulate data in order to move,
  -- merge, delete, copy, transform, and so on
  -- TLDR: MOVE DATA AROUND

-- SO HOW TO DO SCHEMA AND DATA MIGRATION TOGETHER?
  -- STEP 1 - Do the schema changes with migration
  -- STEP 2 - Modify the API and client to work with the old and new schema
  -- STEP 3 - Do the data changes with or without migration - you seriously
    -- can do this with just programming approach
  -- STEP 4 - Update your API and client to work only with new schema
  -- STEP 5 - Get rid of old schema with migration