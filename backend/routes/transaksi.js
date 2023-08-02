const express = require("express");
const db = require("../database/database.js");

const transaksiRouter = express.Router();

transaksiRouter.get("/transaksijeep", async (req, res) => {
  var data = await getDataTransaksi();

  if (data.length === 0) {
    res.send({
      status: 404,
      datas: [],
    });
  } else {
    res.send({
      status: 200,
      datas: data,
    });
  }
});

transaksiRouter.post("/transaksijeep/buatbaru", async (req, res) => {
  db.connection.query(
    "insert into tabel_transaksijeep (id_transaksi, nama_bisnis,nama_customer,order_id,nama_trip,status_transaksi,tanggal_ngejeep,jam_ngejeep) values ('2000','Jeep Wisata Tawangmangu','doni','22222','trip c','1','3','4' )",
    (err, rows, fields) => {
      console.log(err);
    }
  );
});

transaksiRouter.get("/transaksijeep/updatestatus", async (req, res) => {
  db.connection.query("update transaksi_jeep set nama_bisnis = 'siapa saja', nama_customer = 'fajar' where id_transaksi = '2000'", (err, rows, fields) => {
    console.log(rows);
  });
});

getDataTransaksi = async () => {
  var data = new Promise((resolve, reject) => {
    db.connection.query("select * from transaksi_jeep", (err, rows, fields) => {
      resolve(rows);
    });
  });

  return data;
};

module.exports = { transaksiRouter };
