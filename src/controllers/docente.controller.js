const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Docente = require('../models/Docente');
const CarreraDocente = require('../models/CarreraDocente');

exports.getDocentes = async (req, res) => {
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
