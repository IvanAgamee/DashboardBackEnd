module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/administrativo.controller");

    router.get('/getAdministrativosByCarreraId', m.getAdministrativosByCarreraId);
    router.post('/crudAdministrativo', m.crudAdministrativo);
    router.post('/crudAdministrativoMasivo', m.crudAdministrativoMasivo);

    app.use('/api/administrativo', router);
}