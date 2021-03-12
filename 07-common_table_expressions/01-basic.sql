-- Lets get an query to solve this need:
  -- Show the username and date of creation from tags of all users that was
  -- created before 2010-01-07
SELECT username, tags.created_at
FROM users
JOIN (
	SELECT user_id, created_at
	FROM caption_tags
	UNION ALL
	SELECT user_id, created_at
	FROM photo_tags
) AS tags
ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';

-- Here we have a problem that is a big UNION subquery inside our JOIN that
  -- turn dificult to us to understand whats going on fast enough

-- So COMMON TABLE EXPRESSION is a fashin way to name a subquery and use that
  -- as another table for simplify the understand for us and another engineer
  -- Take a look:
WITH tags AS (
	SELECT user_id, created_at
	FROM caption_tags
	UNION ALL
	SELECT user_id, created_at
	FROM photo_tags
)
SELECT username, tags.created_at
FROM users
JOIN tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';

-- HUH!! Way more clear!

-- RULES:
  -- DEFINED with the use of keyword "WITH" berofe the main query
  -- PRODUCES a table that we can refer to anywhere else
  -- Can be used on TWO FORMS
    -- Simple used to make a query more easier to understand
    -- Recursive form used to write queries that are otherwise impossible to
      -- write

-- NOTE ABOUT PERFORMANCE:
  -- If you use EXPLAIN on the first and the second (with CTE) querys you will
  -- see that thet strategy planner to execute is the same. In other words
  -- the CTE have no impact over performance is really just for easier read
  -- and understand about the querys syntax