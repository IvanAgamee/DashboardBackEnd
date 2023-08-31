const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Rol = require("./Rol");
const Departamento = require("./Departamento");

const Usuario = sequelize.define("tbl_usuario", {
    usuarioId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    rolId: {
        type: Sequelize.INTEGER,
    },
    departamentoId: {
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
    urlImagen: {
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
},
{
    freezeTableName: true
});

Usuario.belongsTo(Rol, {
    foreignKey: 'rolId',
    as: 'rol'
});

Usuario.belongsTo(Departamento, {
    foreignKey: 'departamentoId',
    as: 'departamento'
});
module.exports = Usuario;