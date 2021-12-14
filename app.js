//Set server
global.__basedir = __dirname;
const express = require('express');
const app = express();
app.listen(3000, () => console.log(`Browser is running at port 3000`));

//set body-parser

const path = require('path')
const fs = require('fs');

const bodyParser = require('body-parser');
app.use(express.urlencoded({extended:true}));
app.use(express.json());

//set flash
const { flash } = require('express-flash-message');
// app.use(flash({ sessionKeyName: 'flashMessage'}));
//excel config
const excel = require('excel4node');


//set session
const session = require('express-session');
app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));

//stactic folder
app.use(express.static('public'));
app.use('/css', express.static(__dirname + 'public/css'));
app.use('/js', express.static(__dirname + 'public/js'));
app.use('/img', express.static(__dirname + 'public/img'));
//flash message middleware
app.use((req,res, next)=>{
	res.locals.message = req.session.message
	delete req.session.message
	next()
})
//Set View
app.set('views',  'views');
app.set('view engine', 'ejs');

//Route
require("./routes/siteRouter")(app);
require("./routes/profileRouter")(app);
require("./routes/classRouter")(app);
require("./routes/studentRouter")(app)
