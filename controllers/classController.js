const { readDirectory } = require("node-persist");
const classModel = require("../models/classModel");

module.exports = {
    showClass: async(req, res)=>{
        if(req.session.flag){
            let stories = await classModel.showStory(req.params.id);
            let details = await classModel.showClassDetails(req.params.id);
            
            let cmt = await classModel.showComment();

            res.render("classroom",{ key: req.session.profile,stories:stories,details:details[0],teacher: req.session.teacher,cmt:cmt });
        }
        else{
            res.send('Vui lòng đăng nhập')
        }
        
    },
    delNews: (req,res)=>{
        if(req.session.flag){
            classModel.delNews(req.params.cid,req.params.nid,(err,data)=>{
                if(!err){
                    req.session.message = {
                        type: 'success',
                        message: '1 news has been removed successfully'
                    }
                    res.redirect("/classroom/" + req.params.cid);
                }
                else{
                    req.session.message = {
                        type: 'danger',
                        message: 'Something went wrong'
                    }
                    res.redirect("/classroom/" + req.params.cid);

                    // res.send(err)
                }
            })
        }else{
            res.send("Vui lòng đăng nhập");
        }
        
    },
    fixStory: (req,res)=>{
        if(req.session.flag){
            classModel.fixStory(req.body,req.params.nid,(err,data)=>{
                if(!err){
                    req.session.message = {
                        type: 'success',
                        message: '1 news has been updated successfully'
                    }
                    res.redirect("/classroom/" + req.params.cid);
                }
                else{
                    req.session.message = {
                        type: 'danger',
                        message: 'Something went wrong'
                    }
                    res.redirect("/classroom/" + req.params.cid);
                }
            })
        }else{
            res.send("Vui lòng đăng nhập lại")
        }
    },
    upStory: (req,res)=>{
        classModel.upStory(req.body,req.params.id,(err,data)=>{
            if(!err){
                req.session.message = {
                    type: 'success',
                    message: 'Posted a new story successfully'
                }
                res.redirect("/classroom/" + req.params.id)
            }
            else{
                req.session.message = {
                    type: 'danger',
                    message: 'Error occured when try to post the story ',
                }
                res.send(err);
            }
        })
    },
    showAddClass: async(req,res)=>{
        if(req.session.flag){
            let classall = await classModel.showClassAll(req.session.profile.tid);  
            let student = await classModel.showStudent(); 
            let count = await classModel.countStd();

            res.render("addclass",{ key: req.session.profile,classall:classall, student:student,count:count});
               
        }
        else{
            res.send('Vui lòng đăng nhập')
        }
    },
    addClass: (req,res)=>{
        classModel.addClass(req.body,req.session.profile.tid,(err,data)=>{
            if(!err){
                req.session.message = {
                    type: 'success',
                    message: 'Create a new class successfully'
                }
                res.redirect("/addclass");
            }
            else{
                req.session.message = {
                    type: 'danger',
                    message: 'Something went wrong ><'
                }
                res.send(err);
            }
        })
    },  
    deleteClass: (req,res)=>{
        if(req.session.flag){
            classModel.deleteClass(req.params.id,(err,data)=>{
                if(!err){
                    req.session.message = {
                        type: 'success',
                        message: 'Delete class successfully'
                    }
                    res.redirect("/addclass");
                }
                else{
                    req.session.message = {
                        type: 'danger',
                        message: 'Something went wrong'
                    }
                    res.redirect("/addclass");
                    // res.send(err)
                }
            })
        }else{
            res.send("Vui lòng đăng nhập");
        }
        
    },
    showEdit: (req,res)=>{
        if(req.session.flag){
            classModel.showEdit(req.params.id,(err,data)=>{
                if(!err){
                    res.render("editClass",{ key: req.session.profile, editor: data[0]})
                }
                else{
                    res.send(err)
                }
            })
        }else{
            res.send("Vui lòng đăng nhập lại")
        }
    },
    editClass: (req,res)=>{
        if(req.session.flag){
            classModel.editClass(req.body,req.params.id,(err,data)=>{
                if(!err){
                    res.redirect("/addclass")
                }
                else{
                    res.send(err)
                }
            })
        }else{
            res.send("Vui lòng đăng nhập lại")
        }
    },
    assignStudent: (req,res)=>{
        if(req.session.flag){
            classModel.assignStudent(req.body,(err,data)=>{
                if(!err){
                    req.session.message = {
                        type: 'success',
                        message: '1 student has been assigned successfully!!! '
                    }
                    res.redirect("/addclass")
                }
                else{
                    req.session.message = {
                        type: 'danger',
                        message: 'Something went wrong '
                    }
                    res.send(err)
                }
            })
        }else{
            res.send("Vui lòng đăng nhập lại")
        }
    },
    viewClass: async(req, res)=>{
        if(req.session.flag){
            let classroom = await classModel.viewClass(req.session.profile.tid);
            return res.render("about_classroom",{ key: req.session.profile,classroom:classroom});
        }
        else{
            res.send('Vui lòng đăng nhập')
        }
        
    },
    upComment: (req,res)=>{
        classModel.upComment(req.body,req.params.id,(err,data)=>{
            //req.body để lấy content, sid >< req.params.id để lấy id của news(nid)
            if(!err){
                res.redirect("/classroom/" + req.params.id);
            }
            else{
                res.send(err);
            }
        })
    },
    statistic: async(req,res)=>{
        if(req.session.flag){
            let details = await classModel.showClassDetails(req.params.id);
            let studentId = await classModel.studentId(req.params.id);
            let showPoint = await classModel.showPoint(req.params.id);
            res.render("statistic",{key: req.session.profile,
                                    details:details[0],
                                    teacher: req.session.teacher,
                                    sid:studentId,
                                    showPoint: showPoint});
        }
        else{
            res.send('Vui lòng đăng nhập')
        }
    },
    addPoint: (req,res)=>{
        classModel.addPoint(req.body,req.params.id,(err,data)=>{
            if(!err){
                req.session.message = {
                    type: 'success',
                    message: '1 row has been added successfully!!! '
                }
                res.redirect("/statistic/" + req.params.id);
            }
            else{
                req.session.message = {
                    type: 'danger',
                    message: 'Something went wrong!!! '
                }
                res.send(err);
            }
        })
    },
    addSemester: (req,res)=>{
        classModel.addSemester(req.body,(err,data)=>{
            if(!err){
                req.session.message = {
                    type: 'success',
                    message: 'The new semester has been added successfully!!'
                }
                res.redirect("/statistic/" + req.params.id);
            }
            else{
                req.session.message = {
                    type: 'danger',
                    message: 'Something went wrong!!'
                }
                res.send(err);
            }
        })
    },
    delPoint: (req,res)=>{
        if(req.session.flag){
            classModel.delPoint(req.params.id,(err,data)=>{
                if(!err){
                    req.session.message = {
                        type: 'success',
                        message: '1 row has been deleted successfully!!'
                    }
                    res.redirect("/statistic/" + req.params.cid);
                }
                else{
                    req.session.message = {
                        type: 'danger',
                        message: 'Something went wrong!!'
                    }
                    res.send(err);
                }
            })
        }else{
            res.send("Vui lòng đăng nhập");
        }
        
    },
    showMember: async(req,res)=>{
        if(req.session.flag){
            let details = await classModel.showClassDetails(req.params.id);
            let member = await classModel.getAllMember(req.params.id);
            let quantity = await classModel.getQuantity(req.params.id);
            let gt = await classModel.getTeacher(req.params.id);
            res.render("member",{key: req.session.profile,
                                details:details[0],
                                teacher: req.session.teacher,
                                quantity:quantity,
                                gt:gt[0],
                                member:member});
        }
        else{
            res.send('Vui lòng đăng nhập')
        }
    },
    
}