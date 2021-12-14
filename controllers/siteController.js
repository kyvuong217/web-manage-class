const { render } = require("ejs")
const consql = require("../databases/database")
const siteModel = require("../models/siteModel");

module.exports = {
    showHome: (req, res)=>{
        res.render("index");
    },
    showLogin: (req, res)=>{
        res.render("login");
    },
    login: (req, res)=>{
        const type = req.body.utype;
        const email = req.body.email;
        const password = req.body.password;

        if(email && password ){
            req.session.flag = true;
            req.session.email = email;
            
            if (type == "admin")
            {
                const sql = 'SELECT * FROM teacher WHERE email = ? AND password = ?';
                consql.query(sql,[email,password],(err,data)=>{
                    if(data.length > 0){
                        req.session.teacher = true;
                        req.session.profile = data[0];
                        // res.render('dashboard',{key:req.session.profile});
                        res.redirect('/dashboard')
                    }
                    else{
                        res.send('Not a teacher')
                    }   
                })
            }
            else{
                const sql = 'SELECT * FROM student WHERE email = ? AND password = ?';
                consql.query(sql,[email,password],(err,data)=>{
                    if(data.length > 0){
                        req.session.student = true;
                        req.session.profile = data[0];
                        // res.render('std_dashboard',{key:req.session.profile});
                        res.redirect('/std_dashboard');
                    }
                    else{
                        res.send('Not a student')
                    }   
                })
            }
        }
        else{
            res.send('Please enter your information');
            res.end();
        }
    },
    
    showDashboard: (req, res)=>{
        // const [contain] = req.session.admin;
        res.render("dashboard",{ key: req.session.profile});
    },
    showDashboard2: async(req, res)=>{
        // const [contain] = req.session.admin;
        if(req.session.flag){
            let profile = await siteModel.showDashboard2(req.session.profile.sid);
            res.render("std_dashboard",{ key: req.session.profile,profile:profile[0]});
        }
        else{
            res.send('Vui lòng đăng nhập')
        }
        
    },
    logOut: (req,res,next)=>{
        if (req.session) {
            // delete session object
            req.session.destroy(function(err) {
                if(err) {
                    return next(err);
                } else {
                    return res.redirect('/login');
                }
            });
        }
    }
}