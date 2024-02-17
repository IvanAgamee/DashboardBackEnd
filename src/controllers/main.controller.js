const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Docente = require("../models/Docente");
const Usuario = require("../models/Usuario");
const Materia = require("../models/Materia");
const ProgramaDocente = require('../models/ProgramaDocente');
const ProgramaEstudio = require('../models/ProgramaEstudio');
const Comunidad = require('../models/Comunidad');
const fs = require('fs');
const path = require('path');
const multer = require("multer");
const PATH_STORAGE = `${__dirname}/../storage`;

// Número total de usuarios
exports.getTotalUsuarios = async (req, res) => {
    try {
        const total = await Usuario.count({
            where: {
                status: 1
            },
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: total,
        });
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al obtener los registros.",
            error: e.message,
        });
    }
};

// Número total de profesores según el ID de una ProgramaEstudio
exports.getTotalDocentesByProgramaID = async (req, res) => {
    try {
        const { programaId } = req.query;

        const total = await Docente.count({
            where: {
                status: 1
            },
            include: [{
                model: ProgramaDocente,
                attributes: [],
                as: "programaDocente",
                where: {
                    status: 1,
                    programaId: programaId
                }
            }]
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: total,
        });
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al obtener los registros.",
            error: e.message,
        });
    }
};

// Número total de docentes
exports.getTotalDocentes = async (req, res) => {
    try {
        const total = await Docente.count({
            where: {
                status: 1
            },
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: total,
        });
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al obtener los registros.",
            error: e.message,
        });
    }
};

// Número total de materias
exports.getTotalMaterias = async (req, res) => {
    try {
        const total = await Materia.count({
            where: {
                status: 1
            },
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: total,
        });
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al obtener los registros.",
            error: e.message,
        });
    }
};

// Número total de materias
exports.getTotalMaterias = async (req, res) => {
    try {
        const total = await Materia.count({
            where: {
                status: 1
            },
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: total,
        });
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al obtener los registros.",
            error: e.message,
        });
    }
};

// Número total de programas
exports.getTotalMateriasByProgramaId = async (req, res) => {
    try {

        const { programaId } = req.query;

        const total = await Materia.count({
            where: {
                status: 1,
                programaId: programaId
            },
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: total,
        });
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al obtener los registros.",
            error: e.message,
        });
    }
};

// Número total de programas
exports.getTotalProgramas = async (req, res) => {
    try {
        const total = await ProgramaEstudio.count({
            where: {
                status: 1
            },
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: total,
        });
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al obtener los registros.",
            error: e.message,
        });
    }
};

// Número total de comunidades
exports.getTotalComunidades = async (req, res) => {
    try {
        const total = await Comunidad.count({
            where: {
                status: 1
            },
        });
        return res.json({
            success: true,
            message: "Se han encontrado registros.",
            data: total,
        });
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al obtener los registros.",
            error: e.message,
        });
    }
};


exports.getFileFromStorage = async (req, res) => {
    try {
        const filePath = path.resolve(`${PATH_STORAGE}/${req.body.pathFile}`, `${req.body.filename}`);
        let filepath = filePath;
        res.sendFile(filepath);
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            success: false,
            message: "Ha ocurrido un error al obtener el archivo.",
            error: e,
        });
    }
};

/**
 * Remueve el archivo ubicado en el directorio proporcionado.
 * @param {Object} req - Objeto de solicitud HTTP.
 * @param {Object} res - Objeto de respuesta HTTP.
 * @returns {Object} - Objeto de respuesta JSON con los resultados 
 */
exports.removeFileFromStorage = (req, res) => {
    let pathFile = req.body.pathFile;

    const filePath = path.join(PATH_STORAGE, pathFile);

    try {
        if (fs.existsSync(filePath)) {
            fs.unlinkSync(filePath);
            return res.json({ success: true, message: 'Se ha eliminado correctamente' });
        } else {
            return res.json({ success: false, message: 'El archivo no existe' });
        }
    } catch (err) {
        return res.json({ success: false, message: 'Error al eliminar el archivo' });
    }
}

exports.getFolderPrograma = (id) => {
    try {
        let name;
        switch (Number(id)) {
            case 1:
                name = 'Ing-Gestion-Empresarial';
                break;
            case 2:
                name = 'Lic-Administracion'
                break;
            case 3:
                name = 'Ing-Quimica'
                break;
            case 4:
                name = 'Ing-Bioquimica'
                break;
            case 5:
                name = 'Ing-Mecanica'
                break;
            case 6:
                name = 'Ing-Mecatronica'
                break;
            case 7:
                name = 'Ing-Industrial'
                break;
            case 8:
                name = 'Ing-EER'
                break;
            case 9:
                name = 'Ing-Electrica'
                break;
            case 10:
                name = 'Ing-Electronica'
                break;
            case 11:
                name = 'Ing-SistemasComputacionales'
                break;
            case 12:
                name = 'MECEIB'
                break;
            case 13:
                name = 'Doct-CienciasAlimentos'
                break;
            case 14:
                name = 'Mtria-Administracion'
                break;
            case 15:
                name = 'MEEYER'
                break;
        }
        return name
    } catch (error) {
        console.log(error);
        return null;
    }
};

function checkFolderExists(folderName) {
    try {
        // Verificar si la carpeta existe
        if (!fs.existsSync(folderName)) {
            // Crear la carpeta
            fs.mkdirSync(folderName);
            console.log('Carpeta creada correctamente.');
        } else {
            console.log('La carpeta ya existe.');
        }
    } catch (error) {
        console.log('Folder util error: ', error);
    }
}

exports.getIconosByProgramaId = (req, res) => {
    try {

        const programaEstudio = this.getFolderPrograma(req.body.programaId);
        const pathFile = `${programaEstudio}/iconos/`

        fs.readdir(`${PATH_STORAGE}/${pathFile}`, (err, archivos) => {
            if (err) {
                console.error(err);
                return res.status(500).send('Error interno del servidor');
            }

            return res.json({
                success: true,
                message: "Se han encontrado registros.",
                data: {
                    pathFile: pathFile,
                    icons: archivos
                },
            });
        });

    } catch (error) {
        console.log(error);
        return res.status(500).send('Error interno del servidor');
    }
}

// module.exports = { checkFolderExists };