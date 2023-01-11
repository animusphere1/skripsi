const conn = require('mysql2')
const connection =  conn.createConnection({host:'localhost',user:'root',password:'', database:'database_skripsi'});

async function init() {
    connection.connect();
}

async function getData(query){ 
    var datas = new Promise((resolve, reject) => {
        connection.query(query,(err,result) => {
            setTimeout(() => {
                resolve(result);
            },1000);
        });
    });

    return datas;
}

module.exports = {connection,getData,init};