-- Create a VIEW for get the 10 most recent posts that is a recurrent query that
  -- can be used on a ton of other querys
CREATE VIEW recent_posts AS (
	SELECT *
	FROM posts
	ORDER BY created_at DESC
	LIMIT 10
);

