const sequelize = require("../database/database");
const { Sequelize } = require('sequelize');
const Modulo = require("../models/Modulo");

exports.getModulos = async (req, res) => {
    try {
        const modulos = await Modulo.findAll({
            where: {
                status: 1,
            },
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: modulos,
        });
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al guardar el registro.",
            error: e.message,
        });
    }
};

exports.crudModulo = async (req, res) => {
    try {
        let modulo = req.body; // Guarda los datos del modulo en la variable

        if (modulo.id == null) { // En caso de que el id sea nulo, se crea un nuevo modulo.
            let newModulo = await Modulo.create(modulo);
            if (newModulo) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado el modulo",
                });
            }
        } else if (modulo.id) { // En caso de que el id NO sea nulo, se actualiza el modulo.
            let moduloId = modulo.id;
            delete modulo.id;

            let updatedModulo = await Modulo.update(modulo, {
                where: {
                    id: moduloId
                }
            });
            if (updatedModulo) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado el modulo",
                });
            }
        }
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al obtener los registros.",
            error: e.message,
        });
    }
};
