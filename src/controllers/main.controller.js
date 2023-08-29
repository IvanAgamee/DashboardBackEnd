const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Docente = require("../models/Docente");
const Usuario = require("../models/Usuario");
const Materia = require("../models/Materia");
const CarreraDocente = require('../models/CarreraDocente');
const Carrera = require('../models/Carrera');
const Comunidad = require('../models/Comunidad');
const fs = require('fs');
const path = require('path');
const multer = require("multer");
let PATH_STORAGE = `${__dirname}/../storage`;

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

// Número total de profesores según el ID de una carrera
exports.getTotalDocentesByCarreraID = async (req, res) => {
    try {
        const { carreraId } = req.query;

        const total = await Docente.count({
            where: {
                status: 1
            },
            include: [{
                model: CarreraDocente,
                attributes: [],
                as: "carreraDocente",
                where: {
                    status: 1,
                    carreraId: carreraId
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

// Número total de carreras
exports.getTotalMateriasByCarreraId = async (req, res) => {
    try {

        const { carreraId } = req.query;

        const total = await Materia.count({
            where: {
                status: 1,
                carreraId: carreraId
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

// Número total de carreras
exports.getTotalCarreras = async (req, res) => {
    try {
        const total = await Carrera.count({
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
        console.log(req.body)
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