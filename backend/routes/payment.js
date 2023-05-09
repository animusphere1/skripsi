const express = require("express");

const midtrans = require("../../backend/utils/payment/midtrans.js");
const { paymentResponse } = require("../../backend/utils/response.js");

const router = express.Router();

router.post("/gettoken", async (req, res) => {
  let { id } = req.body;

  var response = await midtrans.gettokenpayment(id, { nama: "fajar" });

  if (response.status === 400) {
    res.status(400).json(paymentResponse(400, response.datas));
  } else {
    res.status(200).send(paymentResponse(200, response.datas));
  }
});

module.exports = router;
