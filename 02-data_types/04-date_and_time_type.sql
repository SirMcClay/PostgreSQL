-- FAST RULES TO DATE TYPE
  -- `1980-11-20` -> 20 November 1980
  -- `Nov-20-1980` -> 20 November 1980
  -- `20-Nov-1980` -> 20 November 1980
  -- `1980-November-20` -> 20 November 1980
  -- `November 20, 1980` -> 20 November 1980

-- All this strings will be interpreted for Postgres and stored as DATE
  SELECT ('NOV-20-1980'::DATE); => 1980-11-20
  SELECT ('NOV 20 1980'::DATE); => 1980-11-20
  SELECT ('NOV 20, 1980'::DATE); => 1980-11-20
  SELECT ('1980 NOV 20'::DATE); => 1980-11-20
  SELECT ('1980 november 20'::DATE); => 1980-11-20

-- RULES FOR TIME WITHOUT TIME ZONE
  -- '01:23 AM' -> 01:23, no time zone
  -- '05:23 PM' -> 17:23, no time zone
  -- '20:34' -> 20:34, no time zone

-- Some possible interpretations for TIME type
  SELECT ('01:23'::TIME); -> 01:23:00
  SELECT ('01:23 PM'::TIME WITHOUT TIME ZONE); -> 13:23:00

