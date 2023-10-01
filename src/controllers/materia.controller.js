const { Sequelize, where } = require('sequelize');
const sequelize = require("../database/database");
const Materia = require('../models/Materia');
const Especialidad = require('../models/Especialidad');
const ProgramaEstudio = require('../models/ProgramaEstudio');

exports.getMaterias = async (req, res) => {
    try {
        const materias = await Materia.findAll({
            where: {
                status: 1,
            },
            attributes: {
                include: [
                    [sequelize.col('especialidad.nombre'), 'especialidadNombre'],
                ]
            },
            include: [
                {
                    model: Especialidad,
                    as: "especialidad",
                    attributes: []
                },
            ]
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: materias,
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

exports.getMateriasByProgramaId = async (req, res) => {
    try {
        const { programaId } = req.body;

        let materia = await Materia.findAll({
            where: {
                programaId: programaId,
            },
            include: [
                {
                    model: Especialidad,
                    as: 'especialidad',
                    attributes: ['nombre'],
                },
            ]
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: materia,

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

exports.getMateriasByEspecialidadId = async (req, res) => {
    try {
        const { programaId, especialidadId } = req.body;
        let materia = await Materia.findAll({
            where: {
                programaId: programaId,
                especialidadId: especialidadId
            },
            include: [
                {
                    model: Especialidad,
                    as: 'especialidad',
                    attributes: ['nombre'],
                },
            ]
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: materia,

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

exports.getMateriasBySemestre = async (req, res) => {
    try {
        const { programaId, semestre} = req.body;

        let materia = await Materia.findAll({
            where: {
                programaId: programaId,
                semestre: semestre,
                especialidadId: null
            },
            include: [
                {
                    model: Especialidad,
                    as: 'especialidad',
                    attributes: ['nombre'],
                },
            ]
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: materia,

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

exports.getMateriaById = async (req, res) => {
    try {
        let materiaId = req.query.materiaId;
        let materia = await Materia.findByPk(materiaId, {
            where: {
                status: 1
            },
            include: [
                {
                    model: Especialidad,
                    as: 'especialidad',
                    attributes: ['nombre'],
                },
            ]
        });

        return res.json({
            success: true,
            message: "Se han encontrado la materia.",
            data: materia,

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

exports.crudMateria = async (req, res) => {
    try {
        let materia = req.body; // Guarda los datos de la materia en la variable

        if (materia.materiaId == null) { // En caso de que el id sea nulo, se crea una nueva materia.
            let newMateria = await Materia.create(materia);
            if (newMateria) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado la materia.",
                });
            }
        } else if (materia.materiaId) { // En caso de que el id NO sea nulo, se actualiza la materia.
            let materiaId = materia.materiaId;
            delete materia.materiaId;

            let updatedMateria = await Materia.update(materia, {
                where: {
                    materiaId: materiaId
                }
            });
            if (updatedMateria) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado la materia.",
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

exports.crudMateriaMasivo = async (req, res) => {

    let materias = req.body; // Guarda los datos de la materia en la variable
    const materiasAsync = async (materia) => {
        try {

            if (materia.materiaId == null) { // En caso de que el id sea nulo, se crea un nuevo docente.
                let newMateria = await Materia.create(materia);

            } else if (materia.materiaId) { // En caso de que el id NO sea nulo, se actualiza el docente.
                let materiaId = materia.materiaId;
                delete materia.materiaId;

                let updatedMateria = await Materia.update(materia, {
                    where: {
                        materiaId: materiaId
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
    if (materias != undefined) {
        return Promise.all(materias.map(materiasAsync)) // Mapeo de los docentes, se aplica la función anterior
            .then(result => {
                return res.json({
                    success: true,
                    message: `Se guardó correctamente las materias.`,
                });
            }).catch(error => {
                console.log(error)
                return [{
                    success: false,
                    message: `Ha ocurrido un error al guardar las materias.`,
                    error: error
                }]
            })
    } else { // En caso de que no existan datos, se retorna el mensaje.
        return [{
            success: true,
            message: `No existen docentes.`,
        }];
    }
};
