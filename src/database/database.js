const Sequelize = require('sequelize').Sequelize;
require('dotenv').config();

const sequelize = new Sequelize(
data.env.DB_DATABASE, // base de datos
data.env.DB_USER, // usuario
data.env.DB_PASSWORD, // contraseña
{
    host: data.env.DB_HOST,
    port: data.env.DB_PORT,
    dialect: 'mysql',
    logging: false
});

sequelize.authenticate().then(() => {
    console.log('Connection has been established successfully.');
}).catch((error) => {
    console.error('Unable to connect to the database: ', error);
});

module.exports = sequelize;