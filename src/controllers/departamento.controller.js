const { Sequelize } = require('sequelize');
const sequalize = require("../database/database");
const Departamento = require('../models/Departamento');
const ProgramaEstudio = require('../models/ProgramaEstudio');

exports.getDepartamentos = async (req, res) => {
    try {
        const departamentos = await Departamento.findAll({
            where: {
                status: 1
            },
            include:[
                {
                    model: ProgramaEstudio,
                    as: "programaEstudio",
                    where: {
                        status: 1
                    },
                },
            ]
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

exports.getDepartamentoById = async (req, res) => {
    try {
        let departamentoId = req.query.departamentoId;
        const docentes = await Departamento.findAll({
            where: {
                status: 1,
                departamentoId: departamentoId
            },
            include:[
                {
                    model: ProgramaEstudio,
                    as: "programa",
                    where: {
                        status: 1
                    },
                },
            ]
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

exports.crudDepartamentoMasivo = async (req, res) => {
    let departamentos = req.body;
    const departamentosAsync = async (departamento) => {
        try {
            if (departamento.departamentoId == null) { // En caso de que el id sea nulo, se crea un nuevo departamento.
                let newDocente = await Departamento.create(departamento);

            } else if (departamento.departamentoId) { // En caso de que el id NO sea nulo, se actualiza el departamento.
                let departamentoId = departamento.departamentoId;
                delete departamento.departamentoId;

                let updatedDepartamento = await Departamento.update(departamento, {
                    where: {
                        departamentoId: departamentoId
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
    if (departamentos != undefined) {
        return Promise.all(departamentos.map(departamentosAsync)) // Mapeo de los docentes, se aplica la función anterior
            .then(result => {
                return res.json({
                    success: true,
                    message: `Se guardó correctamente los departamentos.`,
                });
            }).catch(error => {
                console.log(error)
                return res.json({
                    success: false,
                    message: `Ha ocurrido un error al guardar los departamentos.`,
                    error: error
                });
            })
    } else { // En caso de que no existan datos, se retorna el mensaje.
        return [{
            success: true,
            message: `No existen departamentos.`,
        }];
    }
};
