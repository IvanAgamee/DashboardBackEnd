module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/seccion.controller");

    router.get('/getSeccionByCarreraId', m.getSeccionByCarreraId);
    router.get('/getObjetoByCarreraId', m.getObjetoByCarreraId);
    router.get('/getObjetoBySeccionId', m.getObjetoBySeccionId);
    router.post('/crudSeccion', m.crudSeccion);
    router.post('/crudObjeto', m.crudObjeto);
    router.post('/crudSeccionMasivo', m.crudSeccionMasivo);
    router.post('/crudObjetoMasivo', m.crudObjetoMasivo);

    app.use('/api/seccion', router);
}