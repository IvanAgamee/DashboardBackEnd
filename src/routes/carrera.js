module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/carrera.controller");

    router.get('/getCarreras', m.getCarreras);
    router.post('/crudCarrera', m.crudCarrera);
    router.post('/getCarrerasByDepartment', m.getCarrerasByDeparment);

    app.use('/api/carrera', router);
}