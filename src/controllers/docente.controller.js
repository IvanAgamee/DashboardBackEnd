const { Sequelize } = require('sequelize');
const sequalize = require("../database/database");
const Docente = require('../models/Docente');
const CarreraDocente = require('../models/CarreraDocente');

exports.getSistemasDocentes = async (req, res) => {
    try {
        const docentes = await Docente.findAll({
            where: {
                status: 1,
            },
            include: [{
                model: CarreraDocente,
                attributes: [],
                where: { status: 1, carreraId: 11 }
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
                model: CarreraDocente,
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

exports.getDocentesByCarreraId = async (req, res) => {
    try {
        let carreraId = req.query.carreraId;
        const docentes = await Docente.findAll({
            where: {
                status: 1,
            },
            attributes: {
                include: [
                    [sequalize.col('carreraDocente.carreraId'), 'carreraId']
                ]
            },
            include: [{
                model: CarreraDocente,
                attributes: [],
                as: "carreraDocente",
                where: {
                    status: 1,
                    carreraId: carreraId
                }
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

exports.crudDocente = async (req, res) => {
    try {
        let docente = req.body; // Guarda los datos del docente en la variable

        if (docente.docenteId == null) { // En caso de que el id sea nulo, se crea un nuevo docente.
            let newDocente = await Docente.create(docente);
            if (newDocente) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado el docente",
                });
            }
        } else if (docente.docenteId) { // En caso de que el id NO sea nulo, se actualiza el docente.
            let docenteId = docente.docenteId;
            delete docente.docenteId;

            let updatedDocente = await Docente.update(docente, {
                where: {
                    docenteId: docenteId
                }
            });
            if (updatedDocente) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado el docente.",
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
                        carreraId: docente.carreraId,
                        status: 1
                    }
                    let carreraDocente = await CarreraDocente.create(data);

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

exports.updateImage = async (req, res) => {

    try {

        let updated = await Docente.update({ urlImagen: 'user.webp' }, {
            where: {
                urlImagen: null
            }
        });

        if (updated) {
            return res.json({
                success: false,
                message: "Todo bn",
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

};
