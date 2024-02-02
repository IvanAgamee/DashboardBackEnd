const Sequelize = require('sequelize').Sequelize;
require('dotenv').config();

const sequelize = new Sequelize(
process.env.DB_DATABASE, // base de datos
process.env.DB_USER, // usuario
process.env.DB_PASSWORD, // contraseña
{
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    dialect: 'mysql',
    logging: false
});

sequelize.authenticate().then(() => {
    console.log('Connection has been established successfully.');
}).catch((error) => { 
    console.error('Unable to connect to the database: ', error);
});

module.exports = sequelize;