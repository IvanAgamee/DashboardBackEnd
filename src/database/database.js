const Sequelize = require('sequelize').Sequelize;


const sequelize = new Sequelize(
'ProgramasEstudioITVER', // base de datos
'root', // usuario
'', // contraseña
{
    host: 'localhost',
    port: 3306,
    dialect: 'mysql',
    logging: false
});

sequelize.authenticate().then(() => {
    console.log('Connection has been established successfully.');
}).catch((error) => {
    console.error('Unable to connect to the database: ', error);
});

module.exports = sequelize;