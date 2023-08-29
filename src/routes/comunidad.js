module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/comunidad.controller");

    router.get('/getComunidadByCarreraId', m.getComunidadByCarreraId);
    router.post('/crudComunidad', m.crudComunidad);
    router.post('/crudComunidadMasivo', m.crudComunidadMasivo);
    router.get('/getComunidadById', m.getComunidadById);
    app.use('/api/comunidad', router);
}