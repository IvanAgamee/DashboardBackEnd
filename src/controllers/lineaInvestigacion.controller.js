const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Materia = require('../models/Materia');
const LineaInvestigacion = require('../models/LineaInvestigacion');

exports.getLineasByProgramaId = async (req, res) => {
    try {
        const { programaId } = req.query;

        const lineas = await LineaInvestigacion.findAll({
            where: {
                status: 1,
                programaId: programaId
            },
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: lineas,
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

exports.getLineaInvestigacionByProgramaId = async (req, res) => {
    try {
        const { programaId, lineaInvestigacionId } = req.body;

        const especialidades = await LineaInvestigacion.findOne({
            where: {
                status: 1,
                programaId: programaId,
                lineaInvestigacionId: lineaInvestigacionId
            },
            include: [
                {
                    model: Materia,
                    as: 'materias'
                },
            ]
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

exports.getLineasInvestigacion = async (req, res) => {
    try {
        const lineas = await LineaInvestigacion.findAll({
            where: {
                status: 1
            },
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: lineas,
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

exports.crudLineaInv = async (req, res) => {
    try {
        let lineaInvestigacion = req.body;

        if (lineaInvestigacion.lineaInvestigacionId == null) {
            let newLineaInv = await LineaInvestigacion.create(lineaInvestigacion);
            if (newLineaInv) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado la linea de investigación",
                });
            }
        } else if (lineaInvestigacion.lineaInvestigacionId) {
            let lineaInvestigacionId = lineaInvestigacion.lineaInvestigacionId;
            delete lineaInvestigacion.lineaInvestigacionId;

            let updatedLineaInv = await LineaInvestigacion.update(lineaInvestigacion, {
                where: {
                    lineaInvestigacionId: lineaInvestigacionId
                }
            });
            if (updatedLineaInv) {
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

exports.crudLineasInvMasivo = async (req, res) => {
    let lineas = req.body;
    const lineasAsync = async (lineaInvestigacion) => {
        try {
            if (lineaInvestigacion.lineaInvestigacionId == null) {
                let newLineaInv = await LineaInvestigacion.create(lineaInvestigacion);

            } else if (lineaInvestigacion.lineaInvestigacionId) {
                let lineaInvestigacionId = lineaInvestigacion.lineaInvestigacionId;
                delete lineaInvestigacion.lineaInvestigacionId;

                let updatedLineaInv = await LineaInvestigacion.update(lineaInvestigacion, {
                    where: {
                        lineaInvestigacionId: lineaInvestigacionId
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
    if (lineas != undefined) {
        return Promise.all(lineas.map(lineasAsync))
            .then(result => {
                return res.json({
                    success: true,
                    message: `Se guardó correctamente las lineas de investigación.`,
                });
            }).catch(error => {
                console.log(error)
                return res.json({
                    success: false,
                    message: `Ha ocurrido un error al guardar las líneas de investigación.`,
                    error: error
                });
            })
    } else { // En caso de que no existan datos, se retorna el mensaje.
        return [{
            success: true,
            message: `No existen especialidades.`,
        }];
    }
};
