const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Carrera = require("./Carrera");

const Docente = sequelize.define("tbl_docente", {
    docenteId: {
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
    descripcion: {
        type: Sequelize.TEXT,
    },
    informacionAcademica: {
        type: Sequelize.TEXT,
    },
    materias: {
        type: Sequelize.TEXT,
    },
    contacto: {
        type: Sequelize.TEXT,
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
});

Docente.belongsTo(Carrera, {
    foreignKey: 'carreraId',
    as: 'carrera'
});

module.exports = Docente;