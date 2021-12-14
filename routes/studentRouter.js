module.exports = function(app){
    const multer = require('multer');
    const storage = multer.diskStorage({
    destination: (req, file, cb) => {
    cb(null, __basedir + '/uploads/')
    },
    filename: (req, file, cb) => {
    cb(null, file.fieldname + "-" + Date.now() + "-" + file.originalname)
    }
    });
    const upload = multer({ storage: storage })


    const studentController = require("../controllers/studentController");

    // add student
    app.get("/addStudent", studentController.showAddStudent);
    app.post("/addStudent", studentController.addStudent);
    app.post("/addmore/:id",studentController.addmore);

    // edit profile student
    app.get("/edit_profile/:id",studentController.showProfile);
    app.post("/edit_profile/:id",studentController.editProfile);

    //Url to upload
    app.post('/uploadfile',upload.single('uploadfile'), studentController.importExcelData2MySQL );
    app.get("/excelConfig",studentController.createExcelFile);
    
    //about classroom
    app.get("/class4student",studentController.viewClass)

}