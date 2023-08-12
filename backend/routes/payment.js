const express = require("express");

const midtrans = require("../../backend/utils/payment/midtrans.js");
const { sendEmail } = require("../utils/sendemail.js");

const paymentRouter = express.Router();

paymentRouter.post("/gettoken", async (req, res) => {
  let params = req.body;

  console.log("check dulu");
  var response_payment = await midtrans.getPayment(params);

  if (response_payment.status_code === 201) {
    res.status(200).json({ status_code: response_payment.status_code, data: response_payment.datas });
  } else {
    res.status(400).json({ status_code: response_payment.status_code });
  }
});

module.exports = { paymentRouter };
