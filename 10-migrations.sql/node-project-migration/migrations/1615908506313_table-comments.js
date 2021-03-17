/* eslint-disable camelcase */
// COMMAND TO EXECUTE MIGRATIONS
// UP/DOWN --> DATABASE_URL=postgres://USERNAME:PASSWORD@localhost:5432/DATABASE npm run migrate up
// UP --> DATABASE_URL=postgres://postgres:postgres@localhost:5432/socialnetwork npm run migrate up
// DOWN --> DATABASE_URL=postgres://postgres:postgres@localhost:5432/socialnetwork npm run migrate down

exports.shorthands = undefined;

exports.up = (pgm) => {
	pgm.sql(`
    CREATE TABLE comments (
      id SERIAL PRIMARY KEY,
      created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
      contents VARCHAR(240) NOT NULL
    );
  `);
};

exports.down = (pgm) => {
	pgm.sql(`
    DROP TABLE comments;
  `);
};
