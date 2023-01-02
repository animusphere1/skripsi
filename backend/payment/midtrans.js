const midtransClient = require('midtrans-client')

let serverKey = 'SB-Mid-server-Vd-2J-VxTHS7lOqFUZw9sM1k'
let clientKey = 'SB-Mid-client-5vrRgeJQktXIXFaM'

async function gettokenpayment(params) {
    let snap = new midtransClient.Snap({
        isProduction : false,
        serverKey : serverKey,
        clientKey : clientKey,
    })

    let parameter = {
        "transaction_details": {
            "order_id": 'coba-12345',
            "gross_amount": 200000
        }, "credit_card":{
            "secure" : true
        }
    };

    return await snap.createTransaction(parameter)
}

async function checkStatus(params) {
    let apiClient = new midtransClient.Snap({
        isProduction : false,
        serverKey : serverKey,
        clientKey : clientKey,
    });

    try {
        console.log('check status');
    
        return await apiClient.transaction.status(params)
    } catch (error) {
        return {'status' : 'error'};
    }
}


module.exports = {gettokenpayment,checkStatus}