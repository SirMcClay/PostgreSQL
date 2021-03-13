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

