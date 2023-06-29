const sequalize = require("../database/database");
const Administrativo = require("../models/Administrativo");
const AdministrativoCarrera = require("../models/AdministrativoCarrera");

exports.crudAdministrativoMasivo = async (req, res) => {
    let administrativos = req.body;
    const administrativosAsync = async (administrativo) => {
        try {
            if (administrativo.administrativoId == null) { // En caso de que el id sea nulo, se crea un nuevo administrativo.
                let newAdmin = await Administrativo.create(administrativo);
                if (newAdmin) {
                    let data = {
                        administrativoId: newAdmin.administrativoId, // Manda el id del cliente
                        carreraId: administrativo.carreraId,  // Manda el id del contacto creado
                        status: 1
                    };

                    let newUnion = await AdministrativoCarrera.create(data);
                    // await crudAdminCarrera(administrativo.carreraId, newAdmin);
                }
            } else if (administrativo.administrativoId) { // En caso de que el id NO sea nulo, se actualiza el administrativo.
                let administrativoId = administrativo.administrativoId;
                delete administrativo.administrativoId;

                let updatedDepartamento = await Administrativo.update(administrativo, {
                    where: {
                        administrativoId: administrativoId
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
    if (administrativos != undefined) {
        return Promise.all(administrativos.map(administrativosAsync)) // Mapeo de los docentes, se aplica la función anterior
            .then(result => {
                return res.json({
                    success: true,
                    message: `Se guardó correctamente los administrativos.`,
                });
            }).catch(error => {
                console.log(error)
                return res.json({
                    success: false,
                    message: `Ha ocurrido un error al guardar los administrativos.`,
                    error: error
                });
            })
    } else { // En caso de que no existan datos, se retorna el mensaje.
        return [{
            success: true,
            message: `No existen administrativos.`,
        }];
    }
};

exports.crudAdministrativo = async (req, res) => {
    try {
        let administrativo = req.body;
        if (administrativo.administrativoId == null) { // En caso de que el id sea nulo, se crea un nuevo administrativo.
            let newAdmin = await Administrativo.create(administrativo);
            if (newAdmin) {
                let data = {
                    administrativoId: newAdmin.administrativoId, // Manda el id del cliente
                    carreraId: administrativo.carreraId,  // Manda el id del contacto creado
                    status: 1
                };

                let newUnion = await AdministrativoCarrera.create(data);

                if (newUnion) {
                    return res.status(200).json({
                        success: true,
                        message: "Se ha guardado el administrativo.",
                    });
                }
            }
        } else if (administrativo.administrativoId) { // En caso de que el id NO sea nulo, se actualiza el administrativo.
            let administrativoId = administrativo.administrativoId;
            delete administrativo.administrativoId;

            let updatedDepartamento = await Administrativo.update(administrativo, {
                where: {
                    administrativoId: administrativoId
                }
            });
            if (updatedDepartamento) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado el administrativo.",
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


exports.getAdministrativosByCarreraId = async (req, res) => {
    try {
        let carreraId = req.query.carreraId;
        const administrativos = await Administrativo.findAll({
            where: {
                status: 1,
            },
            attributes: {
                include: [
                    [sequalize.col('administrativoCarrera.carreraId'), 'carreraId']
                ]
            },
            include: [{
                model: AdministrativoCarrera,
                attributes: [],
                as: "administrativoCarrera",
                where: {
                    status: 1,
                    carreraId: carreraId
                }
            }]
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: administrativos,
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