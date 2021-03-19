const pool = require('../pool');

class UserRepo {
	static async find() {
		const { rows } = await pool.query('SELECT * FROM users;');

		const parsedRows = rows.map((row) => {
			const replaced = {};

			for (let key in row) {
				const camelCase = key.replace(/([-_][a-z])/gi, ($1) =>
					$1.toUpperCase().replace('_', '')
				);
				replaced[camelCase] = row[key];
			}

			return replaced;
		});

		return parsedRows;
	}

	static async findById(id) {}

	static async insert() {}

	static async update(id) {}

	static async delete(id) {}
}

module.exports = UserRepo;
