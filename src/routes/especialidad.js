module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/especialidad.controller");

    router.get('/getEspecialidadesByCarrera', m.getEspecialidadesByCarrera);
    router.get('/getEspecialidades', m.getEspecialidades);
    router.post('/crudEspecialidad', m.crudEspecialidad);

    app.use('/api/especialidad', router);
}