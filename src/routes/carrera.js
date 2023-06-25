module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/carrera.controller");

    router.get('/getCarreras', m.getCarreras);
    router.post('/crudCarrera', m.crudCarrera);
<<<<<<< HEAD
    router.post('/crudCarreraMasivo', m.crudCarreraMasivo);
=======
    router.post('/getCarrerasByDepartment', m.getCarrerasByDeparment);
>>>>>>> c9643ea (Añadido de Endpoints)

    app.use('/api/carrera', router);
}