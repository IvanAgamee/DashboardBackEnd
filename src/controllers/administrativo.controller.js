const sequalize = require("../database/database");
const Administrativo = require("../models/Administrativo");
const AdministrativoPrograma = require("../models/AdministrativoPrograma");
const ProgramaEstudio = require("../models/ProgramaEstudio");
const PuestoAdministrativo = require("../models/PuestoAdministrativo");

exports.crudAdministrativoMasivo = async (req, res) => {
    let administrativos = req.body;
    const administrativosAsync = async (administrativo) => {
        try {
            if (administrativo.administrativoId == null) { // En caso de que el id sea nulo, se crea un nuevo administrativo.
                let newAdmin = await Administrativo.create(administrativo);
                if (newAdmin) {
                    let data = {
                        administrativoId: newAdmin.administrativoId, // Manda el id del cliente
                        programaId: administrativo.programaId,  // Manda el id del contacto creado
                        status: 1
                    };

                    let newUnion = await AdministrativoPrograma.create(data);
                    // await crudAdminPrograma(administrativo.programaId, newAdmin);
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
                    programaId: administrativo.programaId,  // Manda el id del contacto creado
                    status: 1
                };

                let newUnion = await AdministrativoPrograma.create(data);

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

exports.getAdministrativosByProgramaId = async (req, res) => {
    try {
        let programaId = req.query.programaId;
        const administrativos = await Administrativo.findAll({
            where: {
                status: 1,
            },
            attributes: {
                include: [
                    [sequalize.literal('AdministrativoPrograma.programaId'), 'programaId']
                ]
            },
            include: [{
                model: AdministrativoPrograma,
                attributes: [],
                as: "administrativoPrograma",
                where: {
                    status: 1,
                    programaId: programaId
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


exports.getAdministrativo = async (req, res) => {
    try {
        const { programaId, puestoId } = req.body;

        let administrativo = await Administrativo.findOne({
            where: {
                status: 1,
                puestoId: puestoId
            },
            subQuery: false,
            attributes: {
                include: [
                    [sequalize.literal('AdministrativoPrograma.programaId'), 'programaId'],
                    [sequalize.literal('puesto.nombre'), 'nombrePuesto'],
                ]
            },
            include: [
                {
                    model: AdministrativoPrograma,
                    as: "administrativoPrograma",
                    attributes: [],
                    where: {
                        status: 1,
                        programaId: programaId
                    },
                    include: [
                        {
                            model: ProgramaEstudio,
                            as: 'programas',
                            attributes: ['nombre'] // Incluye solo el atributo 'nombre' de ProgramaEstudio
                        }
                    ]
                },
                {
                    model: PuestoAdministrativo,
                    attributes: [],
                    as: "puesto"
                }
            ]
        });

        const programaEstudio = await ProgramaEstudio.findOne({
            where: {
                programaId: programaId
            },
            attributes: ['nombre']
        });

        administrativo = { ...administrativo.dataValues, nombrePrograma: ProgramaEstudio.nombre };
        
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: administrativo
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