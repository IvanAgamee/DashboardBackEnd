module.exports = app => {
    var router = require('express').Router();
    var uc = require("../controllers/usuario.controller");
    var { validateParams } = require('../middlewares/params_valdiation');
    const multer = require("multer");
    const path = require('path');
    const PATH_USER = `${__dirname}/../storage/users`;
  
    const storage = multer.diskStorage({
      destination: (req, file, callBack) => {
        callBack(null, PATH_USER);
      },
      filename: (req, file, callBack) => {
        nameFile = file.originalname.replace(/['"]+/g, '').replace(/ /g, '-');  
        callBack(null, nameFile);
      },
    });

    const upload = multer({ storage: storage });
  
    router.post("/uploadProfileImage", upload.single("file"), uc.uploadProfileImage);

    router.post('/login', validateParams([
        { param_key: 'username', required: true, type: 'string', validator_functions: [] },
        { param_key: 'password', required: true, type: 'string', validator_functions: [] }
    ]), uc.login);
    router.get('/getUsers', uc.getUsers);
    router.get('/getUserById', uc.getUserById);
    router.post('/crudUser', uc.crudUser);

    app.use('/api/usuario', router);
}