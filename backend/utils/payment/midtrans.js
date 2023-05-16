const midtransClient = require("midtrans-client");

let serverKey = "SB-Mid-server-Vd-2J-VxTHS7lOqFUZw9sM1k";
let clientKey = "SB-Mid-client-5vrRgeJQktXIXFaM";

async function gettokenpayment(order_id, params) {
  let core = new midtransClient.CoreApi({
    isProduction: false,
    serverKey: serverKey,
    clientKey: clientKey,
  });

  let { nama } = params;

  console.log(nama);

  try {
    //check sudah ada belum
    var isAlready = await checkStatus(order_id);

    if (isAlready.status === 400) {
      let parameter = {
        payment_type: "bank_transfer",
        bank_transfer: { bank: "bri" },
        transaction_details: {
          order_id: order_id,
          gross_amount: 200000,
        },
        credit_card: {
          secure: true,
        },
        item_datails: [
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

      return {
        status: 200,
        datas: response,
      };
    } else {
      return { status: 400, datas: null };
    }
  } catch (error) {
    return { status: 400, datas: null };
  }
}

async function checkStatus(params) {
  let snap = new midtransClient.Snap({
    isProduction: false,
    serverKey: serverKey,
    clientKey: clientKey,
  });

  try {
    var response = await snap.transaction.status(params);

    console.log(response);

    return { status: response };
  } catch (error) {
    return { status: 400 };
  }
}

module.exports = { gettokenpayment, checkStatus };
