const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Modulo = require("./Modulo");
const Carrera = require("./Carrera");

const Pagina = sequelize.define("tbl_pagina", {
    paginaId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    moduloId: {
        type: Sequelize.INTEGER,
    },
    carreraId: {
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
});

Pagina.belongsTo(Modulo, {
    foreignKey: 'moduloId',
    as: 'modulo'
});

Pagina.belongsTo(Carrera, {
    foreignKey: 'carreraId',
    as: 'carrera'
});
module.exports = Pagina;