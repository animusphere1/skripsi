const express = require('express');

const midtrans = require('../../backend/utils/payment/midtrans.js');
const {paymentResponse} = require('../../backend/utils/response.js');

const router = express.Router();

router.post('/gettoken', async (req,res) => {
    var response = await midtrans.gettokenpayment({order_id : 'doniyuliantofajar'});

    console.log(res);

    if (response.status === 400) {
        res.send(paymentResponse(400, response.datas));  
    } else {
        res.send(paymentResponse(200, response.datas));
    }
})

module.exports = router;