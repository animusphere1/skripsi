const { paymentRouter } = require("./payment.js");
const { accountRouter } = require("./account.js");
const { transaksiRouter } = require("./transaksi.js");

const routerGenerator = { paymentRouter, accountRouter, transaksiRouter };

module.exports = { routerGenerator };
