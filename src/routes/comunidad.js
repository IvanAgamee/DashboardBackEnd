module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/comunidad.controller");

    // router.get('/getCarreras', m.getCarreras);
    router.post('/crudComunidad', m.crudComunidad);

    app.use('/api/comunidad', router);
}