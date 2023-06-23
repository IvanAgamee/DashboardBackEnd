module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/departamento.controller");

    router.get('/getDepartamentos', m.getDepartamentos);
    router.get('/getDepartamentoById', m.getDepartamentoById);
    router.post('/crudDepartamento', m.crudDepartamento);
    router.post('/crudDepartamentoMasivo', m.crudDepartamentoMasivo);

    app.use('/api/departamento', router);
}