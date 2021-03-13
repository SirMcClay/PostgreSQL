-- Just see the query below:
SELECT username, COUNT(*)
FROM users
JOIN (
	SELECT user_id FROM photo_tags
	UNION ALL
	SELECT user_id FROM caption_tags
) AS tags ON tags.user_id = users.id
GROUP BY username
ORDER BY COUNT(*) DESC;

-- The UNION of photo_tags and caption_tags is a recurrent thing and maybe
  -- mean a bad design choice, so with VIEWS we have a tool to try to fix this

-- #1 POSSIBLE FIX - Just create a new table called tags and then insert all 
  -- rows from photo_tags and all rows from caption_tags
  -- for a explanatory purpose see below:
CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  post_id INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
  x INTEGER,
  y INTEGER
);

INSERT INTO tags(created_at, updated_at, user_id, post_id, x, y)
SELECT created_at, updated_at, user_id, post_id, x, y
FROM photo_tags;

INSERT INTO tags(created_at, updated_at, user_id, post_id, x, y)
SELECT created_at, updated_at, user_id, post_id, x, y
FROM caption_tags;

-- DOWNSIDES #1 solution - 
  -- We cant copy the ids from both tables because there are duplicated ids
  -- If we delete both tables after the copy we possible can broke some query
    -- that use these two tables

-- #2 SOLUTION we use a VIEW
  -- A VIEW is simple a fake table that references some rows or data inside 
  -- other tables on our database
  -- We can do any logic or query inside a view and use on any query as a real table
  -- So we create a VIEW to solve problem above:
CREATE VIEW tags AS (
	SELECT id, created_at, user_id, post_id, 'photo_tag' AS type FROM photo_tags
	UNION ALL
	SELECT id, created_at, user_id, post_id, 'caption_tag' AS type FROM caption_tags
);
-- Now we can do our initial query and within that remove the subquery and
  -- replace just with the VIEW tags just like that:
SELECT username, COUNT(*)
FROM users
JOIN tags ON tags.user_id = users.id
GROUP BY username
ORDER BY COUNT(*) DESC;
-- We`ve got the exact same result but without the needs to use subquery or UNION
