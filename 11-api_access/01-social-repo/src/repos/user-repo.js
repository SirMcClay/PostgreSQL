const pool = require('../pool');

class UserRepo {
	static async find() {
		const { rows } = await pool.query('SELECT * FROM users;');

		return rows;
	}

	static async findById(id) {}

	static async insert() {}

	static async update(id) {}

	static async delete(id) {}
}

module.exports = UserRepo;
