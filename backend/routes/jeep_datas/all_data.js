const { json } = require("body-parser");
const express = require("express");

const getAllDataRouter = express.Router();

getAllDataRouter.get("/", (req, res) => {
  let { data } = req.body;

  let datas = JSON.parse(data);

  if (typeof Array.isArray(datas)) {
    const found = datas.find((element) => element["fajar"] == 1);

    console.log(found);

    res.status(200).json({ datas: found });
  }
});

module.exports = { getAllDataRouter };
