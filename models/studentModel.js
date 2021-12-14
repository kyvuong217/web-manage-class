const consql = require("../databases/database")
const readXlsxFile = require('read-excel-file/node');

module.exports = {
    addStudent: (receiver,result)=>{
        const sql = `INSERT INTO student (sid,
            name,
            email,
            password) 
            values ("${receiver.sid}",
                "${receiver.name}",
                "${receiver.email}",
                "${receiver.password}")`;
        consql.query(sql,(err,data)=>{
            if(!err){
                result(null,'Inserted one row')
            }
            else{
                result(err,null)
            }
        })
    },
    addmore: (receiver,result)=>{
        const sql = `INSERT INTO sub_info (p_name,p_job,p_phone,sid,p_email) values ("${receiver.name}","${receiver.job}","${receiver.phone}" ,"${receiver.sid}","${receiver.email}")`;
        consql.query(sql,(err,data)=>{
            if(!err){
                result(null,'Insert successfully')
            }
            else{
                result(err, null)
            }
        })
    },
    showProfile: (id)=>{
        return new Promise((resolve, reject)=>{
            //sài promise khi dùng select đợi lấy dữ liệu
            const sql = `SELECT * FROM student JOIN sub_info on sub_info.sid = student.sid WHERE student.sid = '${id}'`;
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
    editProfile: (receiver,id,result)=>{
        const sql = `UPDATE student SET name = '${receiver.name}',
                    dob ='${receiver.dob}', 
                    phone ='${receiver.phone}',
                    workplace ='${receiver.workplace}' WHERE sid = "${id}"`;
        consql.query(sql,(err,data)=>{
            if(!err){
                consql.query(`UPDATE sub_info SET p_name = '${receiver.pname}',
                p_email ='${receiver.pemail}', 
                p_job ='${receiver.pjob}',
                p_phone ='${receiver.pphone}' WHERE sid = "${id}"`);
                result(null,data)                
            }
            else{
                result(err, null)
            }
        })
    },
    importExcelData2MySQL: (filePath,result)=>{
        readXlsxFile(filePath).then((rows) => {
            console.log(rows);
            rows.shift();
            const sql = 'INSERT INTO student (sid, name, dob, email, password, phone, workplace) VALUES ?';
            consql.query(sql, [rows], (err,data)=>{
                if(!err){
                    console.log(err || data);
                    result(null,data)                
                }
                else{
                    result(err, null)
                }
            })
        })

    },
    viewClass: (id)=>{
        return new Promise((resolve, reject)=>{
            const sql = `SELECT * FROM classroom join student on student.cid = classroom.cid where sid = '${id}'`;
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