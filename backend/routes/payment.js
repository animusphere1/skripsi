const express = require("express");

const midtrans = require("../../backend/utils/payment/midtrans.js");
const { paymentResponse } = require("../../backend/utils/response.js");

const router = express.Router();

router.post("/gettoken", async (req, res) => {
  let params = req.body;

  console.log(params);

  try {
    var response = await midtrans.getPayment(params);

    console.log(response);

    if (response.datas !== null) {
      res.status(400).json({ status: "success", data: response.datas });
    } else {
      res.status(200).json({ status: "failed", data: null, error: response.error });
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
