const express = require("express");

const midtrans = require("../../backend/utils/payment/midtrans.js");
const { paymentResponse } = require("../../backend/utils/response.js");
const { sendEmail } = require("../utils/sendemail.js");

const paymentRouter = express.Router();

paymentRouter.post("/gettoken", async (req, res) => {
  let params = req.body;

  console.log(params);

  var response = await midtrans.getPayment(params);

  console.log(response);

  if (response.datas !== null) {
    var vanumber = response.datas.va_numbers;

    console.log(vanumber);

    res.status(400).json({ status: response.status, data: response.datas });
  } else {
    res.status(200).json({ status: response.status });
  }
});

module.exports = { paymentRouter };
