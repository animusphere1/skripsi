const paymentResponse = (status,datas) => {
    if (status == 400) {
        return {
            'payment_detail' : null,
            'status' : "not available",
        }
    } 

    return {
        'payment_detail' : datas,
        'expired' : datas.expiry_time,
        'status' : "available",
    }
}

const nameRes = function(String,data) {
    return {
        string : data,
    };
}

module.exports = {paymentResponse,nameRes}