const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Usuario = require('../models/Usuario');
const Rol = require('../models/Rol');
const sequalize = require("../database/database");
const RolPermiso = require('../models/RolPermiso');

exports.login = async (req, res) => {
    try {
        const { username, password } = req.body;

        const user = await Usuario.findOne({
            where: {
                username,
                password
            },
            attributes: {
                include: [
                    [sequelize.col('rol.rolPermiso.departamentoId'), 'departamentoId'],
                    [sequelize.col('rol.nombre'), 'rolNombre'],
                ]
            },
            include: [{
                model: Rol,
                as: 'rol',
                attributes: [],
                include: [{
                    model: RolPermiso,
                    as: 'rolPermiso',
                    attributes: []
                }]
            }],
        });

        if (!user) return res.json({ success: false, message: 'Usuario o contraseña incorrectos' });
        // user.setDataValue('rolePermissions', await getByUserAndRole(user.roleId, user.id));

        return res.json({ success: true, data: user });

    } catch (e) {
        console.log(e);
        res.status(500).json({ success: false, message: 'Algo ha salido mal', error: e });
    }
}

exports.getUsers = async (req, res) => {
    try {
        const users = await Usuario.findAll({
            where: {
                status: 1
            },
            attributes: {
                include: [
                    [sequalize.col('rol.nombre'), 'rolNombre']
                ]
            },
            include: [
                {
                    model: Rol,
                    as: "rol",
                    where: { status: 1 },
                }
            ],
        });

        return res.json({
            success: true,
            message: "Se han encontrado registros",
            data: users,
        });
    } catch (e) {
        console.log(e);
        res.status(500).json({
            success: false,
            message: 'Ha ocurrido un error al obtener los usuarios',
            error: e
        });
    }
}
exports.getUserById = async (req, res) => {
    const { id } = req.params;

    try {
        const user = await Usuario.findOne({
            where: {
                id
            }
        });

        if (!user) {
            return res.json({
                success: true,
                message: 'Usuario no encontrado'
            });
        }

        return res.json({
            success: true,
            data: user
        });
    } catch (e) {
        console.log(e);
        res.status(500).json({
            success: false,
            message: 'Algo ha salido mal',
            error: e
        });
    }
}

exports.crudUser = async (req, res) => {
    try {
        let usuario = req.body;

        if (usuario.usuarioId == null) {
            let exists = await Usuario.findOne({
                where: {
                    username: usuario.username,
                    status: 1
                }
            });

            if (exists) {
                return res.json({
                    success: false,
                    message: 'Nombre de usuario ya existente'
                });
            } else {  // En caso de que no exista o no se repita el nombre de usuario
                let newUsuario = await Usuario.create(usuario); // crea el usuario
                if (newUsuario) {
                    return res.status(200).json({
                        success: true,
                        message: "Se ha guardado el usuario",
                    });
                }
            }
        } else {
            let usuarioId = usuario.usuarioId;
            delete usuario.usuarioId;

            let updatedUsuario = await Usuario.update(usuario, {
                where: {
                    usuarioId: usuarioId
                }
            });
            if (updatedUsuario) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado el usuario.",
                });
            }
        }

    } catch (e) {
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error",
            error: e
        })
    }
}
