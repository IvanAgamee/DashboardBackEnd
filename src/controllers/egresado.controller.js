const Egresado = require("../models/Egresado");
const GeneracionEgresada = require("../models/GeneracionEgresada");

exports.getUltimas5Gen = async (req, res) => {
    try {
        let { programaId, offset } = req.body;

        const docentes = await GeneracionEgresada.findAll({
            offset, subQuery: false,
            limit: 5,
            where: {
                status: 1,
                programaId: programaId
            },
            include: [{
                model: Egresado,
                as: "egresados",
                where: {
                    status: 1
                },
                order: [
                    [sequelize.literal('fechaFinal'), 'ASC']
                ]
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