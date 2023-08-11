//database
const db = require("../backend/database/database.js");

//package
const express = require("express");
const multer = require("multer");
const session = require("express-session");
//utils
const initEnv = require("./utils/config/environtment.js");

//routes
const { routerGenerator } = require("./routes/routes.js");
const { sendEmailDariGmail } = require("./utils/sendemail.js");

//initialze
const app = express();
const upload = multer();

initEnv();

app.use(upload.none());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.set("trust proxy", 1);
app.use(
  session({
    secret: process.env.sessionID,
    resave: false,
    saveUninitialized: true,
    cookie: { secure: true },
  })
);

app.get("/", (req, res) => {
  sendEmailDariGmail({ email: "hosting" });

  res.send("ini index");
});

app.use("/api/payment", routerGenerator.paymentRouter);

app.use("/api/account", routerGenerator.accountRouter);

app.use("/api/transaksi", routerGenerator.transaksiRouter);

app.listen(3000, function () {
  db.init();

  console.log(`server running`);
});
