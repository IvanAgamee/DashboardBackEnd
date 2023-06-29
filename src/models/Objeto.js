const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Seccion = require("./Seccion");

const Objeto = sequelize.define("tbl_objeto", {
    objetoId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    seccionId: {
        type: Sequelize.INTEGER,
    },
    imagen: {
        type: Sequelize.TEXT,
    },
    titulo: {
        type: Sequelize.TEXT,
    },
    descripcion: {
        type: Sequelize.TEXT,
    },
    posicion: {
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
}, {
    freezeTableName: true
});

Objeto.belongsTo(Seccion, {
    foreignKey: 'seccionId',
    as: 'seccion'
});
Seccion.hasMany(Objeto, {
    foreignKey: 'seccionId',
    as: 'objeto'
});
module.exports = Objeto;