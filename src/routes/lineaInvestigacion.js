module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/lineaInvestigacion.controller");

    router.get('/getLineasInvByProgramaId', m.getLineasInvByProgramaId);
    router.get('/getLineasInvestigacion', m.getLineasInvestigacion);
    router.get('/getLineaById', m.getLineaById);
    router.post('/crudLineaInv', m.crudLineaInv);
    router.post('/crudLineasInvMasivo', m.crudLineasInvMasivo);

    app.use('/api/lineaInvestigacion', router);
}