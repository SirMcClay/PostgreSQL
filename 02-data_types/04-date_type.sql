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