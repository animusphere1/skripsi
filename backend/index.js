//package
const express = require('express');
const jwt = require('jsonwebtoken');
//utils
const {status} = require('./utils/status.js');
const {response} = require('./utils/response.js');
const {dateLocal} = require('./utils/date.js');
const database = require('./database/database.js');
const midtrans = require('./payment/midtrans.js');

//initialze
const app = express();
// database.init();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.post('/api/login', async (req,res) => {
     var {email, password} = req.body;

     var datas = await database.getData(`select * from user where email = '${email}' && password = '${password}' limit 1`);

     if (datas == undefined) {
          res.send(response(400));
     } else {
          var token = jwt.sign(password, 'rahasia');

          var dateTokenGenerate = dateLocal.dateNow();
          var updateTokenDay = dateLocal.dateAdd(2);

          console.log(`date token generate: ${dateTokenGenerate}`);
          console.log(`date token updateTokenDay: ${updateTokenDay[0]}`);


          database.connection.query(`update user set token = '${token}', created_token_atday = '${dateTokenGenerate}', update_token_atday = '${updateTokenDay}' where email = '${email}' && password = '${password}'`
          , (err,result) => {
               res.send(response(200, datas));
          });
     }
});

app.post('/api/register', (req,res) => {
     res.status(200).send(response(status.success));
})

app.get('/api/logout', (req,res) => {
     console.log(req.body);

     if (req.body == null) {
          res.status(400).send({status : status.error});
     } else {
          res.status(200).send(response(status.success, req.body.nama));
     }
});

app.listen(3000, function() {
    console.log('jalan');
});