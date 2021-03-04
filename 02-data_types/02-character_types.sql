-- RULES FOR CHARACTER TYPES
  -- CHAR(5) - Store some characteres, length will always be 5 even if PG has to
    -- insert spaces
  -- VARCHAR - Store any length of string
  -- VARCHAR(40) - Store a string up to 40 characters automatically remove
    -- extra characters
  -- TEXT - Store any length of string

-- CHAR(N) - Store 'l  ' and 'llsjlfjsklfjs'
  SELECT ('l'::CHAR(3));
  SELECT ('llsjlfjsklfjs'::CHAR(3));