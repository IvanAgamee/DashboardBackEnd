const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Seccion = require('../models/Seccion');
const Objeto = require('../models/Objeto');

exports.getSeccionByProgramaId = async (req, res) => {
    try {
        let programaId = req.query.programaId;
        const docentes = await Seccion.findAll({
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

exports.getObjetoByProgramaId = async (req, res) => {
    try {
        let programaId = req.query.programaId;
        const docentes = await Objeto.findAll({
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

exports.getObjetoBySeccionId = async (req, res) => {
    try {
        let seccionId = req.query.seccionId;
        const docentes = await Objeto.findAll({
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
