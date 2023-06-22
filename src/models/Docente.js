const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Carrera = require("./Carrera");
const CarreraDocente = require("./CarreraDocente");

const Docente = sequelize.define("tbl_docente", {
    docenteId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    nombre: {
        type: Sequelize.STRING,
    },
    descripcion: {
        type: Sequelize.TEXT,
    },
    informacionAcademica: {
        type: Sequelize.TEXT,
    },
    materias: {
        type: Sequelize.TEXT,
    },
    contacto: {
        type: Sequelize.TEXT,
    },
    urlImagen: {
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
    });


// Asociaciones M:M de tablas Cliente y Agente Aduanal
Docente.belongsToMany(Carrera, {  // Un cliente pertenece a muchos agentes aduanales
    through: CarreraDocente,  // Modelo que actúa como la unión de Cliente y Agente Aduanal
    foreignKey: "docenteId",   // Llave foránea que hace referencia a Cliente
    as: "docentes"    // Alias
});
Carrera.belongsToMany(Docente, {  // Un agente aduanal pertenece a muchos clientes
    through: CarreraDocente,   // Modelo que actúa como la unión de Cliente y Agente Aduanal
    foreignKey: "carreraId",  // Llave foránea que hace referencia a Agente Aduanal
    as: "carrera"
});

Carrera.hasMany(CarreraDocente, { foreignKey: "carreraId", as: "carreraDocente" });
Docente.hasMany(CarreraDocente, { foreignKey: "docenteId", as: "carreraDocente" });

CarreraDocente.belongsTo(Carrera, { foreignKey: "carreraId" });
CarreraDocente.belongsTo(Docente, { foreignKey: "docenteId" });

module.exports = Docente;