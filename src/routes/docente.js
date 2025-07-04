module.exports = app => {
  var router = require('express').Router();
  var d = require("../controllers/docente.controller");
  var m = require("../controllers/main.controller");
  const multer = require("multer");
  const path = require('path');
  const PATH_DOCENTE = `${__dirname}/../storage`;
  const fs = require('fs')
  const moment = require("moment");

  const storage = multer.diskStorage({
    destination: (req, file, callBack) => {

      let pathStorage = PATH_DOCENTE + '/' + m.getFolderPrograma(req.query.programaId);

      if (!fs.existsSync(pathStorage)) {
        fs.mkdirSync(pathStorage);
      }
      
      pathStorage = pathStorage + '/docentes';

      if (!fs.existsSync(pathStorage)) {
        fs.mkdirSync(pathStorage);
      }

      callBack(null, pathStorage);
    },
    filename: (req, file, callBack) => {

      const originalName = file.originalname;
      const lastDotIndex = originalName.lastIndexOf(".");
      const result = originalName.slice(lastDotIndex + 1);

      let nameFile = `${req.body.docenteNombre}-${moment().format('DDMMYYYY')}.${result}`;
      nameFile = nameFile.replace(/['"]+/g, '-').replace(/ /g, '-');
      callBack(null, nameFile);
    },
  });

  const upload = multer({ storage: storage });

  router.post("/uploadDocenteImage", upload.single("file"), d.uploadDocenteImage);
  router.get('/getSistemasDocentes', d.getSistemasDocentes);
  router.get('/getDocentes', d.getDocentes);
  router.post('/getDocenteById', d.getDocenteById);
  router.post('/getDocentesByProgramaId', d.getDocentesByProgramaId);
  router.post('/crudDocente', d.crudDocente);
  router.post('/crudDocenteMasivo', d.crudDocenteMasivo);

  app.use('/api/docente', router);
}