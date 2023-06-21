const Administrativo = require("../models/Administrativo");
const AdministrativoCarrera = require("../models/AdministrativoCarrera");

exports.crudAdministrativo = async (req, res) => {
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

async function crudAdminCarrera(carreras, newAdmin) {
    try {
        const createAdminCarrea = async (carrera) => {
            let data = {
                administrativoId: newAdmin.administrativoId, // Manda el id del cliente
                carreraId: carrera,  // Manda el id del contacto creado
                status: 1
            };

            let newUnion = await AdministrativoCarrera.create(data);
        }
        if (carreras != undefined) {
            return Promise.all(carreras.map(createAdminCarrea))
                .then(result => {
                    return [{
                        success: true,
                        message: `Se guardó correctamente los contactos`,
                    }]
                }).catch(error => {
                    console.log(error);
                    return [{
                        success: false,
                        message: `Ha ocurrido un error al guardar los contactos.`,
                        error: error
                    }]
                })
        } else {
            return [{
                success: true,
                message: `No existen contactos.`,
            }];
        }
    } catch (e) {
        console.log(e);
        return [({
            success: false,
            message: "Ha ocurrido un error al guardar el contacto",
            error: e,
        })];
    }
}