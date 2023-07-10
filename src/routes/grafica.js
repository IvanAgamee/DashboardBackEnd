module.exports = app => {
    var router = require('express').Router();
    var gc = require("../controllers/graficas.controller");

    router.get('/getTotalUsuarios', gc.getTotalUsuarios);
    router.get('/getTotalDocentesByCarreraID', gc.getTotalDocentesByCarreraID);
    router.get('/getTotalDocentes', gc.getTotalDocentes);
    router.get('/getTotalMaterias', gc.getTotalMaterias);
    router.get('/getTotalCarreras', gc.getTotalCarreras);
    router.get('/getTotalMateriasByCarreraId', gc.getTotalMateriasByCarreraId);
    router.get('/getTotalComunidades', gc.getTotalComunidades);

    app.use('/api/grafica', router);
}