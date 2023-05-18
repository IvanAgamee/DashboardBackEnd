const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Usuario = require('../models/Usuario');
const Rol = require('../models/Rol');


exports.login = async (req, res) => {
    try {
        const { username, password } = req.body;

        const user = await Usuario.findOne({
            where: {
                username,
                password
            },
            include: [{
                model: Rol,
                as: 'rol'
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

exports.getUsuarioById = async (req, res) => {
    try {
        const usuario = await Usuario.findAll({
            where: {
                status: 1,
            },
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: usuario,
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

exports.crudMateria = async (req, res) => {
    try {
        let materia = req.body; // Guarda los datos de la materia en la variable

        if (materia.materiaId == null) { // En caso de que el id sea nulo, se crea una nueva materia.
            let newMateria = await Materia.create(materia);
            if (newMateria) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado la materia.",
                });
            }
        } else if (materia.materiaId) { // En caso de que el id NO sea nulo, se actualiza la materia.
            let materiaId = materia.materiaId;
            delete materia.materiaId;

            let updatedMateria = await Materia.update(materia, {
                where: {
                    materiaId: materiaId
                }
            });
            if (updatedMateria) {
                return res.status(200).json({
                    success: true,
                    message: "Se ha guardado la materia.",
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
