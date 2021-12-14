const consql = require("../databases/database")

module.exports = {
    changePassword: (receiver,email,result)=>{
            const sql = `UPDATE student SET password = '${receiver.password}' WHERE email = '${email}'`;
            consql.query(sql,(err,data)=>{
                if(!err){
                    result(null,'Update successfully')
                    
                }
                else{
                    result(err, null)
                }
            })
    },
    editProfile: (receiver,id,result)=>{
        const sql = `UPDATE teacher SET name = '${receiver.name}',
                    dob ='${receiver.dob}', 
                    phone ='${receiver.phone}',
                    workplace ='${receiver.workplace}' WHERE tid = "${id}"`;
        consql.query(sql,(err,data)=>{
            if(!err){
                result(null,data)                
            }
            else{
                result(err, null)
            }
        })
    },
    showProfile: (id)=>{
        //sài promise khi dùng select đợi lấy dữ liệu
        return new Promise((resolve, reject)=>{
            const sql = `SELECT * FROM teacher join classroom on teacher.tid = classroom.tid where teacher.tid = '${id}'`;
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