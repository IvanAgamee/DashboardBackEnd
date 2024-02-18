const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Seccion = require('../models/Seccion');
const Objeto = require('../models/Objeto');

exports.getSeccionById = async (req,res) => {
    try{
        let seccionId = req.query.seccionId;
        const seccion = await Seccion.findOne( {
            where: {
                status: 1,
                seccionId: seccionId
            },
            include:[
                {
                    model: Objeto,
                    as: "objeto",
                    required: false,
                    where: {
                        status: 1
                    },
                    order: [
                        [sequelize.literal('posicion'), 'ASC']
                    ]
                }
            ]
        })
        res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: seccion
        })
    }
    catch (e) {
        res.status(404).json({
            success: false,
            message: "Ha ocurrido un error al obtener los registros.",
            error: e.message,
        })
    }
};

exports.getSeccionByProgramaId = async (req, res) => {
    try {
        let programaId = req.query.programaId;
        const seccion = await Seccion.findAll({
            where: {
                status: 1,
                programaId: programaId
            },
            include: [
                {
                    model: Objeto,
                    as: "objeto",
                    required: false,
                    where: {
                        status: 1
                    },
                    order: [
                        [sequelize.literal('posicion'), 'ASC']
                    ]
                },
            ]
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: seccion,
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

exports.getObjetoByProgramaId = async (req, res) => {
    try {
        let programaId = req.query.programaId;
        const objetos = await Objeto.findAll({
            where: {
                status: 1
            },
            order: [
                [sequelize.literal('posicion'), 'ASC']
            ],
            include: [
                {
                    model: Seccion,
                    as: "seccion",
                    where: {
                        status: 1,
                        programaId: programaId
                    }
                },
            ]
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: objetos,
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


exports.getLastIdSecccion = async(req,res) => {
try{
    const idSeccion =  await sequelize.query('SELECT s.seccionId FROM tbl_seccion AS s WHERE s.titulo = :titulo AND s.moduloId = :moduloId AND s.programaId = :programaId',{
        replacements:{
        'titulo':req.query.titulo,
        'moduloId':req.query.moduloId,
        'programaId':req.query.programaId
        },
        type: Sequelize.QueryTypes.SELECT});
    return res.json({
        success: true,
        message: "Se han encontrado registros",
        data: idSeccion[0]
    });
}
catch (e) {
    res.status(500).json({
        success: false,
        message: "Ha ocurrido un error al guardar el registro.",
        error: e.message,
    })
}
};


exports.getObjetoBySeccionId = async (req, res) => {
    try {
        let seccionId = req.query.seccionId;
        const objetos = await Objeto.findOne({
            where: {
                status: 1,
                seccionId: seccionId
            },
            order: [
                [sequelize.literal('posicion'), 'ASC']
            ],
            include: [
                {
                    model: Seccion,
                    as: "seccion",
                    where: {
                        status: 1
                    }
                },
            ]
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: objetos,
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

exports.getReticulaByProgramaId = async (req, res) => {
    try {
        const { programaId } = req.body;
        const seccion = await Seccion.findOne({
            where: {
                status: 1,
                programaId: programaId,
                titulo: 'Ver plan de estudios'
            }
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: seccion,
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

exports.getObjetivoEducacionalByProgramaId = async (req, res) => {
    try {
        const { programaId } = req.body;
        const seccion = await Seccion.findOne({
            where: {
                status: 1,
                programaId: programaId,
                titulo: 'Objetivos educacionales'
            },
            include: [
                {
                    model: Objeto,
                    as: "objeto",
                    where: {
                        status: 1
                    },
                    order: [
                        [sequelize.literal('posicion'), 'ASC']
                    ]
                }
            ]
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: seccion,
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

exports.getObjetivoGeneralByProgramaId = async (req, res) => {
    try {
        const { programaId } = req.body;
        const seccion = await Seccion.findOne({
            where: {
                status: 1,
                programaId: programaId,
                titulo: 'Objetivo general'
            }
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: seccion,
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

exports.getMisionByProgramaId = async (req, res) => {
    try {
        const { programaId } = req.body;
        const seccion = await Seccion.findOne({
            where: {
                status: 1,
                programaId: programaId,
                titulo: 'Mision'
            }
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: seccion,
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

exports.getVisionByProgramaId = async (req, res) => {
    try {
        const { programaId } = req.body;
        const seccion = await Seccion.findOne({
            where: {
                status: 1,
                programaId: programaId,
                titulo: 'Vision'
            }
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: seccion,
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

exports.getPerfilEgresoByProgramaId = async (req, res) => {
    try {
        const { programaId } = req.body;

        const seccion = await Seccion.findOne({
            where: {
                status: 1,
                programaId: programaId,
                titulo: 'Perfil de egreso'
            },
            include: [
                {
                    model: Objeto,
                    as: "objeto",
                    where: {
                        status: 1
                    },
                    order: [
                        [sequelize.literal('posicion'), 'ASC']
                    ]
                }
            ]
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: seccion,
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

exports.getObjetivoGeneralByProgramaId = async (req, res) => {
    try {
        const { programaId } = req.body;
        const seccion = await Seccion.findOne({
            where: {
                status: 1,
                programaId: programaId,
                titulo: 'Objetivo general'
            }
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: seccion,
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

exports.borrarObjetosById = async (req, res) => {
    try {
        console.log(req.body);
        let objetos = req.body;
        if (objetos !== null && Array.isArray(objetos) && objetos.length > 0) {
            const objetoIds = objetos.map(objeto => objeto.objetoId);
            const data = await Objeto.update(
                { status: 0 },
                {
                    where: {
                        objetoId: {
                            [Sequelize.Op.in]: objetoIds
                        }
                    }
                }
            );

            return res.json({
                success: true,
                message: "Se han eliminado los registros.",
                data: data // Puedes enviar información adicional, como el número de registros eliminados
            });
        } else {
            return res.status(500).json({
                success: false,
                message: "No se proporcionaron objetos válidos para eliminar.",
            });
        }
    } catch (e) {
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al obtener los registros.",
            error: e.message,
        });
    }
};

exports.crudSeccion = async (req, res) => {
    try {
        let seccion = req.body;
        if (seccion.seccionId == null) {
            let newSeccion = await Seccion.create(seccion);
            if (newSeccion) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado la sección.",
                });
            }
        } else if (seccion.seccionId) {
            let seccionId = seccion.seccionId;
            delete seccion.seccionId;

            let updatedSeccion = await Seccion.update(seccion, {
                where: {
                    seccionId: seccionId
                }
            });
            if (updatedSeccion) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado la sección.",
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

exports.crudObjeto = async (req, res) => {
    try {
        let objeto = req.body;
        if (objeto.objetoId == null) {
            let newObj = await Objeto.create(objeto);
            if (newObj) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado el objeto.",
                });
            }
        } else if (objeto.objetoId) {
            let objetoId = objeto.objetoId;
            delete objeto.objetoId;

            let updatedObjeto = await Objeto.update(objeto, {
                where: {
                    objetoId: objetoId
                }
            });
            if (updatedObjeto) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado el objeto.",
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

exports.crudSeccionMasivo = async (req, res) => {
    let secciones = req.body;
    const seccionesAsync = async (seccion) => {
        try {
            if (seccion.seccionId == null) {
                let newSeccion = await Seccion.create(seccion);
            } else if (seccion.seccionId) {
                let seccionId = seccion.seccionId;
                delete seccion.seccionId;

                let updatedSeccion = await Seccion.update(seccion, {
                    where: {
                        seccionId: seccionId
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
    if (secciones != undefined) {
        return Promise.all(secciones.map(seccionesAsync)) // Mapeo de los docentes, se aplica la función anterior
            .then(result => {
                return res.json({
                    success: true,
                    message: `Se guardó correctamente las secciones.`,
                });
            }).catch(error => {
                console.log(error)
                return res.json({
                    success: false,
                    message: `Ha ocurrido un error al guardar las secciones.`,
                    error: error
                });
            })
    } else { // En caso de que no existan datos, se retorna el mensaje.
        return [{
            success: true,
            message: `No existen secciones.`,
        }];
    }
};

exports.crudObjetoMasivo = async (req, res) => {
    let objetos = req.body;
    const objetosAsync = async (objeto) => {
        try {
            if (objeto.objetoId == null) {
                let newObj = await Objeto.create(objeto);
            } else if (objeto.objetoId) {
                let objetoId = objeto.objetoId;
                delete objeto.objetoId;

                let updatedObjeto = await Objeto.update(objeto, {
                    where: {
                        objetoId: objetoId
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
    if (objetos != undefined) {
        return Promise.all(objetos.map(objetosAsync)) // Mapeo de los docentes, se aplica la función anterior
            .then(result => {
                return res.json({
                    success: true,
                    message: `Se guardó correctamente las objetos.`,
                });
            }).catch(error => {
                console.log(error)
                return res.json({
                    success: false,
                    message: `Ha ocurrido un error al guardar las objetos.`,
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

