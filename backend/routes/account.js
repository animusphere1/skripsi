const express = require("express");
const jwt = require("jsonwebtoken");
const axios = require("axios");
const accountRouter = express.Router();
const db = require("../database/database.js");

//response
const response = require("../../backend/utils/response.js");

accountRouter.post("/masuk", async (req, res) => {
  var { username, email, password } = req.body;

  console.log(email);

  if (username !== undefined || email !== undefined) {
    db.connection.query("select * from tabel_akun where (username = ? or email = ?) and password = ?", [username, email, password], (err, rows, fields) => {
      if (rows.length === 0) {
        res.status(404).json({ status: 404 });
      } else {
        res.status(200).json({ status: 200, datas: rows });
      }
    });
  }
});

accountRouter.get("/keluar", (req, res) => {
  res.status(200).json({ status: "logout" });
});

accountRouter.post("/buatbaru", async (req, res) => {
  var { username, password, nama_asli, email } = req.body;

  var tipe_account = "customer";

  db.connection.query("insert into tabel_akun (id_user,username,password,nama_asli,email,tipe_account) values (?,?,?,?,?,?)", [2, username, password, nama_asli, email, tipe_account], (err, rows, fields) => {
    res.send(rows);
  });
});

module.exports = { accountRouter };
