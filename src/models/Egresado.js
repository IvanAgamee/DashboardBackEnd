const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const GeneracionEgresada = require("./GeneracionEgresada");

const Egresado = sequelize.define("tbl_egresado", {
    egresadoId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    nombre: {
        type: Sequelize.STRING,
    },
    director: {
        type: Sequelize.STRING,
    },
    tutor: {
        type: Sequelize.TEXT,
    },
    tesis: {
        type: Sequelize.TEXT,
    },
    generacionId: {
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

Egresado.belongsTo(GeneracionEgresada, {
    foreignKey: 'generacionId',
    as: 'generacion' //nombre alias
});

GeneracionEgresada.hasMany(Egresado, {
    foreignKey: 'generacionId',
    as: 'egresados' //nombre alias
})

module.exports = Egresado;