const express = require("express");
const jwt = require("jsonwebtoken");
const axios = require("axios");
const accountRouter = express.Router();

//response
const response = require("../../backend/utils/response.js");
const { json } = require("body-parser");

accountRouter.post("/login", async (req, res) => {
  res.status(200).json(response.accountResponse());
});

accountRouter.get("/logout", (req, res) => {});

accountRouter.get("/register", async (req, res) => {});

module.exports = { accountRouter };
