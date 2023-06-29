module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/especialidad.controller");

    router.get('/getEspecialidadesByCarreraId', m.getEspecialidadesByCarreraId);
    router.get('/getEspecialidades', m.getEspecialidades);
    router.post('/crudEspecialidad', m.crudEspecialidad);
    router.post('/crudEspecialidadMasivo', m.crudEspecialidadMasivo);

    app.use('/api/especialidad', router);
}