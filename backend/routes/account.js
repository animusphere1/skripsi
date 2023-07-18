const express = require("express");
const jwt = require("jsonwebtoken");
const axios = require("axios");
const accountRouter = express.Router();

const db = require("../database/database.js");

//response
const response = require("../../backend/utils/response.js");

accountRouter.post("/login", async (req, res) => {
  var data = await db.getData();

  console.log(`ini data : ${data}`);

  if (data.length === 0) {
    res.status(400).json({ status: "error" });
  } else {
    res.status(200).json({ status: "login", data: data });
  }
});

accountRouter.get("/logout", (req, res) => {
  res.status(200).json({ status: "logout" });
});

accountRouter.post("/signup", async (req, res) => {
  var { nama } = req.body;

  var json = JSON.parse(nama);

  res.status(200).json({
    status: "signup",
    data: {
      nama: json["nama"],
    },
  });
});

module.exports = { accountRouter };
