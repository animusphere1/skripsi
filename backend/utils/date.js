dateNow = () => {
  var date = new Date();

  console.log(`jam awal: ${date.toLocaleString()}`);

  return new Date(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes()).toLocaleString().replace(" ", "").split(",");
};

dateExpiredToken = () => {
  var date = new Date();

  date.setHours(date.getHours() + 2);

  console.log(`jam awal: ${date.toLocaleString()}`);

  return new Date(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes()).toLocaleString().replace(" ", "").split(",");
};

module.exports = { dateNow, dateExpiredToken };
