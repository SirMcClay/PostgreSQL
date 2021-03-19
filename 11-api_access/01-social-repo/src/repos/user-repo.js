const pool = require('../pool');
const toCamelCase = require('./utils/to-camel-case');

class UserRepo {
	static async find() {
		const { rows } = await pool.query('SELECT * FROM users;');

		return toCamelCase(rows);
	}

	static async findById(id) {
		// WARNING! REALLY BIG SECURITY ISSUE!
		// SOLVED WITH PG PREPARATION
		const { rows } = await pool.query('SELECT * FROM users WHERE id = $1;', [
			id,
		]);

		return toCamelCase(rows)[0];
	}

	static async insert(username, bio) {
		const {
			rows,
		} = await pool.query(
			'INSERT INTO users (username, bio) VALUES ($1, $2) RETURNING *;',
			[username, bio]
		);

		return toCamelCase(rows)[0];
	}

	static async update(id) {}

	static async delete(id) {}
}

module.exports = UserRepo;
