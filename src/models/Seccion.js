const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Modulo = require("./Modulo");

const Seccion = sequelize.define("tbl_seccion", {
    seccionId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    moduloId: {
        type: Sequelize.INTEGER,
    },
    titulo: {
        type: Sequelize.TEXT,
    },
    descripcion: {
        type: Sequelize.TEXT,
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

Seccion.belongsTo(Modulo, {
    foreignKey: 'moduloId',
    as: 'modulo'
});

module.exports = Seccion;