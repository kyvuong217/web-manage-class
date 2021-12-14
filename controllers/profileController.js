const { render } = require("ejs")
const consql = require("../databases/database");
const profileModel = require("../models/profileModel");
module.exports = {
    showProfile: async(req, res)=>{
        if(req.session.flag){
            let gv = await profileModel.showProfile(req.session.profile.tid);
            return res.render("view_profile",{ key: req.session.profile,gv:gv});
        }
        else{
            res.send('Vui lòng đăng nhập')
        }
    },
    editProfile: (req,res)=>{
        if(req.session.flag){
            profileModel.editProfile(req.body,req.params.id,(err,data)=>{
                if(!err){
                    req.session.message = {
                        type: 'success',
                        message: 'Your profile has been updated successfully'
                    }
                    res.redirect("/view_profile")
                }
                else{
                    req.session.message = {
                        type: 'danger',
                        message: 'Something went wrong!!'
                    }
                    res.send(err)
                }
            })
        }else{
            res.send("Vui lòng đăng nhập lại")
        }
    },
    showChangePassword: (req, res)=>{
        res.render("changePassword");
    },
    changePassword: (req, res)=>{
        profileModel.changePassword(req.body,req.session.email,(err,data)=>{
            if (!err){
                res.redirect('/std_dashboard')
            }
            else{
                res.send(err);
            }
        })
    }
}