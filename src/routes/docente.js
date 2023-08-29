module.exports = app => {
  var router = require('express').Router();
  var m = require("../controllers/docente.controller");
  const multer = require("multer");
  const path = require('path');
  const PATH_DOCENTE = `${__dirname}/../storage/docentes`;

  const storage = multer.diskStorage({
    destination: (req, file, callBack) => {
      let carreraNombre = m.getFolderDocente(req.body.carreraNombre);
      callBack(null, PATH_DOCENTE + '/' + carreraNombre);
    },
    filename: (req, file, callBack) => {

      const originalName = file.originalname ? file.originalname : file.name;
      const lastDotIndex = originalName.lastIndexOf(".");
      const result = originalName.slice(lastDotIndex + 1);

      let nameFile = `${req.body.docenteNombre}.${result}`;
      nameFile = nameFile.replace(/['"]+/g, '').replace(/ /g, '-');

      callBack(null, nameFile);
    },
  });

  const upload = multer({ storage: storage });

  router.post("/uploadDocenteImage", upload.single("file"), m.uploadDocenteImage);
  router.get('/getSistemasDocentes', m.getSistemasDocentes);
  router.get('/getDocentes', m.getDocentes);
  router.post('/getDocenteById', m.getDocenteById);
  router.post('/getDocentesByCarreraId', m.getDocentesByCarreraId);
  router.post('/crudDocente', m.crudDocente);
  router.post('/crudDocenteMasivo', m.crudDocenteMasivo);
  router.post('/updateImage', m.updateImage);

  app.use('/api/docente', router);
}