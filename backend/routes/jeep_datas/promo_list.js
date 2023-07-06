const express = require("express");

const promoRouter = express.Router();

promoRouter.get("/getpromo", (req, res) => {
  res.send("getpromo");
});

module.exports = { promoRouter };
