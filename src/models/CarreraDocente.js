const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Carrera = require("./Carrera");
const Docente = require("./Docente");

const CarreraDocente = sequelize.define("tbl_carrera_docente", {
    carreraDocenteId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    carreraId: {
        type: Sequelize.INTEGER,
    },
    docenteId: {
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
},
{
    freezeTableName: true
});

module.exports = CarreraDocente;