-- Create a VIEW for get the 10 most recent posts that is a recurrent query that
  -- can be used on a ton of other querys
CREATE VIEW recent_posts AS (
	SELECT *
	FROM posts
	ORDER BY created_at DESC
	LIMIT 10
);
-- If we do the query:
SELECT * FROM recent_posts;
-- We result on a 10 most recent posts

-- And we can then join with a users table to show the username of these 10
  -- most recent posts
SELECT username
FROM recent_posts
JOIN users ON users.id = recent_posts.user_id;