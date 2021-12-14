module.exports = function(app){
    const profileController = require("../controllers/profileController");

    // edit profile teacher
    app.get("/view_profile", profileController.showProfile);
    app.post("/view_profile/:id", profileController.editProfile);

    // changePass for student
    app.get("/changePassword", profileController.showChangePassword);
    app.post("/changePassword", profileController.changePassword);
}