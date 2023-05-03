const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const morgan = require('morgan');
// parse requests of content-type - application/json
app.use(express.json());
// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

app.use(morgan('dev'));

app.get("/", (req, res) => {
    res.json({ message: "Server Up." });
});

// Lista de rutas
require('./routes/modulo')(app);
require('./routes/docente')(app);
require('./routes/materia')(app);
require('./routes/carrera')(app);
require('./routes/especialidad')(app);

// set port, listen for requests

module.exports = app;