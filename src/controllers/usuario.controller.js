const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Usuario = require('../models/Usuario');
const Rol = require('../models/Rol');
const bcrypt = require('bcrypt');
const { roleDataAssignment, adminDataAssignment } = require("./roles.controller");

exports.login = async (req, res) => {
    try {
        const { username, password } = req.body;

        let user = await Usuario.findOne({
            where: {
                username
            },
            include: [{
                model: Rol,
                as: 'rol',
                attributes: []
            }],
        });

        if (!user) {
            return res.json({
                success: false,
                message: 'El usuario no existe.'
            });
        }

        const result = await new Promise((resolve, reject) => {
            bcrypt.compare(password, user.password, (err, result) => {
                if (err) {
                    // Rechaza la promesa en caso de error
                    reject(err);
                }
                // Resuelve la promesa con el resultado de la comparación
                resolve(result);
            });
        });
        // Verifica el resultado de la comparación de contraseñas
        if (result) {
            // Obtiene los permisos de rol para el usuario
            let assignData = [];
            if (user.rolId === 1) {
                assignData = await adminDataAssignment();
            } else {
                assignData = await roleDataAssignment(user.departamentoId);
            }

            user.dataValues.departamento = assignData.departamentosData;
            user.dataValues.programaEstudio = assignData.programasEstudioData;

            return res.json({
                success: true,
                message: 'Inicio de sesión exitoso.',
                data: user,
                departamento: assignData.departamentosData,
                programaEstudio: assignData.programasEstudioData
            });
        } else {
            return res.json({ success: false, message: 'Usuario o contraseña incorrectos.' });
        }

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
                    [sequelize.col('rol.nombre'), 'rolNombre']
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
    const { id } = req.query;

    try {
        const user = await Usuario.findOne({
            where: {
                usuarioId: id
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
                usuario.urlImagen = usuario.urlImagen ? usuario.urlImagen : 'user.webp';

                usuario.password = await bcrypt.hash(usuario.password, 8);

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

exports.uploadProfileImage = async (req, res) => {
    try {
        const { body, file } = req;

        if (!file) {
            const error = new Error("No File");
        }

        nameFile = file.originalname.replace(/['"]+/g, '').replace(/ /g, '-');

        const fileData = {
            success: true,
            message: "Se ha subido correctamente",
            nameFile: nameFile
        };

        res.send({ fileData });
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al subir el archivo",
            error: e.message,
            file: req.body.file
        });
    }
};