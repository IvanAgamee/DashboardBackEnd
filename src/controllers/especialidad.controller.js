const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Especialidad = require('../models/Especialidad');

exports.getEspecialidadesByCarrera = async (req, res) => {
    try {
        const { carreraId } = req.query;

        const especialidades = await Especialidad.findAll({
            where: {
                status: 1,
                carreraId: carreraId
            },
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: especialidades,
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

exports.getEspecialidades = async (req, res) => {
    try {
        const especialidades = await Especialidad.findAll({
            where: {
                status: 1
            },
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: especialidades,
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

exports.crudEspecialidad = async (req, res) => {
    try {
        let especialidad = req.body; // Guarda los datos de la especialidad en la variable

        if (especialidad.especialidadId == null) { // En caso de que el id sea nulo, se crea una nueva especialidad.
            let newEsp = await Especialidad.create(especialidad);
            if (newEsp) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado la especialidad",
                });
            }
        } else if (especialidad.especialidadId) { // En caso de que el id NO sea nulo, se actualiza la especialidad.
            let especialidadId = especialidad.especialidadId;
            delete especialidad.especialidadId;

            let updatedEspecialidad = await Especialidad.update(especialidad, {
                where: {
                    especialidadId: especialidadId
                }
            });
            if (updatedEspecialidad) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado la especialidad.",
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