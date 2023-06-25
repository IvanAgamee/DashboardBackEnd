const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Carrera = require('../models/Carrera');
const Departamento = require('../models/Departamento');

exports.getCarreras = async (req, res) => {
    try {
        const carreras = await Carrera.findAll({
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
        const carreras = await Carrera.findAll({
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

// exports.crudCarrera = async (req, res) => {
//     try {
//         let carrera = req.body; // Guarda los datos del carrera en la variable

//         if (carrera.id == null) { // En caso de que el id sea nulo, se crea un nuevo carrera.
//             let newCarrera = await Carrera.create(carrera);
//             if (newCarrera) {
//                 return res.status(200).json({
//                     success: true,
//                     message: "Se ha guardado la carrera.",
//                 });
//             }
//         } else if (carrera.id) { // En caso de que el id NO sea nulo, se actualiza el carrera.
//             let carreraId = carrera.id;
//             delete carrera.id;

//             let updatedCarrera = await Carrera.update(carrera, {
//                 where: {
//                     id: carreraId
//                 }
//             });
//             if (updatedCarrera) {
//                 return res.status(200).json({
//                     success: true,
//                     message: "Se ha guardado la carrera..",
//                 });
//             }
//         }
//     } catch (e) {
//         console.log(e.message);
//         return res.status(500).json({
//             success: false,
//             message: "Ha ocurrido un error al guardar el registro.",
//             error: e.message,
//         });
//     }
// };

exports.crudCarrera = async (req, res) => {
    let carreras = req.body;
    const carrerasAsync = async (carrera) => {
        try {
            if (carrera.carreraId == null) {
                let newCarrera = await Carrera.create(carrera);
            } else if (carrera.carreraId) {
                let carreraId = carrera.carreraId;
                delete carrera.carreraId;

                let updatedCarrera = await Carrera.update(carrera, {
                    where: {
                        carreraId: carreraId
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