module.exports = app => {
    var router = require('express').Router();
    var main = require("../controllers/main.controller");

    router.get('/getTotalUsuarios', main.getTotalUsuarios);
    router.get('/getTotalDocentesByCarreraID', main.getTotalDocentesByCarreraID);
    router.get('/getTotalDocentes', main.getTotalDocentes);
    router.get('/getTotalMaterias', main.getTotalMaterias);
    router.get('/getTotalCarreras', main.getTotalCarreras);
    router.get('/getTotalMateriasByCarreraId', main.getTotalMateriasByCarreraId);
    router.get('/getTotalComunidades', main.getTotalComunidades);

    //Obtiene el file desde el storage
    router.post("/getFileFromStorage", main.getFileFromStorage);
    router.post("/removeFileFromStorage", main.removeFileFromStorage);

    app.use('/api/main', router);
}