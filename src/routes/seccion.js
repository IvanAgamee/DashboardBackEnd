module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/seccion.controller");

    // router.get('/getCarreras', m.getCarreras);
    router.post('/crudSeccion', m.crudSeccion);
    router.post('/crudObjeto', m.crudObjeto);

    app.use('/api/seccion', router);
}