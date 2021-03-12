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