const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const ProgramaEstudio = require("./ProgramaEstudio");

const Comunidad = sequelize.define("tbl_comunidad", {
    comunidadId: {
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
},{
    freezeTableName: true
});

Comunidad.belongsTo(ProgramaEstudio, {
    foreignKey: 'programaId',
    as: 'programas' //nombre alias
});

module.exports = Comunidad;