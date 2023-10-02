const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const ProgramaEstudio = require("./ProgramaEstudio");
const Egresado = require("./Egresado");

const GeneracionEgresada = sequelize.define("tbl_generacion_egresada", {
    generacionId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    generacionPosgrado: {
        type: Sequelize.STRING,
    },
    fechaInicial: {
        type: Sequelize.DATE,
    },
    fechaFinal: {
        type: Sequelize.DATE,
    },
    programaId: {
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

GeneracionEgresada.belongsTo(ProgramaEstudio, {
    foreignKey: 'programaId',
    as: 'programas' //nombre alias
});


module.exports = GeneracionEgresada;