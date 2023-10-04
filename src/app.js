const express = require("express");
const path = require("path");
const app = express();
const bodyParser = require("body-parser");
const morgan = require('morgan');
const cors = require("cors");
var corsOptions = {
    origin: "http://localhost:9000"
};
app.use(cors(corsOptions));
// parse requests of content-type - application/json
app.use(express.json());
// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));
app.use('/imagenes',express.static(path.join(__dirname,'storage')));
app.use(morgan('dev'));

app.get("/", (req, res) => {
    res.json({ message: "Server Up." });
});

// Lista de rutas de carretas
require('./routes/administrativo')(app);
require('./routes/lineaInvestigacion')(app);
require('./routes/egresado')(app);
require('./routes/comunidad')(app);
require('./routes/seccion')(app);
require('./routes/modulo')(app);
require('./routes/docente')(app);
require('./routes/materia')(app);
require('./routes/programa')(app);
require('./routes/departamento')(app);
require('./routes/especialidad')(app);
require('./routes/usuario')(app);
require('./routes/main')(app);

// set port, listen for requests

module.exports = app;