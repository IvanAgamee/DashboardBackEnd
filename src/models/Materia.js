const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const ProgramaEstudio = require("./ProgramaEstudio");
const Especialidad = require("./Especialidad");

const Materia = sequelize.define("tbl_materia", {
    materiaId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    programaId: {
        type: Sequelize.INTEGER,
    },
    lineaInvestigacionId: {
        type: Sequelize.INTEGER,
    },
    especialidadId: {
        type: Sequelize.INTEGER,
    },
    nombre: {
        type: Sequelize.STRING,
    },
    area: {
        type: Sequelize.STRING,
    },
    semestre: {
        type: Sequelize.INTEGER,
    },
    competencia: {
        type: Sequelize.TEXT,
    },
    creditos: {
        type: Sequelize.INTEGER,
    },
    matricula: {
        type: Sequelize.STRING,
    },
    urlVideo: {
        type: Sequelize.STRING,
    },
    urlPrograma: {
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

Materia.belongsTo(ProgramaEstudio, {
    foreignKey: 'programaId',
    as: 'programas'
});

Materia.belongsTo(Especialidad, {
    foreignKey: 'especialidadId',
    as: 'especialidad'
});

Especialidad.hasMany(Materia, {
    foreignKey: 'especialidadId',
    as: 'materias'
});

module.exports = Materia;