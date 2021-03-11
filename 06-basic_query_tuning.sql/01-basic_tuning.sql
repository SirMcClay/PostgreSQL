-- For tuning we must understand how a query is processed
  -- A query goes through:
    -- STEP 1 - PARSER
      -- Interpret every character inside a query to take a meaning
      -- sees if all are valid keywords and build a query tree - a programaticaly
      -- description of a query you trying to run
    -- STEP 2 - REWRITER
      -- Decompose views into underlying table references - for more performance
      -- purposes
    -- STEP 3 - PLANNER
      -- Take some strategies to run the query and decides which choose and run
      -- focusing in better performance and fastest results
    -- STEP 4 - EXECUTER
      -- Here query actually run!

-- The most important step is PLANNER that will gives us the insight to take a
  -- look of what is the most efficient strategy to run querys

-- THE TOOLS
  -- EXPLAIN - Build a query plan and display info about it
  EXPLAIN
  -- EXPLAIN ANALYZE - Build a query plan, run it, and display info about it
  EXPLAIN ANALYZE

-- EXAMPLE:
EXPLAIN SELECT username, contents
FROM users
JOIN comments ON comments.user_id = users.id
WHERE username = 'Alyson14';

EXPLAIN ANALYZE SELECT username, contents
FROM users
JOIN comments ON comments.user_id = users.id
WHERE username = 'Alyson14';

-- This two similar examples shown us the benchmark for the two types of analises