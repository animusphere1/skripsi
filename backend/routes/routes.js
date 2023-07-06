const { paymentRouter } = require("./payment.js");
const { accountRouter } = require("./account.js");
const { jeepDatasRouter } = require("./jeep_datas/jeep_routes.js");

const routerGenerator = { paymentRouter, accountRouter, jeepDatasRouter };

module.exports = { routerGenerator };
