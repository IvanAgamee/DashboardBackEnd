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

            let pathStorage = PATH_COMUNIDAD + '/' + m.getFolderPrograma(req.query.programaId);

            if (!fs.existsSync(pathStorage)) {
                fs.mkdirSync(pathStorage);
            }

            pathStorage = pathStorage + '/comunidades/';

            if (!fs.existsSync(pathStorage)) {
                fs.mkdirSync(pathStorage);
            }

            let comunidadNombre =  req.body.comunidadNombre.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
            comunidadNombre =  comunidadNombre.replace(/\s+/g, "");  
            pathStorage = pathStorage + comunidadNombre;

            if (!fs.existsSync(pathStorage)) {
                fs.mkdirSync(pathStorage);
            }

            callBack(null, pathStorage);

        },
        filename: (req, file, callBack) => {
           
            let nameFile = `${file.originalname}`;
            nameFile = nameFile.replace(/['"]+/g, '-').replace(/ /g, '-');

            callBack(null, nameFile);
        },
    });

    const upload = multer({ storage: storage });

    router.post("/uploadFiles", upload.array("files", 2), c.uploadFiles);
    router.get('/getComunidadByProgramaId', c.getComunidadByProgramaId);
    router.post('/crudComunidad', c.crudComunidad);
    router.post('/crudComunidadMasivo', c.crudComunidadMasivo);
    router.get('/getComunidadById', c.getComunidadById);
    app.use('/api/comunidad', router);
}