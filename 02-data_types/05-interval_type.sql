-- INTERVAL - Time related most like duration of time
  -- 1 day -> 1 day
  -- 1 D -> 1 day
  -- 1 D 1 M 1 S -> 1 day 1 minute 1 second

-- TIP!! Store INTERVAL on a database is not much useful but do calculations
  -- on DATE, TIME, TIMESTAMP are really great and very useful!
  -- And be able to do this kind of calculaions directly on database is fantastic
  -- because we dont need a server side library to do this stuff

-- Some examples
SELECT ('1 day'::INTERVAL); => 1 day
SELECT ('1 D 20 H'::INTERVAL); => 1 day 20:00:00
SELECT ('1 D 20 H 30 M 45 S'::INTERVAL); => 1 day 20:30:45

-- Useful aplications on calculations
SELECT ('1 D 20 H 30 M 45 S'::INTERVAL) - ('1 D'::INTERVAL); => 20:30:45
SELECT 
	('NOV-20-1980 1:23 AM EST'::TIMESTAMP WITH TIME ZONE)
	- 
	('1 D'::INTERVAL); => 1980-11-19 06:23:00+00
SELECT 
	('NOV-20-1980 1:23 AM EST'::TIMESTAMP WITH TIME ZONE)
	- 
	('4 D'::INTERVAL); => 1980-11-16 06:23:00+00
SELECT 
	('NOV-20-1980 1:23 AM EST'::TIMESTAMP WITH TIME ZONE)
	- 
	('NOV-10-1980 5:43 AM PST'::TIMESTAMP WITH TIME ZONE); => 9 days 16:40:00
