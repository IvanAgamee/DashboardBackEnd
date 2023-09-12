const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const ProgramaEstudio = require('../models/ProgramaEstudio');
const Departamento = require('../models/Departamento');

exports.getCarreras = async (req, res) => {
    try {
        const carreras = await ProgramaEstudio.findAll({
            where: {
                status: 1,
            },
            attributes: {
                include: [
                    [sequelize.col('departamento.nombre'), 'departamentoNombre'],
                ]
            },
            include: [
                {
                    model: Departamento,
                    as: "departamento",
                    attributes: []
                },
            ]
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: carreras,
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

exports.getCarrerasByDeparment = async (req, res) => {
    try {
        const { departamentoId } = req.body;
        const carreras = await ProgramaEstudio.findAll({
            where: {
                status: 1,
                departamentoId: departamentoId,
            },
            attributes: {
                include: [
                    [sequelize.col('departamento.nombre'), 'departamentoNombre'],
                ]
            },
            include: [
                {
                    model: Departamento,
                    as: "departamento",
                    attributes: []
                },
            ]
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: carreras,
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

exports.crudCarrera = async (req, res) => {
    try {
        let ProgramaEstudio = req.body; // Guarda los datos del ProgramaEstudio en la variable

        if (ProgramaEstudio.id == null) { // En caso de que el id sea nulo, se crea un nuevo ProgramaEstudio.
            let newCarrera = await ProgramaEstudio.create(ProgramaEstudio);
            if (newCarrera) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado la ProgramaEstudio.",
                });
            }
        } else if (ProgramaEstudio.id) { // En caso de que el id NO sea nulo, se actualiza el ProgramaEstudio.
            let programaId = ProgramaEstudio.id;
            delete ProgramaEstudio.id;

            let updatedCarrera = await ProgramaEstudio.update(ProgramaEstudio, {
                where: {
                    id: programaId
                }
            });
            if (updatedCarrera) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado la ProgramaEstudio..",
                });
            }
        }
    } catch (e) {
        console.log(e.message);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al guardar el registro.",
            error: e.message,
        });
    }
};

exports.crudCarreraMasivo = async (req, res) => {
    let carreras = req.body;
    const carrerasAsync = async (ProgramaEstudio) => {
        try {
            if (ProgramaEstudio.programaId == null) {
                let newCarrera = await ProgramaEstudio.create(ProgramaEstudio);
            } else if (ProgramaEstudio.programaId) {
                let programaId = ProgramaEstudio.programaId;
                delete ProgramaEstudio.programaId;

                let updatedCarrera = await ProgramaEstudio.update(ProgramaEstudio, {
                    where: {
                        programaId: programaId
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
    if (carreras != undefined) {
        return Promise.all(carreras.map(carrerasAsync)) // Mapeo de los docentes, se aplica la función anterior
            .then(result => {
                return res.json({
                    success: true,
                    message: `Se guardó correctamente los carreras.`,
                });
            }).catch(error => {
                console.log(error)
                return res.json({
                    success: false,
                    message: `Ha ocurrido un error al guardar los carreras.`,
                    error: error
                });
            })
    } else { // En caso de que no existan datos, se retorna el mensaje.
        return [{
            success: true,
            message: `No existen carreras.`,
        }];
    }
};