module.exports = app => {
    var router = require('express').Router();
    var m = require("../controllers/materia.controller");
    router.get('/getMaterias', m.getMaterias);
    router.get('/getMateriaById', m.getMateriaById);
    router.post('/getMateriasByProgramaId', m.getMateriasByProgramaId);
    router.post('/getMateriasByEspecialidadId', m.getMateriasByEspecialidadId);
    router.post('/getMateriasBySemestre', m.getMateriasBySemestre);
    router.post('/crudMateria', m.crudMateria);
    router.post('/crudMateriaMasivo', m.crudMateriaMasivo);
    app.use('/api/materia', router);
}