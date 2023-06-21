const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Seccion = require('../models/Seccion');
const Objeto = require('../models/Objeto');

exports.crudSeccion = async (req, res) => {
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


exports.crudObjeto = async (req, res) => {
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
