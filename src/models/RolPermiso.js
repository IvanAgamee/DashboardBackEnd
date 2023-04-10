const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Rol = require("./Rol");
const Departamento = require("./Departamento");

const RolPermiso = sequelize.define("tbl_rolPermiso", {
    rolPermisoId: {
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
    add: {
        type: Sequelize.INTEGER,
    },
    modify: {
        type: Sequelize.INTEGER,
    },
    delete: {
        type: Sequelize.INTEGER,
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

RolPermiso.belongsTo(Rol, {
    foreignKey: 'rolId',
    as: 'rol'
});

RolPermiso.belongsTo(Departamento, {
    foreignKey: 'departamentoId',
    as: 'departamento'
});

module.exports = RolPermiso;