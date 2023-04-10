module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/modulo.controller");

    router.get('/getModulos', m.getModulos);

    app.use('/api/modulo', router);
}