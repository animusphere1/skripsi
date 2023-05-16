const express = require("express");
const jwt = require("jsonwebtoken");
const axios = require("axios");
const router = express.Router();

//response
const response = require("../../backend/utils/response.js");

router.post("/login", async (req, res) => {
  res.status(200).json(response.accountResponse());
});

router.get("/logout", (req, res) => {});

router.get("/register", (req, res) => {
  res.send("daftar account");
});

module.exports = router;
