-- SCHEMA MIGRATION
  -- Come to help us to solve two big problems
    -- 1 - Changes on DB and API client need to be made on the same time
    -- 2 - When working on a team of engineers we need a way to tie the DB changes
      -- to our code

-- MIGRATION FILE
  -- Can be written in a huge variety of languages
  -- In general a migration file contain basic two different sections
    -- UP (upgrade) - the SQL commands and operations to change the DB
      -- Executed when we APPLY the migration
    -- DOWN (downgrade or rollback) - The rollback for all SQL commands and 
      -- operations made on UP in a backwards manner
      -- Executed when we REVERT the migration
  -- Every project has a bunch of migration files inside of it
    -- On start of a project we have a empty DB and instead run SQL directly
      -- on Postgresql we run the migration file to structure our DB