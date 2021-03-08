-- COALESCE simple returns a FIRST value that is not NULL
SELECT COALESCE(NULL, 5); => 5
SELECT COALESCE(10, 5); => 10