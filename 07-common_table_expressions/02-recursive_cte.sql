-- COUPLE NOTES
  -- Recursive CTE is EXTREMALLY DIFFERENT from the simple one
  -- Very useful anytime you have a tree or graph-type data structure
  -- Must user UNION keyword (simple CTE dont have to use everytime)
  -- THIS IS SUPER ADVANCED - IF YOU JUST KNOW THAT THIS EXIST IS GOOD ENOUGH

-- A simple example:
WITH RECURSIVE countdown(val) AS (
	SELECT 10 AS val
	UNION
	SELECT val - 1 FROM countdown WHERE val > 1
)
SELECT *
FROM countdown;
-- Well this just count from the value attributed to val down to 1 just this

-- EXPLAINING
  -- The "SELECT 10 AS val" is a initial, non recursive query
    -- above the UNION
  -- The "SELECT val - 1 FROM countdown WHERE val > 1" is the recursive query
    -- below the UNION
  -- On backstage Postgresql creates two tables RESULT and WORKING tables and 
    -- set the columns of them with the values set on first query line inside
    -- the parentesis like see val in "WITH RECURSIVE countdown(val)"
  -- On our example "couuntdown" will act like a auxiliar table and "val" like
    -- iterative value on a for loop
  -- The recursive query will execute with "val" until the condition is not
    -- true and then will execute the next query showing the result
  -- This recursive CTE is more like a for loop in the world of SQL