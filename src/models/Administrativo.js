const { Sequelize } = require("sequelize");
const sequelize = require("../database/database");
const Carrera = require("./Carrera");
const AdministrativoCarrera = require("./AdministrativoCarrera");

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

    
// Asociaciones M:M de tablas Cliente y Agente Aduanal
Administrativo.belongsToMany(Carrera, {  // Un cliente pertenece a muchos agentes aduanales
    through: AdministrativoCarrera,  // Modelo que actúa como la unión de Cliente y Agente Aduanal
    foreignKey: "administrativoId",   // Llave foránea que hace referencia a Cliente
    as: "administrativos"    // Alias
});
Carrera.belongsToMany(Administrativo, {  // Un agente aduanal pertenece a muchos clientes
    through: AdministrativoCarrera,   // Modelo que actúa como la unión de Cliente y Agente Aduanal
    foreignKey: "carreraId",  // Llave foránea que hace referencia a Agente Aduanal
});

Carrera.hasMany(AdministrativoCarrera, { foreignKey: "carreraId", as: "administrativoCarrera" });
Administrativo.hasMany(AdministrativoCarrera, { foreignKey: "administrativoId",  as: "administrativoCarrera"});

AdministrativoCarrera.belongsTo(Carrera, { foreignKey: "carreraId" });
AdministrativoCarrera.belongsTo(Administrativo, { foreignKey: "administrativoId" });

module.exports = Administrativo;