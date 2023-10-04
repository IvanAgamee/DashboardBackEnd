const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const ProgramaEstudio = require("./ProgramaEstudio");

const LineaInvestigacion = sequelize.define("tbl_linea_investigacion", {
    lineaInvestigacionId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    programaId: {
        type: Sequelize.INTEGER,
    },
    nombre: {
        type: Sequelize.STRING,
    },
    objetivo: {
        type: Sequelize.STRING,
    },
    integrantes: {
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
},{
    freezeTableName: true
});

LineaInvestigacion.belongsTo(ProgramaEstudio, {
    foreignKey: 'programaId',
    as: 'programas' //nombre alias
});

module.exports = LineaInvestigacion;