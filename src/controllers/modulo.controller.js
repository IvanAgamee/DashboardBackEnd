const sequelize = require("../database/database");
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
            message: "Ha ocurrido un error al obtener los registros.",
            error: e.message,
        });
    }
};