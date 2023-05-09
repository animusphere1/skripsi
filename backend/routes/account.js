const express = require("express");
const jwt = require("jsonwebtoken");
const axios = require("axios");
const router = express.Router();

router.post("/login", async (req, res) => {
  res.status(200).json({ response: "login" });
});

router.get("/logout", (req, res) => {
  res.send();
});

router.get("/register", (req, res) => {
  res.send("daftar account");
});

module.exports = router;
