const paymentRoute = require("./payment.js");
const accountRoute = require("./account.js");

const routerGenerator = { paymentRoute, accountRoute };

module.exports = { routerGenerator };
