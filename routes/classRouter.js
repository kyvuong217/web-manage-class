module.exports = function(app){
    const classController = require("../controllers/classController");
    /*========= classroom server ========  */
    app.get("/classroom/:id",   classController.showClass);
    app.post("/classroom/:id",  classController.upStory);
    app.get("/delNews/:cid/:nid",  classController.delNews);
    app.post("/ChangeStory/:cid/:nid",  classController.fixStory);


    /*========= statistic server ========  */
    app.get("/statistic/:id", classController.statistic);
    app.post("/addPoint/:id",classController.addPoint);
    app.post("/addSemester/:id", classController.addSemester);
    app.get("/statistic/:cid/:id", classController.delPoint);


    /*========= comment server ========  */
    app.post("/comment/:id", classController.upComment);
    

    // everyone
    app.get("/member/:id", classController.showMember);

    /*========= addclass server ========  */
    app.get("/addclass",    classController.showAddClass);
    app.post("/addclass",   classController.addClass);
    app.get("/addclass/:id",classController.deleteClass);
    app.post("/addclass/:id",classController.editClass);
    app.post("/assignStudent", classController.assignStudent);
    
    /*========= about_classroom server ========  */
    app.get("/about_classroom",classController.viewClass);
    app.get("/editClass/:id", classController.showEdit);
    app.post("/editClass/:id", classController.editClass);
    /*============================================*/
 }