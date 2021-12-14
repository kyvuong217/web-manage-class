const consql = require("../databases/database");
const excel = require('excel4node');
const ws = require('ws')
const studentModel = require("../models/studentModel");
module.exports = {
    showAddStudent: (req, res)=>{
        res.render("addStudent",{ key: req.session.profile});
    },
    addStudent: (req,res)=>{
        if(req.session.flag){
            studentModel.addStudent(req.body,(err,data)=>{
                if(!err){
                    req.session.message = {
                        type: 'success',
                        message: 'Added a new student successfully '
                    }
                    res.redirect("/addStudent");
                }
                else{
                    req.session.message = {
                        type: 'danger',
                        message: 'Something went wrong !!',
                    }
                    res.send(err);
                }
            })
        }else{
            res.send("Vui lòng đăng nhập lại")
        }
    },

    showProfile: async(req, res)=>{
        if(req.session.flag){
            let data = await studentModel.showProfile(req.session.profile.sid);  
            res.render("edit_profile",{ key: req.session.profile,data:data[0]});
        }
        else{
            res.send('Vui lòng đăng nhập')
        }
    },

    showAddmore: (req, res)=>{
        
        res.render("addmore",{ key: req.session.profile});
    },
    addmore: (req,res)=>{
        studentModel.addmore(req.body,(err,data)=>{
            if(!err){
                req.session.message = {
                    type: 'success',
                    message: 'Parent information has been added successfully'
                }
                res.redirect("/edit_profile/" + req.params.id);
            }
            else{
                res.send(err);
            }
        })
    },
    editProfile: (req,res)=>{
        if(req.session.flag){
            studentModel.editProfile(req.body,req.params.id,(err,data)=>{
                if(!err){
                    req.session.message = {
                        type: 'success',
                        message: 'Your profile has been updated successfully'
                    }
                    res.redirect("/edit_profile/" + req.params.id)
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
    viewClass: async(req, res)=>{
        if(req.session.flag){
            let classroom = await studentModel.viewClass(req.session.profile.sid);
            return res.render("s-classroom",{ key: req.session.profile,classroom:classroom});
        }
        else{
            res.send('Vui lòng đăng nhập')
        }
        
    },
    //upload controller
    importExcelData2MySQL:(req,res)=>{
        studentModel.importExcelData2MySQL(__basedir + '/uploads/' + req.file.filename,(err,data)=>{
            if(!err){
                req.session.message = {
                    type: 'success',
                    message: 'Import data from excel file successfully'
                }
                res.redirect("/addStudent");
            }
            else{
                res.send(err);
            }
        })

    },
    createExcelFile:(req,res)=>{
        // Create a new instance of a Workbook class
        
        var workbook = new excel.Workbook();

        // Add Worksheets to the workbook
        var worksheet = workbook.addWorksheet('Sheet 1');

        var wscols = [ {wch:50}, {wch:30}, {wch:40}, {wch:30},{wch:10}, {wch:10}];
        ws['!cols'] = wscols;
        
        var style = workbook.createStyle({

        font: {
            size: 13,
            bold: true,
            wch:20

        },
        });
        // ws['!cols'] = wscols;
        // Set value of cell A1 to 100 as a number type styled with paramaters of style
        worksheet.cell(1,1).string('Student ID').style(style)

        // Set value of cell B1 to 300 as a number type styled with paramaters of style
        worksheet.cell(1,2).string('Name').style(style);

        // Set value of cell C1 to a formula styled with paramaters of style
        worksheet.cell(1,3).string('Dob').style(style);

        // Set value of cell A2 to 'string' styled with paramaters of style
        worksheet.cell(1,4).string('Email').style(style);
        worksheet.cell(1,5).string('Password').style(style);
        worksheet.cell(1,6).string('Phone').style(style);
        worksheet.cell(1,7).string('Workplace').style(style);



        // Set value of cell A3 to true as a boolean type styled with paramaters of style but with an adjustment to the font size.
        workbook.write('StudentList.xlsx');
        res.send("<a href='/StudentList.xlsx' download id='download-link'><script>document.getElementById('download-link').click();</script></a>")
    }
}