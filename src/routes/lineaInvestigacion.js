module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/lineaInvestigacion.controller");

    router.get('/getLineasByProgramaId', m.getLineasByProgramaId);
    router.get('/getLineasInvestigacion', m.getLineasInvestigacion);
    router.post('/getLineaInvestigacionByProgramaId', m.getLineaInvestigacionByProgramaId);
    router.post('/crudLineaInv', m.crudLineaInv);
    router.post('/crudLineasInvMasivo', m.crudLineasInvMasivo);

    app.use('/api/lineaInvestigacion', router);
}