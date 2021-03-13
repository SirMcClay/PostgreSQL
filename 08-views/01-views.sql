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