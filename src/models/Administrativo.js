const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const ProgramaEstudio = require("./ProgramaEstudio");
const AdministrativoPrograma = require("./AdministrativoPrograma");
const PuestoAdministrativo = require("./PuestoAdministrativo");

const Administrativo = sequelize.define("tbl_administrativo", {
    administrativoId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    puestoId: {
        type: Sequelize.INTEGER,
    },
    nombre: {
        type: Sequelize.STRING,
    },
    descripcion: {
        type: Sequelize.STRING,
    },
    imagen: {
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


Administrativo.belongsTo(PuestoAdministrativo, {
    foreignKey: "puestoId",
    as: "puesto"
})
// Asociaciones M:M de tablas Cliente y Agente Aduanal
Administrativo.belongsToMany(ProgramaEstudio, {  // Un cliente pertenece a muchos agentes aduanales
    through: AdministrativoPrograma,  // Modelo que actúa como la unión de Cliente y Agente Aduanal
    foreignKey: "administrativoId",   // Llave foránea que hace referencia a Cliente
    as: "administrativos"    // Alias
});
ProgramaEstudio.belongsToMany(Administrativo, {  // Un agente aduanal pertenece a muchos clientes
    through: AdministrativoPrograma,   // Modelo que actúa como la unión de Cliente y Agente Aduanal
    foreignKey: "programaId",
    as: "programas" 
});

ProgramaEstudio.hasMany(AdministrativoPrograma, { foreignKey: "programaId", as: "administrativoPrograma" });
Administrativo.hasMany(AdministrativoPrograma, { foreignKey: "administrativoId", as: "administrativoPrograma" });

AdministrativoPrograma.belongsTo(ProgramaEstudio, { foreignKey: "programaId" });
AdministrativoPrograma.belongsTo(Administrativo, { foreignKey: "administrativoId" });

module.exports = Administrativo;