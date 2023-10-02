module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/seccion.controller");

    router.get('/getSeccionByProgramaId', m.getSeccionByProgramaId);
    router.get('/getObjetoByProgramaId', m.getObjetoByProgramaId);
    router.get('/getObjetoBySeccionId', m.getObjetoBySeccionId);
    router.post('/getPerfilEgresoByProgramaId', m.getPerfilEgresoByProgramaId);
    router.post('/getObjetivoGeneralByProgramaId', m.getObjetivoGeneralByProgramaId);
    router.post('/getObjetivoEducacionalByProgramaId', m.getObjetivoEducacionalByProgramaId);
    router.post('/getMisionByProgramaId', m.getMisionByProgramaId);
    router.post('/getVisionByProgramaId', m.getVisionByProgramaId);
    router.post('/getReticulaByProgramaId', m.getReticulaByProgramaId);
    router.post('/crudSeccion', m.crudSeccion);
    router.post('/crudObjeto', m.crudObjeto);
    router.post('/crudSeccionMasivo', m.crudSeccionMasivo);
    router.post('/crudObjetoMasivo', m.crudObjetoMasivo);

    app.use('/api/seccion', router);
}