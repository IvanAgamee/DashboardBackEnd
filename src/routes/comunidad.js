module.exports = app => {
    var router = require('express').Router();
    var c = require("../controllers/comunidad.controller");
    var m = require("../controllers/main.controller");
    const multer = require("multer");
    const path = require('path');
    const PATH_COMUNIDAD = `${__dirname}/../storage`;
    const fs = require('fs');

    const storage = multer.diskStorage({
        destination: (req, file, callBack) => {
            let filepath = m.getFolderCarrera(req.query.carreraId);
            filepath = PATH_COMUNIDAD + '/' + filepath + '/comunidades/' + req.body.comunidadNombre;

            if (!fs.existsSync(filepath)) {
                // Crear la carpeta
                fs.mkdirSync(filepath);
            }

            callBack(null, filepath);
        },
        filename: (req, file, callBack) => {
            let nameFile = `${req.body.comunidadNombre}-${file.originalname}`;
            nameFile.replace(/['"]+/g, '-').replace(/ /g, '-');

            callBack(null, nameFile);
        },
    });

    const upload = multer({ storage: storage });

    router.post("/uploadFiles", upload.array("files[]", 5), c.uploadFiles);
    router.get('/getComunidadByCarreraId', c.getComunidadByCarreraId);
    router.post('/crudComunidad', c.crudComunidad);
    router.post('/crudComunidadMasivo', c.crudComunidadMasivo);
    router.get('/getComunidadById', c.getComunidadById);
    app.use('/api/comunidad', router);
}