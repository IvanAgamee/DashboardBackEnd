const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Especialidad = require('../models/Especialidad');
const Materia = require('../models/Materia');

exports.getEspecialidadesByProgramaId = async (req, res) => {
    try {
        const { programaId } = req.query;

        const especialidades = await Especialidad.findAll({
            where: {
                status: 1,
                programaId: programaId
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

exports.getEspecialidadByProgramaId = async (req, res) => {
    try {
        const { programaId, especialidadId } = req.body;

        const especialidades = await Especialidad.findOne({
            where: {
                status: 1,
                programaId: programaId,
                especialidadId: especialidadId
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


exports.crudEspecialidadMasivo = async (req, res) => {
    let especialidades = req.body;
    const especialidadesAsync = async (especialidad) => {
        try {
            console.log(especialidad)
            if (especialidad.especialidadId == null) {
                let newEsp = await Especialidad.create(especialidad);
            } else if (especialidad.especialidadId) {
                let especialidadId = especialidad.especialidadId;
                delete especialidad.especialidadId;

                let updatedEspecialidad = await Especialidad.update(especialidad, {
                    where: {
                        especialidadId: especialidadId
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
    if (especialidades != undefined) {
        return Promise.all(especialidades.map(especialidadesAsync)) // Mapeo de los docentes, se aplica la función anterior
            .then(result => {
                return res.json({
                    success: true,
                    message: `Se guardó correctamente las especialidades.`,
                });
            }).catch(error => {
                console.log(error)
                return res.json({
                    success: false,
                    message: `Ha ocurrido un error al guardar las especialidades.`,
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
