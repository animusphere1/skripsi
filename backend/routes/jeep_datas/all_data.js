const express = require("express");

const getAllDataRouter = express.Router();

getAllDataRouter.get("/", (req, res) => {
  res.send("getall");
});

module.exports = { getAllDataRouter };
