-- Select the 3 highest ids
SELECT *
FROM users
ORDER BY id DESC
LIMIT 3;

-- Select from user id 200 a resultset with username and caption from users and
  -- posts tables
SELECT username, caption
FROM users
JOIN posts ON users.id = posts.user_id
WHERE users.id = 200;