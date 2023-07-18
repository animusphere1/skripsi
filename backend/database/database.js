const conn = require("mysql2");
const connection = conn.createConnection({ host: "localhost", user: "root", password: "", database: "database_skripsi" });

init = () => {
  connection.connect();
};

getData = () => {
  var data = new Promise((resolve, reject) => {
    connection.query("select * from user where id_user = ?", [122], (err, rows, field) => {
      if (err) {
        console.log(err);
      } else {
        setTimeout(() => {
          resolve(rows);
        }, 2000);
      }
    });
  });

  return data;
};

module.exports = { init, connection, getData };
