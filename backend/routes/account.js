const express = require("express");
const jwt = require("jsonwebtoken");

const { nameRes } = require("../../backend/utils/response.js");

const router = express.Router();

router.post("/login", (req, res) => {
  const { nama } = req.body;

  const tokenJWT = jwt.sign(nama, [nama, nama].join());

  res.send(nameRes("nama", { token: tokenJWT }));
});

router.get("/logout", (req, res) => {
  res.send();
});

router.get("/register", (req, res) => {
  res.send("daftar account");
});

module.exports = router;
