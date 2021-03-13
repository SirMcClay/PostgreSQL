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

-- HERE A PLAUSIBLE USE FOR RECURSIVE COMMON TABLE EXPRESSIONS
  -- A query to pick suggestions for people to you follow based on the people
  -- that you just is following and the people that these last is following
  -- In short you have to see at some depth to the people which you follow
  -- and the people that they follow and the people that this last follow and
  -- so on...
-- See the complexity for a recursive solution?

-- The solution is here:
WITH RECURSIVE suggestions(leader_id, follower_id, depth) AS (
		SELECT leader_id, follower_id, 1 AS depth
		FROM followers
		WHERE follower_id = 1000
	UNION
		SELECT followers.leader_id, followers.follower_id, depth + 1
		FROM followers
		JOIN suggestions ON suggestions.leader_id = followers.follower_id
		WHERE depth < 3
)
SELECT DISTINCT users.id, users.username
FROM suggestions
JOIN users ON users.id = suggestions.leader_id
WHERE depth > 1
LIMIT 5;

-- Now the BREAKDOWN line by line
  -- STEP 1: We define our results and working table
    -- Which have 3 column each with leader_id, follower_id and depth
    -- And of course the name of our recursive CTE which is suggestions
  -- STEP 2: We will run our NON-RECURSIVE-STATEMENT - On we take leader_id
    -- follower_id from table followers in which the follower_id is 1000
    -- and assign depth as a fixed value of 1 for all rows and populate result
    -- and working table
  -- STEP 3: Just join leader_id and folloeer_id and depth = 2 from the join of
    -- working table and the followers table and add to our result table where
    -- just stand the first result of our statement
    -- And becouse there is a result we will iterate our recursive query again
    -- And we will of course copy our last result of the last iteration and
    -- copy just this result to our working table after clean-up past data
  -- STEP 4: Now we repeat the process of join working table with followers table
    -- and if the conditional depth is satisfied and generate result will 
    -- take result and repeat the STEP 3
    -- If conditional is not satisfied and no data is returned the recursive
    -- loop terminate and outer query will be executed
  -- STEP 5: Now the result table turn to suggestions table and the outer query
    -- will be executed
    -- We dump the statement rows becouse the depth is 1
    -- And we join table users with suggestions where leader_id is equal to
    -- users.id and return columns users.id and users.username
  
-- IN SHORT: Everytime you need to deal with data hierarchy the recursive CTE is
  -- a possible handy resource to you to solve your problem
