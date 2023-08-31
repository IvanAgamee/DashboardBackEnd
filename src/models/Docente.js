const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const ProgramaEstudio = require("./ProgramaEstudio");
const ProgramaDocente = require("./ProgramaDocente");

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
    perfilDeseable: {
        type: Sequelize.INTEGER,
    },
    sni: {
        type: Sequelize.STRING,
    },
    orcid: {
        type: Sequelize.STRING,
    },
    areasInteres: {
        type: Sequelize.STRING,
    },
    resumenCONAHCYT: {
        type: Sequelize.STRING,
    },
    googleAcademico: {
        type: Sequelize.STRING,
    },
    researchGate: {
        type: Sequelize.STRING,
    },
    SCOPUS: {
        type: Sequelize.STRING,
    },
    programaId: {
        type: Sequelize.INTEGER,
    },
    tipoDocenteId: {
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


// Asociaciones M:M de tablas Cliente y Agente Aduanal
Docente.belongsToMany(ProgramaEstudio, {  // Un cliente pertenece a muchos agentes aduanales
    through: ProgramaDocente,  // Modelo que actúa como la unión de Cliente y Agente Aduanal
    foreignKey: "docenteId",   // Llave foránea que hace referencia a Cliente
    as: "docentes"    // Alias
});
ProgramaEstudio.belongsToMany(Docente, {  // Un agente aduanal pertenece a muchos clientes
    through: ProgramaDocente,   // Modelo que actúa como la unión de Cliente y Agente Aduanal
    foreignKey: "programaId",  // Llave foránea que hace referencia a Agente Aduanal
    as: "programas"
});

ProgramaEstudio.hasMany(ProgramaDocente, { foreignKey: "programaId", as: "programaDocente" });
Docente.hasMany(ProgramaDocente, { foreignKey: "docenteId", as: "programaDocente" });

ProgramaDocente.belongsTo(ProgramaEstudio, { foreignKey: "programaId" });
ProgramaDocente.belongsTo(Docente, { foreignKey: "docenteId" });

module.exports = Docente;