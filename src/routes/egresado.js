module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/egresado.controller");

    router.post('/getUltimas5Gen', m.getUltimas5Gen);

    app.use('/api/egresado', router);
}