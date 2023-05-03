module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/departamento.controller");

    router.get('/getDepartamentos', m.getDepartamentos);
    router.post('/crudDepartamento', m.crudDepartamento);

    app.use('/api/departamento', router);
}