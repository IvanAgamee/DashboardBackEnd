const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Departamento = require("./Departamento");

const Carrera = sequelize.define("tbl_carrera", {
    carreraId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    nombre: {
        type: Sequelize.STRING,
    },
    departamentoId: {
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
}
);

Carrera.belongsTo(Departamento, {
    foreignKey: 'departamentoId',
    as: 'departamento'
});

module.exports = Carrera;