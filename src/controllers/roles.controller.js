const Departamento = require("../models/Departamento");
const ProgramaEstudio = require("../models/ProgramaEstudio");
const Rol = require("../models/Rol");


exports.getRoles = async (req, res) => {
    try {
        const roles = await Rol.findAll({
            where: {
                status: 1
            },
        });

        return res.json({
            success: true,
            data: roles,
            message: 'Se han encontrado roles.'
        })
    } catch (error) {
        console.log(error);
        return res.status(500).json({
            success: false,
            message: 'Algo ha salido mal',
            error: error
        });
    }
}

exports.adminDataAssignment = async (req, res) => {
    try {
        let departamentosData = await Departamento.findAll({
            where: {
                status: 1
            },
            include: [
                {
                    model: ProgramaEstudio,
                    as: "programaEstudio",
                    where: {
                        status: 1
                    },
                    include: [
                        {
                            model: Departamento,
                            as: "departamento",
                            // attributes: []
                        },
                    ]
                },
            ]
        });
        let programasEstudioData = [];
        departamentosData.forEach(programa => {
            programasEstudioData.push(programa.programaEstudio);
        });

        programasEstudioData = programasEstudioData.flat();
        return {
            departamentosData: departamentosData,
            programasEstudioData: programasEstudioData
        };
    } catch (error) {
        console.log(error);
        return res.status(500).json({
            success: false,
            message: 'Algo ha salido mal',
            error: error
        });
    }
}

exports.roleDataAssignment = async (departamentoId) => {
    try {
        const departamentosData = await Departamento.findByPk(departamentoId, {
            where: {
                status: 1
            },
            include: [
                {
                    model: ProgramaEstudio,
                    as: "programaEstudio",
                    where: {
                        status: 1
                    },
                    include: [
                        {
                            model: Departamento,
                            as: "departamento",
                            // attributes: []
                        },
                    ]
                },
            ]
        });
        const programasEstudioData = departamentosData.programaEstudio;

        return {
            departamentosData: departamentosData,
            programasEstudioData: programasEstudioData
        };
    } catch (error) {
        console.log(error);
        return res.status(500).json({
            success: false,
            message: 'Algo ha salido mal',
            error: error
        });
    }
}