const midtransClient = require("midtrans-client");

let serverKey = "SB-Mid-server-Vd-2J-VxTHS7lOqFUZw9sM1k";
let clientKey = "SB-Mid-client-5vrRgeJQktXIXFaM";

async function gettokenpayment(order_id) {
  let core = new midtransClient.CoreApi({
    isProduction: false,
    serverKey: serverKey,
    clientKey: clientKey,
  });

  console.log(`error ${core}`);

  try {
    let parameter = {
      payment_type: "bank_transfer",
      bank_transfer: { bank: "bri" },
      transaction_details: {
        order_id: order_id,
        gross_amount: 200000,
      },
      // credit_card: {
      //   secure: true,
      // },
      item_details: [
        {
          id: "barulagi111",
          name: "ayam goreng",
          price: 100000,
          quantity: 2,
        },
      ],
      customer_details: {
        first_name: "restu wahyu",
        last_name: " saputra",
        email: "restuwahyu13@zetmail.com",
        phone: "087820154350",
        billing_address: {
          address: "jl.sibuta gua hantu no.120",
          city: "Depok",
          postal_code: "16436",
        },
      },
    };

    var response = await core.charge(parameter);

    console.log(response);

    return {
      status: 200,
      datas: response,
    };
  } catch (error) {
    return { status: 400, datas: null };
  }
}

async function checkStatus(order_id) {
  let snap = new midtransClient.Snap({
    isProduction: false,
    serverKey: serverKey,
    clientKey: clientKey,
  });

  try {
    var response = await snap.transaction.status(order_id);

    console.log(response);

    return { status: response };
  } catch (error) {
    return { status: 400 };
  }
}

module.exports = { gettokenpayment, checkStatus };
