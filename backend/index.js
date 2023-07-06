//database
// const db = require('../backend/database/database.js');

//package
const express = require("express");
const multer = require("multer");
//utils
const initEnv = require("./utils/config/environtment.js");

//routes
const { routerGenerator } = require("./routes/routes.js");

//initialze
const app = express();
const upload = multer();

initEnv();

app.use(upload.none());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.send("ini index");
});

app.use("/api/payment", routerGenerator.paymentRouter);

app.use("/api/account", routerGenerator.accountRouter);

app.use("/api/data/", routerGenerator.jeepDatasRouter);

app.listen(3000, function () {
  console.log(`server running`);
});
