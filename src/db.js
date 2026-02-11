const { Pool } = require("pg");

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "online_test",
  password: "areeba@12",
  port: 5432,
});

module.exports = pool;
