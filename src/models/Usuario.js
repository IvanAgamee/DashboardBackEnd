const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Rol = require("./Rol");

const Usuario = sequelize.define("tbl_usuario", {
    usuarioId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    rolId: {
        type: Sequelize.INTEGER,
    },
    nombre: {
        type: Sequelize.STRING,
    },
    username: {
        type: Sequelize.STRING,
    },
    password: {
        type: Sequelize.STRING,
    },
    status: {
        type: Sequelize.INTEGER,
    },
    createdBy: {
        type: Sequelize.INTEGER,
    },
    createdAt: {
        type: Sequelize.DATE,
    },
    updatedBy: {
        type: Sequelize.INTEGER,
    },
    updatedAt: {
        type: Sequelize.DATE,
    }
});

Usuario.belongsTo(Rol, {
    foreignKey: 'rolId',
    as: 'rol'
});
module.exports = Usuario;