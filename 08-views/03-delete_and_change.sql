-- If we need to change something on recent_posts VIEW
  -- We can use CREATE OR REPLACE statement
CREATE OR REPLACE VIEW recent_posts AS (
	SELECT *
	FROM posts
	ORDER BY created_at DESC
	LIMIT 15
);
-- Run the query
SELECT * FROM recent_posts;
-- And BAM! we`ve got the 15 recent posts

