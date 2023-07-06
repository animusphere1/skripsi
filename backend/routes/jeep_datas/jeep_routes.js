const { getAllDataRouter } = require("./all_data");
const { hotItemRouter } = require("./hot_item_list");
const { promoRouter } = require("./promo_list");

const jeepDatasRouter = [getAllDataRouter, hotItemRouter, promoRouter];

module.exports = { jeepDatasRouter };
