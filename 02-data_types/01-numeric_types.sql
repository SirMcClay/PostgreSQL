-- Little trick to play with numeric types on Postgres pgAdmin
  -- Just launch Query Tool on postgres database and write querys like below

-- This statement forces Postgres to assume that 2.0 must be treated as a integer
  -- the result is 2 as integer
SELECT (2.0::INTEGER);

-- Force overflow on SMALLINT data type and we receive an error
SELECT (999999999999999::SMALLINT);

-- An subtraction using float point numbers assigned as REAL type and receive
  -- an odd precision result
SELECT (1.99999::REAL - 1.99998::REAL);