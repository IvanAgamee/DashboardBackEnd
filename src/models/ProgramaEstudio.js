const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Departamento = require("./Departamento");

const ProgramaEstudio = sequelize.define("tbl_programa_estudio", {
    programaId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    departamentoId: {
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

ProgramaEstudio.belongsTo(Departamento, {
    foreignKey: 'departamentoId',
    as: 'departamento'
});

Departamento.hasMany(ProgramaEstudio, {
    foreignKey: 'departamentoId',
    as: 'programaEstudio'
})

module.exports = ProgramaEstudio;