const consql = require("../databases/database")

module.exports = {
    upStory: (receiver,id,result)=>{
            const sql = `INSERT INTO news (content,time,title,tid,cid) values ("${receiver.content}",current_timestamp(),'${receiver.title}','${receiver.uid}' ,${id})`;
            consql.query(sql,(err,data)=>{
                if(!err){
                    result(null,'Update successfully')
                    
                }
                else{
                    result(err, null)
                }
            })
        },
    showStory: (id)=>{
        return new Promise((resolve, reject)=>{
            //sài promise khi dùng select đợi lấy dữ liệu
            const sql = `SELECT * FROM news join teacher on teacher.tid = news.tid join classroom on news.cid = classroom.cid where classroom.cid = ${id} ORDER BY nid DESC`;
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
    delNews: (cid,nid,result)=>{
        const sql = `DELETE FROM comment WHERE nid = ${nid}`
        consql.query(sql,(err,data)=>{
            if(!err){
                const del = `DELETE FROM news WHERE nid = ${nid}`
                consql.query(del,(err,data)=>{
                    if(!err){
                        result(null,"Delete success")
                    }
                    else{
                        result(err,null)
                    }
                    
                })
            }
            else{
                result(err,null)
            }
        })
    },
    fixStory: (receiver,nid,result)=>{
        const sql = `UPDATE news SET content = '${receiver.content}', title = '${receiver.title}' WHERE nid = ${nid}`;
        consql.query(sql,(err,data)=>{
            if(!err){
                result(null,'Update successfully')
                
            }
            else{
                result(err, null)
            }
        })
    },
    addClass: (receiver,id,result)=>{
        const sql = `INSERT INTO classroom (cname,
                                            size,
                                            description,
                                            date_start,
                                            date_end,
                                            status,
                                            tid) 
                            values ("${receiver.cname}",
                                    ${receiver.size},
                                    "${receiver.description}",
                                    "${receiver.date_start}",
                                    "${receiver.date_end}",
                                    1,
                                    '${id}')`;
            consql.query(sql,(err,results,data)=>{
                if(!err){
                    consql.query(`INSERT INTO news (content,time,tid,cid) values ("Welcome to my class",current_timestamp(),'${id}',${results.insertId})`)
                    result(null,data);                  
                }
                else{
                    result(err, null)
                }
            })
    },
    showClassAll: (tid)=>{
        return new Promise((resolve, reject)=>{
            //sài promise khi dùng select đợi lấy dữ liệu
            const sql = `SELECT * FROM classroom join teacher on classroom.tid = teacher.tid where teacher.tid = '${tid}'`;
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
    assignStudent: (receiver,result)=>{
        const sql = `UPDATE student SET cid = ${receiver.cid} WHERE sid = "${receiver.sid}"`;
            consql.query(sql,(err,data)=>{
                if(!err){
                    result(null,data);
                }
                else{
                    result(err,null);
                }
            })
    },
    countStd: ()=>{
        return new Promise((resolve, reject)=>{
            //sài promise khi dùng select đợi lấy dữ liệu
            const sql = `SELECT COUNT(*) AS count FROM student where cid IS NULL`;
            let count;
            consql.query(sql,(err,data)=>{
                if(!err){
                    count = data[0].count;
                    resolve(count);
                }
                else{
                    reject(err);
                }
            })
        })
    },
    showStudent: ()=>{
        return new Promise((resolve, reject)=>{
            //sài promise khi dùng select đợi lấy dữ liệu
            const sql = 'SELECT * FROM student WHERE cid IS NULL ';
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
    deleteClass: (id,result)=>{
        const sql = 'DELETE FROM news WHERE cid = ?'
        consql.query(sql,id,(err,data)=>{
            if(!err){
                const del = 'DELETE FROM classroom WHERE cid = ?'
                consql.query(del,id,(err,data)=>{
                    if(!err){
                        result(null,"Delete success")
                    }
                    else{
                        result(err,null)
                    }
                    
                })
            }
            else{
                result(err,null)
            }
        })
    },
    showEdit: (id,result)=>{
            //sài promise khi dùng select đợi lấy dữ liệu
            const sql = 'SELECT * FROM classroom where cid = ?';
            consql.query(sql,id,(err,data)=>{
                if(!err){
                    result(null,data);
                }
                else{
                    result(err,null);
                }
            })
    }, 
    editClass: (receiver,id,result)=>{
        const sql = `UPDATE classroom SET cname = '${receiver.cname}',
                    size ='${receiver.size}', 
                    description ='${receiver.description}',
                    date_start ='${receiver.date_start}',
                    date_end ='${receiver.date_end}' WHERE cid = ${id}`;
        consql.query(sql,(err,data)=>{
            if(!err){
                result(null,'Update successfully')
                
            }
            else{
                result(err, null)
            }
        })
    },
    showComment: (id)=>{
        return new Promise((resolve, reject)=>{
            const sql = `SELECT * FROM comment JOIN news on news.nid = comment.nid 
                                               join student on student.sid = comment.sid 
                                               where comment.nid = news.nid`;
            // const sql = `SELECT * FROM comment`;
            consql.query(sql,id,(err,data)=>{
                if(!err){
                    resolve(data);
                }
                else{
                    reject(err);
                }
            })
        })
    },

    //chưa xong 
    upComment: (receiver,id,result)=>{
        const tid = receiver.tid;
        if(!tid){
            const sql = `INSERT INTO comment (c_content,c_time,sid,nid) values ("${receiver.content}",current_timestamp(),"${receiver.sid}",${receiver.nid})`;
            consql.query(sql,(err,data)=>{
                if(!err){
                    result(null,'Update successfully')
                    
                }
                else{
                    result(err, null)
                }
            })
        }else{
            const sql = `INSERT INTO comment (c_content,c_time,tid,nid) values ("${receiver.content}",current_timestamp(),"${receiver.tid}",${receiver.nid})`;
            consql.query(sql,(err,data)=>{
                if(!err){
                    result(null,'Update successfully')
                    
                }
                else{
                    result(err, null)
                }
            })    
        }
        
    },
    viewClass: (id)=>{
        //sài promise khi dùng select đợi lấy dữ liệu
        return new Promise((resolve, reject)=>{
            const sql = `SELECT * FROM classroom join teacher on teacher.tid = classroom.tid join news on news.cid = classroom.cid where teacher.tid = '${id}' GROUP BY cname`;
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
    showClassDetails: (id)=>{
        return new Promise((resolve, reject)=>{
            //sài promise khi dùng select đợi lấy dữ liệu
            const sql = `SELECT * FROM classroom join teacher on teacher.tid = classroom.tid 
                                                join news on news.cid = classroom.cid 
                                                 where classroom.cid = ${id} `;
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
    studentId: (id)=>{
        return new Promise((resolve, reject)=>{
            //sài promise khi dùng select đợi lấy dữ liệu
            const sql = `SELECT sid,name FROM student join classroom on classroom.cid = student.cid WHERE classroom.cid = ${id}  `;
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
    showPoint: (id)=>{
        return new Promise((resolve, reject)=>{
            //sài promise khi dùng select đợi lấy dữ liệu
            const sql = `SELECT * FROM statistics 
                                join student on student.sid = statistics.sid 
                                join semester on semester.sm_id = statistics.sm_id
                                WHERE statistics.cid = ${id}  `;
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
    addSemester: (receiver,result)=>{
        const sql = `INSERT INTO semester (sm_name,sm_year) values ("${receiver.sname}",${receiver.year})`;
        consql.query(sql,(err,data)=>{
            if(!err){
                result(null,'Insert successfully')
                
            }
            else{
                result(err, null)
            }
        })
    },
    addPoint: (receiver,id,result)=>{
        const sql = `INSERT INTO statistics (sid,tbtl,pre_tbhk,tbhk,trainpoint,sm_id,cid) 
                                    values ("${receiver.sid}",
                                            ${receiver.tbtl},
                                            ${receiver.pre_tbhk},
                                            ${receiver.tbhk},
                                            ${receiver.trainpoint},
                                            ${receiver.sm_id},
                                            ${id})`;
        consql.query(sql,(err,data)=>{
            if(!err){
                result(null,'Insert successfully')
                
            }
            else{
                result(err, null)
            }
        })
    },
    delPoint: (id,result)=>{
        const sql = 'DELETE FROM statistics WHERE id = ?'
        consql.query(sql,id,(err,data)=>{
            if(!err){    
                result(null,data)
            }
            else{
                result(err,null)
            }
        })
    },
    getTeacher: (id)=>{
        return new Promise((resolve, reject)=>{
            //sài promise khi dùng select đợi lấy dữ liệu
            const sql = `SELECT * FROM teacher join classroom on classroom.tid = teacher.tid 
                                                where classroom.cid = ${id}`;
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
    getAllMember: (id)=>{
        return new Promise((resolve, reject)=>{
            //sài promise khi dùng select đợi lấy dữ liệu
            const sql = `SELECT * FROM student join classroom on classroom.cid = student.cid 
                                               join sub_info on student.sid = sub_info.sid 
                                               WHERE student.cid = ${id}`;
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
    getQuantity: (id)=>{
        return new Promise((resolve, reject)=>{
            //sài promise khi dùng select đợi lấy dữ liệu
            const sql = `SELECT COUNT(*) AS count FROM student where cid = ${id}`;
            let count;
            consql.query(sql,(err,data)=>{
                if(!err){
                    count = data[0].count;
                    resolve(count);
                }
                else{
                    reject(err);
                }
            })
        })
    },

}