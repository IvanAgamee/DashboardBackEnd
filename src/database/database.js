const Sequelize = require('sequelize').Sequelize;

// Eric Connexion:
// const sequelize = new Sequelize(
//     'dashboardCarreras', // base de datos
//     'monitor', // usuario
//     '12345', // contraseña
//     {
//         host: '127.0.0.1',
//         port: 3309,
//         dialect: 'mysql',
//         logging: true
//     });


//Conexion para los demás:

const sequelize = new Sequelize(
'dashboardCarreras', // base de datos
'root', // usuario
'', // contraseña
{
    host: 'localhost',
    port: 3306,
    dialect: 'mysql',
    logging: true
});

sequelize.authenticate().then(() => {
    console.log('Connection has been established successfully.');
}).catch((error) => {
    console.error('Unable to connect to the database: ', error);
});

module.exports = sequelize;