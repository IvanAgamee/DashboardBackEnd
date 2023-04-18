module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/docente.controller");

    router.get('/getDocentes', m.getDocentes);
    router.post('/crudDocente', m.crudDocente);

    app.use('/api/docente', router);
}