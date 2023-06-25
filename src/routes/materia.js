module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/materia.controller");

    router.get('/getMaterias', m.getMaterias);
    router.get('/getMateriasByCarreraId', m.getMateriasByCarreraId);
    router.post('/crudMateria', m.crudMateria);
<<<<<<< HEAD
    router.post('/crudMateriaMasivo', m.crudMateriaMasivo);
=======
    router.post('/getMateriasByCarreraId', m.getMateriasByCarreraId);
>>>>>>> c9643ea (Añadido de Endpoints)

    app.use('/api/materia', router);
}