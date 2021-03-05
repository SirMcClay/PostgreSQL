-- INTERVAL - Time related most like duration of time
  -- 1 day -> 1 day
  -- 1 D -> 1 day
  -- 1 D 1 M 1 S -> 1 day 1 minute 1 second

-- Some examples
SELECT ('1 day'::INTERVAL); => 1 day
SELECT ('1 D 20 H'::INTERVAL); => 1 day 20:00:00
SELECT ('1 D 20 H 30 M 45 S'::INTERVAL); => 1 day 20:30:45