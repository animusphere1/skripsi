//database
const db = require('../backend/database/database.js');

//package
const express = require('express');
const multer = require('multer');

//utils
const midtrans = require('./utils/payment/midtrans.js');
const {response} = require('./utils/response.js');

//routes
const routes = require('./routes/routes.js');

const upload = multer();

//initialze
const app = express();

app.use(upload.none());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/api/payment', routes.payment);

app.use('/api/account', routes.account);

app.listen(3000, function() {
    console.log('server running');

    db.init();
});

