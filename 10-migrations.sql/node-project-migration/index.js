const express = require('express');
const pg = require('pg');

const pool = new pg.Pool({
	host: 'localhost',
	port: 5432,
	database: 'socialnetwork',
	user: 'postgres',
	password: 'postgres',
});

const app = express();
app.use(express.urlencoded({ extended: true }));

app.get('/posts', async (req, res) => {
	const { rows } = await pool.query(`
    SELECT * FROM posts;
  `);

	res.send(`
    <table>
      <thead>
        <tr>
          <th>id</th>
          <th>lng</th>
          <th>lat</th>
        </tr>
      </thead>
      <tbody>
        ${rows
					.map((row) => {
						return `
            <tr>
              <td>${row.id}</td>
              <td>${row.lng}</td>
              <td>${row.lat}</td>
            </tr>
          `;
					})
					.join('')}
      </tbody>
    </table>
  `);
});
