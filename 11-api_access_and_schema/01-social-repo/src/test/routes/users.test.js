const request = require('supertest');
const buildApp = require('../../app');
const UserRepo = require('../../repos/user-repo');
const pool = require('../../pool');

const { randomBytes } = require('crypto');
const { default: migrate } = require('node-pg-migrate');
const format = require('pg-format');

beforeAll(() => {
	// Randomly generating a role name to connect to PG as
	const roleName = 'a' + randomBytes(4).toString('hex');

	// Connect to PG as usual
	await pool.connect({
		host: 'localhost',
		port: 5432,
		database: 'socialnetwork-test',
		user: 'postgres',
		password: 'postgres',
	});

	// Create a new role
	await pool.query(format(
		'CREATE ROLE %I WITH LOGIN PASSWORD %L;', roleName, roleName
	));

	// Create a schema with the same name
	await pool.query(format(
		'CREATE SCHEMA %I AUTHORIZATION %I;', roleName, roleName
	));

	// Disconnect entirely from PG
	await pool.close();

	// Run our migrations in the new schema
	await migrate({
		schema: roleName,
		direction: 'up',
		log: () => { },
		noLock: true,
		dir: 'migrations',
		databaseUrl: {
			host: 'localhost',
			port: 5432,
			database: 'socialnetwork-test',
			user: roleName,
			password: roleName
		}
	})

	// Connect to PG as the newly created row
	await pool.connect({
		host: 'localhost',
		port: 5432,
		database: 'socialnetwork-test',
		user: roleName,
		password: roleName,
	})

});

afterAll(() => {
	return pool.close();
});

it('create a user', async () => {
	const startingCount = await UserRepo.count();
	// expect(startingCount).toEqual(0);

	await request(buildApp())
		.post('/users')
		.send({
			username: 'testuser',
			bio: 'test bio',
		})
		.expect(200);

	const finishCount = await UserRepo.count();
	expect(finishCount - startingCount).toEqual(1);
});
