var express = require('express');
var app = express();

// Only works when run:-
// $ npm run static
// $ npm run dev
// On https://localhost:8080, click dist
app.set('views', __dirname + '/src');
app.set('view engine', 'jade');
app.get('/', function(req, res) {
    // Renders src/index.jade
    res.render('index', { prod: process.env.NODE_ENV === 'production' });
});

// Start server
app.set('port', (process.env.PORT || 5000));
app.listen(app.get('port'));
