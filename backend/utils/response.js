const response = (status,datas) => {
    if (datas == undefined) {
        return {
            'status' : status,
            'datas' : 'not found',
        }
    } 

    return {
        'status' : status,
        'datas' : datas,
    }
}

const keluar = {response}

module.exports = {keluar}