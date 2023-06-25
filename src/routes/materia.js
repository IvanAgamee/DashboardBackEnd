module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/materia.controller");

    router.get('/getMaterias', m.getMaterias);
    router.post('/crudMateria', m.crudMateria);
    router.post('/getMateriasByCarreraId', m.getMateriasByCarreraId);

    app.use('/api/materia', router);
}