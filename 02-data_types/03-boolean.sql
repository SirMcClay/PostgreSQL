-- FAST RULES TO BOOLEAN TYPE
  -- TRUE - true, 'true', 't', 'yes', 'y', 1
  -- FALSE - false, 'false', 'f', 'no', 'n', 0
  -- null - NULL

-- All true
SELECT (true::BOOLEAN);
SELECT ('true'::BOOLEAN);
SELECT ('t'::BOOLEAN);
SELECT ('y'::BOOLEAN);
SELECT (1::BOOLEAN);

-- All false
SELECT (false::BOOLEAN);
SELECT ('false'::BOOLEAN);
SELECT ('f'::BOOLEAN);
SELECT ('n'::BOOLEAN);
SELECT (0::BOOLEAN);