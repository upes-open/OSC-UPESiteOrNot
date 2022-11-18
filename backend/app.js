var express = require('express'),
    path = require('path'),
    session = require('express-session'),
    cookieParser = require('cookie-parser'),
    bodyParser = require('body-parser'),
    methodOverride = require('method-override'),
    passport = require('passport'),
    util = require('util'),
    OutlookStrategy = require('passport-outlook').Strategy;

var OUTLOOK_CLIENT_ID = "075caae7-9b73-4e8a-b342-174654225149"
var OUTLOOK_CLIENT_SECRET = "HHj8Q~Rlx.IcK7R.ARFs~YOmDyg4Qb-JR94UqbG9" // TODO: Add your client secret here

// Passport session setup.
passport.serializeUser(function(user, done) {
    done(null, user);
});

passport.deserializeUser(function(obj, done) {
    done(null, obj);
});

// Use the OutlookStrategy within Passport.
passport.use(new OutlookStrategy({
        cliendID: OUTLOOK_CLIENT_ID,
        clientSecret: OUTLOOK_CLIENT_SECRET,
        callbackURL: "http://localhost:3000/auth/outlook/callback"
    },
    function(accessToken, refreshToken, profile, done) {
        process.nextTick(function() {
            return done(null, profile);
        })
    }
));
// Configure Express application. 
var app = express();

// Configure view engine to render EJS templates.
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');
app.use(cookieParser());
app.use(bodyParser());
app.use(methodOverride());
app.use(session({ secret: 'keyboard cat' }));
app.use(passport.initialize());
app.use(passport.session());
app.use(express.static(__dirname + '/public'));

// GET /auth/outlook 
app.get('/', function(req, res) {
    res.render('index', { user: req.user })
});

// GET /auth/outlook
app.get('/account', ensureAuthenticated, function(req, res) {
    res.render('account', { user: req.user });
});

app.get('/login', function(req, res) {
    res.render("login", { user: req.user });
});
// GET /auth/outlook 
app.get('/auth/outlook', passport.authenticate(
        'windowslive', {
            scope: [
                'openid ',
                'profile ',
                'offline_access ',
                'https: //outlook.office.com/Mail.Read'
            ]
        }),
    function(req, res) {

    });


// GET /auth/outlook/callback
app.get('auth/outlook/callback', passport.authenticate('windowslive', { failureRedirect: '/login' }),
    function(req, res) {
        res.redirect('/')
    });

app.get('/logout', function(req, res) {
    req.logout();
    res.redirect('/');
});

// Start server 
app.listen(3000);

// Simple route middleware to ensure user is authenticated. 
function ensureAuthenticated(req, res, next) {
    if (req.isAuthenticated()) {
        return next();
    }
    res.redirect('/login');
}