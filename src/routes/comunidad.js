module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/comunidad.controller");

    router.get('/geComunidadByCarreraId', m.geComunidadByCarreraId);
    router.post('/crudComunidad', m.crudComunidad);
    router.post('/crudComunidadMasivo', m.crudComunidadMasivo);

    app.use('/api/comunidad', router);
}