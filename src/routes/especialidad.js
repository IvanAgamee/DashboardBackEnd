module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/especialidad.controller");

    router.get('/getEspecialidadesByProgramaId', m.getEspecialidadesByProgramaId);
    router.get('/getEspecialidades', m.getEspecialidades);
    router.post('/getEspecialidadByProgramaId', m.getEspecialidadByProgramaId);
    router.post('/crudEspecialidad', m.crudEspecialidad);
    router.post('/crudEspecialidadMasivo', m.crudEspecialidadMasivo);

    app.use('/api/especialidad', router);
}