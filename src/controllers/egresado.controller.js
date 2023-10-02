const sequelize = require("../database/database");
const Egresado = require("../models/Egresado");
const GeneracionEgresada = require("../models/GeneracionEgresada");

exports.crudGenEgresadaMasivo = async (req, res) => {
    let generaciones = req.body;
    const generacionesAsync = async (generacion) => {
        try {
            if (generacion.generacionId == null) {
                let newObj = await GeneracionEgresada.create(generacion);
            } else if (generacion.generacionId) {
                let generacionId = generacion.generacionId;
                delete generacion.generacionId;

                let updatedObjeto = await GeneracionEgresada.update(generacion, {
                    where: {
                        generacionId: generacionId
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
    if (generaciones != undefined) {
        return Promise.all(generaciones.map(generacionesAsync)) // Mapeo de los docentes, se aplica la función anterior
            .then(result => {
                return res.json({
                    success: true,
                    message: `Se guardó correctamente las generaciones.`,
                });
            }).catch(error => {
                console.log(error)
                return res.json({
                    success: false,
                    message: `Ha ocurrido un error al guardar las generacions.`,
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

exports.crudEgresadoMasivo = async (req, res) => {
    let generaciones = req.body;
    const generacionesAsync = async (generacion) => {
        try {
            if (generacion.egresadoId == null) {
                let newObj = await Egresado.create(generacion);
            } else if (generacion.egresadoId) {
                let egresadoId = generacion.egresadoId;
                delete generacion.egresadoId;

                let updatedObjeto = await Egresado.update(generacion, {
                    where: {
                        egresadoId: egresadoId
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
    if (generaciones != undefined) {
        return Promise.all(generaciones.map(generacionesAsync)) // Mapeo de los docentes, se aplica la función anterior
            .then(result => {
                return res.json({
                    success: true,
                    message: `Se guardó correctamente las generaciones.`,
                });
            }).catch(error => {
                console.log(error)
                return res.json({
                    success: false,
                    message: `Ha ocurrido un error al guardar las generacions.`,
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

exports.getUltimas5Gen = async (req, res) => {
    try {
        let { programaId } = req.body;

        const docentes = await GeneracionEgresada.findAll({
            limit: 5,
            where: {
                status: 1,
                programaId: programaId
            },
            order: [
                ['fechaFinal', 'DESC']
            ],
            include: [{
                model: Egresado,
                as: "egresados",
                required: false,
                where: {
                    status: 1
                },
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