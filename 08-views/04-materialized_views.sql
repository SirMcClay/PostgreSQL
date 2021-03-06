-- MATERIALIZED VIEWS are usefull for run from time to time a specific VERY
  -- SLOW QUERY which store the result for be used without the need to be run
  -- just accessing the last result materialized by the view

-- An EXAMPLE of query that takes some amount of time to run
  -- This query takes 3 tables likes, posts and comments and count the number
  -- of likes on posts and likes on comments per week using a Postgresql function
  -- date_trunc to make possible aggregate date column per week
SELECT
	date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week,
	COUNT(posts.id) AS num_likes_for_posts,
	COUNT(comments.id) AS num_likes_for_comments
FROM likes
LEFT JOIN posts ON posts.id = likes.post_id
LEFT JOIN comments ON comments.id = likes.comment_id
GROUP BY week
ORDER BY week;

-- CREATE A MATERIALIZED VIEW
CREATE MATERIALIZED VIEW weekly_likes AS (
  SELECT
    date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week,
    COUNT(posts.id) AS num_likes_for_posts,
    COUNT(comments.id) AS num_likes_for_comments
  FROM likes
  LEFT JOIN posts ON posts.id = likes.post_id
  LEFT JOIN comments ON comments.id = likes.comment_id
  GROUP BY week
  ORDER BY week
) WITH DATA;
-- Now see the data with more fast execution and result
SELECT * FROM weekly_likes;

-- IMPORTANT NOTE!! - If we DELETE some data from posts or comments the data
  -- stored on materialized view will remain the same until we tell to refresh
  -- the data

-- REFRESH THE DATA ON MATERIALIZED VIEW
  -- This is the way we can update the data stored inside materialized view
REFRESH MATERIALIZED VIEW weekly_likes;