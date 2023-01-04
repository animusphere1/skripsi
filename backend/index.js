//package
const express = require('express');
const jwt = require('jsonwebtoken');

//utils
const {status,getStatus} = require('./utils/status.js');
const {response} = require('./utils/response');
const database = require('./database/database.js');
const midtrans = require('./payment/midtrans.js');

//initialze
const app = express();
// database.init();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/api/getpromo', async function(req,res) {
     res.send({'datas' : 'promo'});
});

app.post('/api/login', async (req,res) => {
   var getDataLogin = await database.getData('select * from user');

   console.log(getDataLogin);

   if (getDataLogin != undefined) {
        res.status(200).send({'datas' : getDataLogin});
   } else {
        res.status(400).send({'datas' : null});
   }
});

app.listen(3000, function() {
    console.log('jalan');
});