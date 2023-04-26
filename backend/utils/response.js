const paymentResponse = (status,datas) => {
    if (status == 400) {
        return {
            'payment_detail' : null,
            'status' : "not available",
        }
    } 

    return {
        'payment_detail' : datas,
        'status' : "available",
    }
}

module.exports = {paymentResponse}