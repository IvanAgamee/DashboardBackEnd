const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Comunidad = require('../models/Comunidad');
var m = require("../controllers/main.controller");

exports.crudComunidadMasivo = async (req, res) => {
    let comunidades = req.body;
    const comunidadesAsync = async (comunidad) => {
        try {
            if (comunidad.comunidadId == null) { // En caso de que el id sea nulo, se crea nueva comunidad.
                let newComunidad = await Comunidad.create(comunidad);

            } else if (comunidad.comunidadId) { // En caso de que el id NO sea nulo, se actualiza el comunidad.
                let comunidadId = comunidad.comunidadId;
                delete comunidad.comunidadId;

                let updatedComunidad = await Comunidad.update(comunidad, {
                    where: {
                        comunidadId: comunidadId
                    }
                });
            }
        } catch (e) {
            console.log(e);
            return res.status(500).json({
                success: false,
                message: "Ha ocurrido un error al guardar el registro.",
                error: e.message,
            });
        }
    }
    if (comunidades != undefined) {
        return Promise.all(comunidades.map(comunidadesAsync)) // Mapeo de los docentes, se aplica la función anterior
            .then(result => {
                return res.json({
                    success: true,
                    message: `Se guardó correctamente las comunidades.`,
                });
            }).catch(error => {
                console.log(error)
                return res.json({
                    success: false,
                    message: `Ha ocurrido un error al guardar las comunidades.`,
                    error: error
                });
            })
    } else { // En caso de que no existan datos, se retorna el mensaje.
        return [{
            success: true,
            message: `No existen comunidades.`,
        }];
    }
};

exports.crudComunidad = async (req, res) => {
    try {
        let comunidad = req.body;
        if (comunidad.comunidadId == null) { // En caso de que el id sea nulo, se crea nueva comunidad.
            let newComunidad = await Comunidad.create(comunidad);
            if (newComunidad) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado la comunidad.",
                });
            }
        } else if (comunidad.comunidadId) { // En caso de que el id NO sea nulo, se actualiza el comunidad.
            let comunidadId = comunidad.comunidadId;
            delete comunidad.comunidadId;

            let updatedComunidad = await Comunidad.update(comunidad, {
                where: {
                    comunidadId: comunidadId
                }
            });
            if (updatedComunidad) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado la comunidad.",
                });
            }
        }
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al guardar el registro.",
            error: e.message,
        });
    }

};

exports.getComunidadByProgramaId = async (req, res) => {
    try {
        let programaId = req.query.programaId;
        const comunidad = await Comunidad.findAll({
            where: {
                status: 1,
                programaId: programaId
            }
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: comunidad,
        });
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al obtener los registros.",
            error: e.message,
        });
    }
};

exports.getComunidadById = async (req, res) => {
    try {
        let comunidadId = req.query.comunidadId;
        let comunidad = await Comunidad.findByPk(comunidadId, {
            where: {
                status: 1
            }
        });

        if (comunidad != null) {
            const pathFile = m.getFolderPrograma(comunidad.dataValues.programaId);
            comunidad.dataValues.pathFile = pathFile + '/comunidades/';

            comunidad.dataValues.fotosComunidad = comunidad.dataValues.fotosComunidad ? comunidad.dataValues.fotosComunidad.split(',') : '';

            return res.json({
                success: true,
                message: "Se han encontrado registros.",
                data: comunidad
            });
        }
        else {
            return res.json({
                success: false,
                message: "No se encontro un docente con ese ID"
            });
        }

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: comunidad,
        });
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al obtener los registros.",
            error: e.message,
        });
    }
};

exports.uploadFiles = async (req, res) => {
    try {
        const { body, files } = req;
        let nameFiles = [];

        if (!files) {
            const error = new Error("No File");
            logError.error(`Error ${error}`);
        }

        let filepath = m.getFolderPrograma(req.query.programaId);
        filepath = filepath + '/comunidades';

        let comunidadNombre = body.comunidadNombre.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
        comunidadNombre = comunidadNombre.replace(/\s+/g, "");

        files.forEach((f) => {
            let nameFile = `${comunidadNombre}/${f.originalname}`;
            nameFile = nameFile.replace(/['"]+/g, '-').replace(/ /g, '-');
            nameFiles.push(nameFile);
        });

        res.send({
            success: true,
            message: "Se ha subido correctamente",
            filenames: nameFiles,
            pathFile: filepath
        });
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al subir el archivo",
            error: e.message,
        });
    }
};