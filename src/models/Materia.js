const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Carrera = require("./Carrera");
const Especialidad = require("./Especialidad");

const Materia = sequelize.define("tbl_materia", {
    materiaId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    carreraId: {
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

Materia.belongsTo(Carrera, {
    foreignKey: 'carreraId',
    as: 'carrera'
});

Materia.belongsTo(Especialidad, {
    foreignKey: 'especialidadId',
    as: 'especialidad'
});

module.exports = Materia;