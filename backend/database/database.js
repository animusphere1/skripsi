const conn = require("mysql2");
const connection = conn.createConnection({ host: "localhost", user: "root", password: "", database: "database_skripsi" });

init = () => {
  connection.connect();
};

getAllData = () => {
  var data = new Promise((resolve, reject) => {
    connection.query("select * from user", (err, rows, field) => {
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

getData = (id_user) => {
  var data = new Promise((resolve, reject) => {
    connection.query("select * from user where id_user = ?", [id_user], (err, rows, field) => {
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
