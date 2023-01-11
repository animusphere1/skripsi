dateNow = () => {
    var date = new Date();

    console.log(`jam awal: ${date.toLocaleString()}`);
    
    return new Date(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes()).toLocaleString().replace(' ','').split(',');
}

dateAdd = (days) => {   
    var date = new Date();

    var newDate = new Date(date.setDate(date.getDate() + days));

    return newDate.toLocaleString().replace(' ','').split(',');
}

dateLocal = {
    dateNow,
    dateAdd,
};

module.exports = {dateLocal}