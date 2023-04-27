const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Carrera = require("./Carrera");

const Especialidad = sequelize.define("tbl_especialidad", {
    especialidadId: {
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
    }
);

Especialidad.belongsTo(Carrera, {
    foreignKey: 'carreraId',
    as: 'carrera'
});

module.exports = Especialidad;