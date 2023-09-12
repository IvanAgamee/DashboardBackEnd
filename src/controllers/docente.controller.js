const { Sequelize } = require('sequelize');
const sequalize = require("../database/database");
const Docente = require('../models/Docente');
const ProgramaDocente = require('../models/ProgramaDocente');
var m = require("../controllers/main.controller");
const PATH_STORAGE = `${__dirname}/../storage`;
const path = require('path');

exports.getSistemasDocentes = async (req, res) => {
    try {
        const docentes = await Docente.findAll({
            where: {
                status: 1,
            },
            include: [{
                model: ProgramaDocente,
                as: 'ProgramaDocente',
                attributes: [],
                where: { status: 1, programaId: 11 }
            }]
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: docentes,
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

exports.getDocentes = async (req, res) => {
    try {
        const docentes = await Docente.findAll({
            where: {
                status: 1,
            },
            include: [{
                model: ProgramaDocente,
                as: 'ProgramaDocente',
                attributes: [],
                where: { status: 1 }
            }]
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: docentes,
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

exports.getDocenteById = async (req, res) => {
    try {
        const { docenteId } = req.body;
        const docente = await Docente.findByPk(docenteId,
            {
                attributes: {
                    include: [
                        [sequalize.literal('ProgramaDocente.programaId'), 'programaId']
                    ]
                },
                include: [{
                    model: ProgramaDocente,
                    attributes: [],
                    as: "ProgramaDocente",
                    where: {
                        status: 1
                    }
                }]
            });

        if (docente != null) {
            if (docente.dataValues.urlImagen) {
                const pathFile = m.getFolderCarrera(docente.dataValues.programaId);
                docente.dataValues.pathFile = pathFile + '/docentes';
            }
            return res.json({
                success: true,
                message: "Se han encontrado registros.",
                data: docente
            });
        }
        else {
            return res.json({
                success: false,
                message: "No se encontro un docente con ese ID"
            });
        }
    }
    catch (e) {
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al obtener los registros.",
            error: e.message,
        });
    }
};

exports.getDocentesByCarreraId = async (req, res) => {
    try {
        let { programaId, offset, limit } = req.body;

        const docentes = await Docente.findAll({
            offset, limit, subQuery: false,
            where: {
                status: 1,
            },
            attributes: {
                include: [
                    [sequalize.literal('programaDocente.programaId'), 'programaId']
                ]
            },
            include: [{
                model: ProgramaDocente,
                attributes: [],
                as: "programaDocente",
                where: {
                    status: 1,
                    programaId: programaId
                }
            }]
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: docentes,
            count: docentes.length
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

exports.crudDocente = async (req, res) => {
    try {
        let docente = req.body; // Guarda los datos del docente en la variable

        if (docente.docenteId == null) { // En caso de que el id sea nulo, se crea un nuevo docente.
            let newDocente = await Docente.create(docente);
            if (newDocente) {
                let data = {
                    docenteId: newDocente.docenteId,
                    programaId: docente.programaId,
                    status: 1
                }
                let carreraDocente = await ProgramaDocente.create(data);

                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado el docente",
                });
            }
        } else if (docente.docenteId) { // En caso de que el id NO sea nulo, se actualiza el docente.
            let docenteId = docente.docenteId;
            delete docente.docenteId;

            const updatedDocente = await Docente.update(docente, {
                where: {
                    docenteId: docenteId
                }
            });
            if (updatedDocente) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado el docente.",
                    docente: updatedDocente
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

exports.crudDocenteMasivo = async (req, res) => {
    let docentes = req.body;
    const docentesAsync = async (docente) => {
        try {
            // let docente = req.body; // Guarda los datos del docente en la variable

            if (docente.docenteId == null) { // En caso de que el id sea nulo, se crea un nuevo docente.
                docente.urlImagen = docente.urlImagen ? docente.urlImagen : 'user.webp';
                let newDocente = await Docente.create(docente);
                if (newDocente) {

                    let data = {
                        docenteId: newDocente.docenteId,
                        programaId: docente.programaId,
                        status: 1
                    }
                    let programaDocente = await ProgramaDocente.create(data);

                }
            } else if (docente.docenteId) { // En caso de que el id NO sea nulo, se actualiza el docente.
                let docenteId = docente.docenteId;
                delete docente.docenteId;

                let updatedDocente = await Docente.update(docente, {
                    where: {
                        docenteId: docenteId
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
    if (docentes != undefined) {
        return Promise.all(docentes.map(docentesAsync)) // Mapeo de los docentes, se aplica la función anterior
            .then(result => {
                return res.json({
                    success: true,
                    message: `Se guardó correctamente los docentes.`,
                });
            }).catch(error => {
                console.log(error)
                return res.json({
                    success: false,
                    message: `Ha ocurrido un error al guardar los docentes.`,
                    error: error
                });
            })
    } else { // En caso de que no existan datos, se retorna el mensaje.
        return [{
            success: true,
            message: `No existen docentes.`,
        }];
    }
};

exports.uploadDocenteImage = async (req, res) => {
    try {
        const { body, file } = req;

        if (!file) {
            const error = new Error("No File");
        }
        let filepath = m.getFolderCarrera(req.query.programaId);
        filepath = filepath + '/docentes';

        const originalName = file.originalname;
        const lastDotIndex = originalName.lastIndexOf(".");
        const result = originalName.slice(lastDotIndex + 1);

        let nameFile = `${body.docenteNombre}.${result}`;
        nameFile = nameFile.replace(/['"]+/g, '').replace(/ /g, '-');

        const fileData = {
            success: true,
            message: "Se ha subido correctamente",
            nameFile: nameFile,
            pathFile: filepath
        };

        res.send({ fileData });
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al subir el archivo",
            error: e.message,
            file: req.body.file
        });
    }
};