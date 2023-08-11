const nodemailer = require("nodemailer");

sendEmailDariGmail = (params) => {
  var { email } = params;

  console.log(email);

  switch (email) {
    case "gmail":
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
      break;
    case "hosting":
      var transporter = nodemailer.createTransport({
        host: "smpt.hostinger.com",
        secure: true,
        secureConnection: false,
        tls: {
          ciphers: "SSLv3",
        },
        requireTLS: true,
        port: 465,
        debug: true,
        connectionTimeout: 10000,
        auth: {
          user: "admin@jeeptawangmangu.com",
          pass: "jeepTawangmangu20@",
        },
      });

      var mailOptions = {
        from: "admin@jeeptawangmangu.com",
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

    default:
      break;
  }
};

module.exports = { sendEmailDariGmail };
