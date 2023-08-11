const midtransClient = require("midtrans-client");
const { json } = require("body-parser");

async function getPayment(params) {
  const { order_id, bank, items } = params;

  var items_details = JSON.parse(items);

  let core = new midtransClient.CoreApi({
    isProduction: false,
    serverKey: process.env.serverKey,
    clientKey: process.env.clientKey,
  });

  var check = await checkStatus(order_id);

  if (check.status.status_code == 201) {
    return {
      status: 400,
    };
  } else {
    var parameter = {
      payment_type: "bank_transfer",
      bank_transfer: { bank: bank },
      transaction_details: {
        order_id: order_id,
        gross_amount: 1000000,
      },
      item_details: items_details,
      customer_details: {
        first_name: "restu wahyu",
        last_name: " saputra",
        email: "fajarbagusjp@gmail.com",
        phone: "087820154350",
        billing_address: {
          address: "jl.sibuta gua hantu no.120",
          city: "Depok",
          postal_code: "16436",
        },
      },
    };

    var response_payment = await core.charge(parameter);

    return {
      status: 200,
      datas: response_payment,
    };
  }
}

async function checkStatus(order_id) {
  let snap = new midtransClient.Snap({
    isProduction: false,
    serverKey: process.env.serverKey,
    clientKey: process.env.clientKey,
  });

  try {
    var response = await snap.transaction.status(order_id);

    console.log(response);

    return { status: response };
  } catch (error) {
    return { status: 400 };
  }
}

module.exports = { getPayment, checkStatus };
