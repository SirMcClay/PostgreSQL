-- COALESCE simple returns a FIRST value that is not NULL
SELECT COALESCE(NULL, 5); => 5
SELECT COALESCE(10, 5); => 10

-- Prettie tricky with COALESCE
  -- Add a check if one of other ids are provided never both or none ever one
  -- of the two
Add CHECK of
(
  COALESCE((post_id)::BOOLEAN::INTEGER, 0)
  +
  COALESCE((comment_id)::BOOLEAN::INTEGER, 0)
) = 1

-- TIP: (post_id)::BOOLEAN::INTEGER returns 1 if have a value or NULL if the
  -- value is was NULL