const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");

const Objeto = sequelize.define("tbl_objeto", {
    objetoId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    seccionId: {
        type: Sequelize.INTEGER,
    },
    imagen: {
        type: Sequelize.TEXT,
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

Objeto.belongsTo(Seccion, {
    foreignKey: 'seccionId',
    as: 'seccion'
});
module.exports = Objeto;