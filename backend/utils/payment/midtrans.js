const midtransClient = require("midtrans-client");
const { json } = require("body-parser");

async function getPayment(params) {
  const { order_id, bank } = params;

  console.log(order_id);

  let core = new midtransClient.CoreApi({
    isProduction: false,
    serverKey: process.env.serverKey,
    clientKey: process.env.clientKey,
  });

  //lakukan pengechekan
  var check = await checkStatus(order_id);

  console.log(check);

  if (check.status_code === 200) {
    //apabila data sudah ada
    return { status_code: 400 };
  } else {
    //apabila data belum ada
    var parameter = {
      payment_type: "bank_transfer",
      bank_transfer: { bank: bank },
      transaction_details: {
        order_id: order_id,
        gross_amount: 1000000,
      },
      item_details: [
        {
          id: 1,
          name: "ayam bakar sambal balado",
          quantity: 1,
          price: 1000000,
        },
      ],
      customer_details: {
        first_name: "restu wahyu",
        last_name: "saputra",
        email: "fajarbagusjp@gmail.com",
        phone: "087820154350",
        billing_address: {
          address: "jl.sibuta gua hantu no.120",
          city: "Depok",
          postal_code: "16436",
        },
      },
    };

    //buat transaksi baru
    var response_payment = await core.charge(parameter);

    return {
      status_code: response_payment.status_code,
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
    var response = await snap.transaction.status(`${order_id}`);

    console.log(response);

    return { status_code: 200, transaction_status: response.transaction_status };
  } catch (error) {
    return { status_code: 400 };
  }
}

module.exports = { getPayment, checkStatus };
