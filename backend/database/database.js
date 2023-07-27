const conn = require("mysql2");
const connection = conn.createConnection({ host: "localhost", user: "root", password: "", database: "database_skripsi" });

init = () => {
  connection.connect();
};

module.exports = { init, connection };
