module.exports = app => {
    var router = require('express').Router();
    var uc = require("../controllers/usuario.controller");
    var { validateParams } = require('../middlewares/params_valdiation');

    router.post('/login', validateParams([
        { param_key: 'username', required: true, type: 'string', validator_functions: [] },
        { param_key: 'password', required: true, type: 'string', validator_functions: [] }
    ]), uc.login);
    router.get('/getUsers', uc.getUsers);
    router.get('/getUserById', uc.getUserById);
    router.post('/crudUser', uc.crudUser);

    app.use('/api/usuario', router);
}