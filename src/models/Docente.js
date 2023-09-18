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


// Asociaciones M:M de tablas Docente y Programa de Estudio
Docente.belongsToMany(ProgramaEstudio, {  // Un docente pertenece a muchos programas de estudio
    through: ProgramaDocente,  // Modelo que actúa como la unión de Docente y Programa de estudio
    foreignKey: "docenteId",   // Llave foránea que hace referencia a Docente
    as: "docentes"    // Alias
});
ProgramaEstudio.belongsToMany(Docente, {  // Un programa de estudio pertenece a muchos docentes
    through: ProgramaDocente,   // Modelo que actúa como la unión de Dicente y Programa de estudio
    foreignKey: "programaId",  // Llave foránea que hace referencia a Programa de estudio
    as: "programa"
});

ProgramaEstudio.hasMany(ProgramaDocente, { foreignKey: "programaId", as: "programaDocente" });
Docente.hasMany(ProgramaDocente, { foreignKey: "docenteId", as: "programaDocente" });

ProgramaDocente.belongsTo(ProgramaEstudio, { foreignKey: "programaId" });
ProgramaDocente.belongsTo(Docente, { foreignKey: "docenteId" });

module.exports = Docente;