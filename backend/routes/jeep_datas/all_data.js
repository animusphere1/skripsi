const express = require("express");

const getAllDataRouter = express.Router();

getAllDataRouter.get("/", (req, res) => {
  const { type } = req.query;

  if (ambil !== undefined) {
    res.send("get query");
  } else {
    res.send("get all");
  }
});

module.exports = { getAllDataRouter };
