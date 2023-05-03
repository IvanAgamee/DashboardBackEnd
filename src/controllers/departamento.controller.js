const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Departamento = require('../models/Departamento');

exports.getDepartamentos = async (req, res) => {
    try {
        const departamentos = await Departamento.findAll({
            where: {
                status: 1
            },
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: departamentos,
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

exports.crudDepartamento = async (req, res) => {
    try {
        let departamento = req.body; // Guarda los datos del departamento en la variable

        if (departamento.departamentoId == null) { // En caso de que el id sea nulo, se crea un nuevo departamento.
            let newDep = await Departamento.create(departamento);
            if (newDep) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado el departamento",
                });
            }
        } else if (departamento.departamentoId) { // En caso de que el id NO sea nulo, se actualiza el departamento.
            let departamentoId = departamento.departamentoId;
            delete departamento.departamentoId;

            let updatedDep = await Departamento.update(departamento, {
                where: {
                    departamentoId: departamentoId
                }
            });
            if (updatedDep) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado el departamento.",
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
