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
	('Gia', 100)
	('Alyson', 100);
