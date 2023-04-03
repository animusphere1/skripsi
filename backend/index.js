//package
const express = require('express');
const jwt = require('jsonwebtoken');
//utils
// const database = require('./database/database.js');

const midtrans = require('./payment/midtrans.js');
const {keluar} = require('./utils/response.js');

const multer = require('multer');
const upload = multer();

//initialze
const app = express();

app.use(upload.none());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.post('/api/payment/gettoken',async (req,res) => {
     var {nama} = req.body;

     var token = await midtrans.gettokenpayment({nama : nama});

     res.json(token);
});


app.listen(3000, function() {
    console.log('server running');
});

