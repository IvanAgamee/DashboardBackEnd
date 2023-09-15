module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/programaEstudio.controller");

    router.get('/getProgramas', m.getProgramas);
    router.post('/crudPrograma', m.crudPrograma);
    router.post('/getProgramasByDepartment', m.getProgramasByDeparment);
    router.post('/crudProgramaMasivo', m.crudProgramaMasivo);
    app.use('/api/programa', router);
}