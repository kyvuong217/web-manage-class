module.exports = function(app){
    const siteController = require("../controllers/siteController");
    app.get("/", siteController.showHome);
    app.get("/login", siteController.showLogin);
    // login DB1
    app.post("/login", siteController.login);
    app.get("/dashboard", siteController.showDashboard);
    //login DB2
    app.get("/std_dashboard", siteController.showDashboard2);
    //logout
    app.get("/logout",siteController.logOut);
}