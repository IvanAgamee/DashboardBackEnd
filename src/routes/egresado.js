module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/egresado.controller");

    router.post('/getUltimas5Gen', m.getUltimas5Gen);
    router.post('/crudGenEgresadaMasivo', m.crudGenEgresadaMasivo);
    router.post('/crudEgresadoMasivo', m.crudEgresadoMasivo);

    app.use('/api/egresado', router);
}