const express = require("express");
const app = express();
// parse requests of content-type - application/json
app.use(express.json());
// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

app.get("/", (req, res) => {
    res.json({ message: "Server Up." });
});

// Lista de rutas
require('./routes/modulo')(app);

// set port, listen for requests

module.exports = app;