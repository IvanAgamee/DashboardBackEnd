const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Carrera = require("./Carrera");
const Administrativo = require("./Administrativo");

const AdministrativoCarrera = sequelize.define("tbl_administrativo_carrera", {
    adminCarreraId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    administrativoId: {
        type: Sequelize.INTEGER,
    },
    carreraId: {
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

module.exports = AdministrativoCarrera;