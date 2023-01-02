const response = (status,datas) => {
    if (datas != undefined) {
        return {
            'status' : status,
            'datas' : datas,
        }
    } else {
        return {
            'status' : status,
            'datas' : 'not found',
        }
    }
}

module.exports = {response}