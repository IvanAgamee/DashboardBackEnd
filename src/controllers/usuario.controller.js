const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Usuario = require('../models/Usuario');
const Rol = require('../models/Rol');
const bcrypt = require('bcrypt');
require('dotenv').config();
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
        if (result && user.status === 1) {
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
        } else if (result && user.status === 0) {
            return res.json({ success: false, message: 'Usuario inhabilitado. Comuníquese con un administrador.' });
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
            delete usuario.password;

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

exports.changePassword = async (req, res) => {
    try {
        const userData = req.body;

        // Se busca el usuario
        const user = await Usuario.findOne({
            where: {
                username: userData.username
            }
        });

        if (user) {
            const newPassword = await bcrypt.hash(userData.newPassword, 8);
            const updatedUser = await Usuario.update({ password: newPassword }, {
                where: {
                    usuarioId: user.usuarioId
                }
            });

            return res.status(200).json({
                success: true,
                message: "Se ha actualizado la contraseña.",
            });
        } else {
            return res.status(500).json({
                success: false,
                message: `El usuario no existe.`,
            });
        }
    } catch (error) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: `Ha ocurrido un error.`,
            error: e
        });
    }
}

const validateEmail = (email) => {
    return String(email)
        .toLowerCase()
        .match(
            /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        );
};

exports.forgottenPasswordMail = async (req, res) => {
    try {
        const nodemailer = require("nodemailer");
        const username = req.body.username;
        // Se busca el usuario
        const user = await Usuario.findOne({
            where: {
                username: username
            }
        });

        // En caso de que exista, se actualiza la contraseña.
        if (user && user.email) {
            const newPassword = await bcrypt.hash('Temporal01', 8);
            const updatedUser = await Usuario.update({ password: newPassword }, {
                where: {
                    usuarioId: user.usuarioId
                }
            });
            // Configuración de correo.
            const transporter = nodemailer.createTransport({
                host: "smtp.office365.com",
                port: 587,
                requireTLS: true,
                secure: false,
                auth: {
                    user: data.env.EMAIL,
                    pass: data.env.PASSWORD,
                },
            });

            const body = '<h4>Ha solicitado la recuperación de contraseña para el acceso al Dashboard de '
                + 'las Páginas Institucionales. Sus datos para acceder son los siguientes: </h4>'
                + '<br>Usuario: ' + username
                + '<br>Nueva contraseña: Temporal01'
                + '<br><h4>Le recomendamos cambiar su contraseña una vez entre al sistema.</h4>'
                + '<br><h4>Este correo se ha generado automáticamente. Las respuestas enviadas a esta dirección de correo no se revisan.</h4>';

            const mailOptions = {
                from: data.env.EMAIL,
                to: validateEmail(user.email),
                subject: 'Recuperación de contraseña',
                html: body
            };

            // Se realiza el envío.
            transporter.sendMail(mailOptions, function (e, info) {
                if (e) {
                    console.log(e)
                    return res.status(500).json({
                        success: false,
                        message: `Ha ocurrido un error al mandar el correo`,
                    });
                } else {
                    return res.status(200).json({
                        success: true,
                        message: "Se ha enviado el correo",
                    });
                }
            });
        } else {
            return res.status(500).json({
                success: false,
                message: `No se encontró el usuario o no hay un correo electrónico asociado a tu usuario. Comuníquese con un administrador.`,
            });
        }

    } catch (e) {
        console.log(e)
        return res.status(500).json({
            success: false,
            message: `Ha ocurrido un error al mandar el correo`,
        });
    }
};

exports.uploadProfileImage = async (req, res) => {
    try {
        const { body, file } = req;

        if (!file) {
            const error = new Error("No File");
        }

        nameFile = file.originalname.replace(/['"]+/g, '-').replace(/ /g, '-');

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