const nodemailer = require("nodemailer");

sendEmail = (params) => {
  var { email } = params;

  console.log(email);

  var transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: "fajarbagusen@gmail.com",
      pass: "ipraokpfsxeawkst",
    },
  });

  var mailOptions = {
    from: "fajarbagusen@gmail.com",
    to: email,
    subject: "Sending Email using Node.js",
    text: "That was easy!",
  };

  transporter.sendMail(mailOptions, function (error, info) {
    if (error) {
      console.log(error);
    } else {
      console.log("Email sent: " + info.response);
    }
  });
};

module.exports = { sendEmail };
