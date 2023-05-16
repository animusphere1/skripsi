const paymentResponse = (status, datas) => {
  if (status == 400) {
    return {
      payment_detail: null,
      status: "not available",
    };
  }

  return {
    payment_detail: datas,
    expired: datas.expiry_time,
    status: "available",
  };
};

const accountResponse = function (String, data) {
  if (data == undefined) {
    return { String: "kosong" };
  }

  return { String: data };
};

module.exports = { paymentResponse, accountResponse };
