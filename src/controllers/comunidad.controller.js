const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Comunidad = require('../models/Comunidad');

exports.crudComunidad = async (req, res) => {
    let comunidades = req.body;
    const comunidadesAsync = async (comunidad) => {
        try {
            if (comunidad.comunidadId == null) { // En caso de que el id sea nulo, se crea nueva comunidad.
                let newComunidad = await Comunidad.create(comunidad);
               
            } else if (comunidad.comunidadId) { // En caso de que el id NO sea nulo, se actualiza el comunidad.
                let comunidadId = comunidad.comunidadId;
                delete comunidad.comunidadId;

                let updatedDocente = await Comunidad.update(comunidad, {
                    where: {
                        comunidadId: comunidadId
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
    if (comunidades != undefined) {
        return Promise.all(comunidades.map(comunidadesAsync)) // Mapeo de los docentes, se aplica la función anterior
            .then(result => {
                return res.json({
                    success: true,
                    message: `Se guardó correctamente las comunidades.`,
                });
            }).catch(error => {
                console.log(error)
                return res.json({
                    success: false,
                    message: `Ha ocurrido un error al guardar las comunidades.`,
                    error: error
                });
            })
    } else { // En caso de que no existan datos, se retorna el mensaje.
        return [{
            success: true,
            message: `No existen comunidades.`,
        }];
    }
};