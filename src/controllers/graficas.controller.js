const { Sequelize } = require('sequelize');
const sequelize = require("../database/database");
const Docente = require("../models/Docente");
const Usuario = require("../models/Usuario");
const Materia = require("../models/Materia");
const CarreraDocente = require('../models/CarreraDocente');
const Carrera = require('../models/Carrera');
const Comunidad = require('../models/Comunidad');

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