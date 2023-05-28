const express = require("express");

const midtrans = require("../../backend/utils/payment/midtrans.js");
const { paymentResponse } = require("../../backend/utils/response.js");

const router = express.Router();

router.post("/gettoken", async (req, res) => {
  let { order_id } = req.body;

  try {
    var response = await midtrans.gettokenpayment(order_id);

    console.log(response.datas.va_numbers);

    if (response.status === 400) {
      res.status(400).json(paymentResponse(400, response.datas));
    } else {
      res.status(200).send(paymentResponse(200, response.datas));
    }
  } catch (error) {
    res.status(200).send({ status: error });
  }
});

router.get("/checktoken", async (req, res) => {
  const { id } = req.body;

  console.log(id);

  var response = await midtrans.checkStatus(id);

  res.status(400).json({ status: response });
});

module.exports = router;
