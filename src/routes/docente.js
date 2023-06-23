module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/docente.controller");

    router.get('/getSistemasDocentes', m.getSistemasDocentes);
    router.get('/getDocentes', m.getDocentes);
    router.get('/getDocentesByCarreraId', m.getDocentesByCarreraId);
    router.post('/crudDocente', m.crudDocente);
    router.post('/crudDocenteMasivo', m.crudDocenteMasivo);
    router.post('/updateImage', m.updateImage);

    app.use('/api/docente', router);
}