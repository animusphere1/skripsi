const express = require('express');

const midtrans = require('../../backend/utils/payment/midtrans.js');

const router = express.Router();

router.get(
    '/', (req,res) => {
        res.send('ini api pertama');
    }
);

router.post('/gettoken', async (req,res) => {
    var token = await midtrans.gettokenpayment({nama : 'fajarwidiarno'});

    if (token === undefined) {
        res.send('ini buat ambil token');  
    } else {
        res.send(token);
    }
})

module.exports = router;