module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/seccion.controller");

    router.get('/getSeccionByProgramaId', m.getSeccionByProgramaId);
    router.get('/getObjetoByProgramaId', m.getObjetoByProgramaId);
    router.get('/getObjetoBySeccionId', m.getObjetoBySeccionId);
    router.post('/crudSeccion', m.crudSeccion);
    router.post('/crudObjeto', m.crudObjeto);
    router.post('/crudSeccionMasivo', m.crudSeccionMasivo);
    router.post('/crudObjetoMasivo', m.crudObjetoMasivo);

    app.use('/api/seccion', router);
}