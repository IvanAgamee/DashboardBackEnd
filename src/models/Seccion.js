const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Modulo = require("./Modulo");
const ProgramaEstudio = require("./ProgramaEstudio");
const Especialidad = require("./Especialidad");

const Seccion = sequelize.define("tbl_seccion", {
    seccionId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    moduloId: {
        type: Sequelize.INTEGER,
    },
    programaId: {
        type: Sequelize.INTEGER,
    },
    titulo: {
        type: Sequelize.TEXT,
    },
    descripcion: {
        type: Sequelize.TEXT,
    },
    url: {
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
}, {
    freezeTableName: true
});

Seccion.belongsTo(Modulo, {
    foreignKey: 'moduloId',
    as: 'modulo'
});
Seccion.belongsTo(ProgramaEstudio, {
    foreignKey: 'programaId',
    as: 'programas'
});

module.exports = Seccion;