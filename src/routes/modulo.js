module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/modulo.controller");

    router.get('/getModulos', m.getModulos);
    router.post('/crudModulo', m.crudModulo);

    app.use('/api/modulo', router);
}