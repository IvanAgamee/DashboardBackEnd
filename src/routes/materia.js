module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/materia.controller");

    router.get('/getMaterias', m.getMaterias);
    router.post('/crudMateria', m.crudMateria);

    app.use('/api/materia', router);
}