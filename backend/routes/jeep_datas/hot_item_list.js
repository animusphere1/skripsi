const express = require("express");

const hotItemRouter = express.Router();

hotItemRouter.get("/hotitem", (req, res) => {
  res.send("hot item");
});

module.exports = { hotItemRouter };
