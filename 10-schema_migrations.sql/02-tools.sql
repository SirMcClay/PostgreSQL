-- MIGRATION LIBRARIES
  -- There are a lot of libraries for a lot of languages to deal with migrations
  -- we will use the node-pg-migrate distributed inside npmjs.com

-- ADVISE!! - All migration tools have the ability to write the SQL automatically
  -- for you, but highly AVOID THIS! Always prefer to write your own SQL statements
  -- this becouse the migration libraries has a bunch of internals assumptions
  -- that be faster obscure for you and maybe put you on a dark spot where you
  -- may not have knowledge of whats going on
  -- SO, STICK TO RAW SQL!!

