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
