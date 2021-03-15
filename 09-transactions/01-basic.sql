-- TRANSACTIONS - Is the feature that permits we execute a number of sequential
  -- querys all of them or none of them (rollback) if something was wrong

-- Lets create a table of accounts to test transaction functionality
CREATE TABLE accounts (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	balance INTEGER NOT NULL
);

-- Create two rows with Gia and Alyson accounts and balances
INSERT INTO accounts (name, balance)
VALUES
	('Gia', 100),
	('Alyson', 100);

-- OPEN A SECOND QUERY TOOL ON PGADMIN

-- NOTE!! - Every query tool is a isolated connection with database therefore
  -- we can run transactions on each panel isolated

-- ON THE FIRST QUERY TOOL
  -- Begin a transaction:
  BEGIN;
  -- Update data
  UPDATE accounts
  SET balance = balance - 50
  WHERE name = 'Alyson';
  -- See if data was changed
  SELECT * FROM accounts;

-- ON THE SECOND QUERY TOOL
  -- Query the data from accounts and you will see that the data remain the original
  SELECT * FROM accounts;

-- ON THE FIRST QUERY TOOL
  -- Update Gia balance adding 50
  UPDATE accounts
  SET balance = balance + 50
  WHERE name = 'Gia';
  -- See the result
  SELECT * FROM accounts;