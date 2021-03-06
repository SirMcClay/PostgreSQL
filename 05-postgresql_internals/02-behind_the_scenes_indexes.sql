-- EXTENSION is a piece of code that gives us some additional functionality
  -- inside Postgresql
  -- PAGEINSPECT gives us functionality that we use to take a look at the data
    -- that is stored on different pages inside of either an index or a heap file
CREATE EXTENSION pageinspect;

-- Shown us the b-tree metapage of an index
SELECT *
FROM bt_metap('users_username_idx');

-- Getting all items of a b-tree from an index and an especific page
SELECT *
FROM bt_page_items('users_username_idx', 3);

-- Shown all information about a user and your ctid
SELECT ctid, *
FROM users
WHERE username = 'Aaliyah.Hintz';