dateNow = () => {
    var date = new Date();

    console.log(`jam awal: ${date.toLocaleString()}`);
    
    return new Date(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes()).toLocaleString().replace(' ','').split(',');
}

dateLocal = {
    dateNow,
};

module.exports = {dateLocal}