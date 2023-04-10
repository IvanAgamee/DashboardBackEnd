const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Carrera = require("./Carrera");

const Comunidad = sequelize.define("tbl_comunidad", {
    comunidadId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    carreraId: {
        type: Sequelize.INTEGER,
    },
    nombre: {
        type: Sequelize.STRING,
    },
    logo: {
        type: Sequelize.STRING,
    },
    quienesSomos: {
        type: Sequelize.TEXT,
    },
    queHacemos: {
        type: Sequelize.TEXT,
    },
    fotosComunidad: {
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

Comunidad.belongsTo(Carrera, {
    foreignKey: 'carreraId',
    as: 'carrera'
});

module.exports = Comunidad;