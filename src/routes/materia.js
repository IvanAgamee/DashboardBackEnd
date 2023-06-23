module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/materia.controller");

    router.get('/getMaterias', m.getMaterias);
    router.get('/getMateriasByCarreraId', m.getMateriasByCarreraId);
    router.post('/crudMateria', m.crudMateria);
    router.post('/crudMateriaMasivo', m.crudMateriaMasivo);

    app.use('/api/materia', router);
}