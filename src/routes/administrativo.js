module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/administrativo.controller");

    // router.get('/getCarreras', m.getCarreras);
    router.post('/crudAdministrativo', m.crudAdministrativo);

    app.use('/api/administrativo', router);
}