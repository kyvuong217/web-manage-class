const consql = require("../databases/database")

module.exports = {
    showDashboard2: (id)=>{
        //sài promise khi dùng select đợi lấy dữ liệu
        return new Promise((resolve, reject)=>{
            const sql = `SELECT * FROM student WHERE sid = "${id}"`;
            consql.query(sql,(err,data)=>{
                if(!err){
                    resolve(data);
                }
                else{
                    reject(err);
                }
            })
        })
    },

}