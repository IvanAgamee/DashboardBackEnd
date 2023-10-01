SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `programasestudioitver` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `programasestudioitver`;

CREATE TABLE `tbl_administrativo` (
  `administrativoId` int(11) NOT NULL,
  `puestoId` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` text DEFAULT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_administrativo_programa` (
  `adminProgramaId` int(11) NOT NULL,
  `administrativoId` int(11) NOT NULL,
  `programaId` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_comunidad` (
  `comunidadId` int(11) NOT NULL,
  `programaId` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `logo` varchar(250) NOT NULL,
  `quienesSomos` text NOT NULL,
  `queHacemos` text NOT NULL,
  `fotosComunidad` text DEFAULT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_departamento` (
  `departamentoId` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tbl_departamento` (`departamentoId`, `nombre`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'Departamento de Ciencias Económico Administrativas', 1, NULL, NULL, NULL, NULL),
(2, 'Departamento de Ingeniería Química-Bioquímica', 1, NULL, NULL, NULL, NULL),
(3, 'Departamento de Ingeniería Metal-Mecánica', 1, NULL, NULL, NULL, NULL),
(4, 'Departamento Industrial', 1, NULL, NULL, NULL, NULL),
(5, 'Departamento de Ingeniería Eléctrica-Electrónica', 1, NULL, NULL, NULL, NULL),
(6, 'Departamento de Sistemas y Computación', 1, NULL, NULL, NULL, NULL),
(7, 'División de Estudios de Posgrados e Investigación', 1, NULL, NULL, NULL, NULL);

CREATE TABLE `tbl_docente` (
  `docenteId` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `informacionAcademica` text DEFAULT NULL,
  `materias` text DEFAULT NULL,
  `contacto` text DEFAULT NULL,
  `urlImagen` varchar(150) DEFAULT NULL,
  `perfilDeseable` tinyint(1) DEFAULT NULL,
  `sni` varchar(150) DEFAULT NULL,
  `orcid` varchar(150) DEFAULT NULL,
  `areasInteres` varchar(150) DEFAULT NULL,
  `resumenCONAHCYT` varchar(150) DEFAULT NULL,
  `googleAcademico` varchar(150) DEFAULT NULL,
  `researchGate` varchar(150) DEFAULT NULL,
  `SCOPUS` varchar(150) DEFAULT NULL,
  `programaId` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_egresado` (
  `egresadoId` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `director` varchar(150) NOT NULL,
  `tutor` varchar(150) NOT NULL,
  `tesis` varchar(150) NOT NULL,
  `generacionId` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_programa_estudio` (
  `programaId` int(11) NOT NULL,
  `departamentoId` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `isPosgrado` tinyint(1) DEFAULT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tbl_programa_estudio` (`programaId`, `departamentoId`, `nombre`, `isPosgrado`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 1, 'Ingeniería en Gestión Empresarial', 0, 1, NULL, NULL, NULL, NULL),
(2, 1, 'Licenciatura en Administración', 0, 1, NULL, NULL, NULL, NULL),
(3, 2, 'Ingeniería Química', 0, 1, NULL, NULL, NULL, NULL),
(4, 2, 'Ingeniería Bioquímica', 0, 1, NULL, NULL, NULL, NULL),
(5, 3, 'Ingeniería Mecánica', 0, 1, NULL, NULL, NULL, NULL),
(6, 3, 'Ingeniería Mecatrónica', 0, 1, NULL, NULL, NULL, NULL),
(7, 4, 'Ingeniería Industrial', 0, 1, NULL, NULL, NULL, NULL),
(8, 5, 'Ingeniería en Energías Renovables', 0, 1, NULL, NULL, NULL, NULL),
(9, 5, 'Ingeniería Eléctrica', 0, 1, NULL, NULL, NULL, NULL),
(10, 5, 'Ingeniería Electronica', 0, 1, NULL, NULL, NULL, NULL),
(11, 6, 'Ingeniería en Sistemas Computacionales', 0, 1, NULL, NULL, NULL, NULL),
(12, 7, 'Maestría en Ciencias en Ingeniería Bioquímica', 0, 1, NULL, NULL, NULL, NULL),
(13, 7, 'Doctorado en Ciencias en Alimentos', 1, 1, NULL, NULL, NULL, NULL),
(14, 7, 'Maestría en Administración', 1, 1, NULL, NULL, NULL, NULL),
(15, 7, 'Maestría en Eficiencia Energética y Energías Renovables', 1, 1, NULL, NULL, NULL, NULL);


CREATE TABLE `tbl_especialidad` (
  `especialidadId` int(11) NOT NULL,
  `programaId` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tbl_especialidad` (`especialidadId`, `programaId`, `nombre`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 1, 'Calidad y Productividad', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(2, 1, 'Negocios Globales', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(3, 2, 'Gestión y Negocios', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(4, 2, 'Mercadotecnia y Negocios Internacionales', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(5, 3, 'Ingeniería de Procesos', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(6, 3, 'Alimentos', 0, NULL, '2023-09-12', NULL, '2023-09-12'),
(7, 3, 'Gestión Ambiental y de la Seguridad', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(8, 4, 'Ingeniería de Procesos en Alimentos', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(9, 4, 'Ingeniería de Procesos en Ambiente-Energía', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(10, 4, 'Ingeniería de Procesos Farmacéuticos', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(11, 5, 'Manufactura', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(12, 5, 'Mantenimiento', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(13, 6, 'Sistemas Robóticos y Mecatrónicos', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(14, 6, 'Sistemas Digitales', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(15, 6, 'Gestión de Sistemas Energéticos', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(16, 7, 'Gestión Industrial y de la Productividad', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(17, 7, 'Optativas', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(18, 8, 'Gestión de la Calidad de la Energía', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(19, 8, 'Ingeniería Ambiental y Seguridad Laboral', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(20, 8, 'Innovación para el desarrollo empresarial', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(21, 9, 'Aplicaciones Industriales', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(22, 9, 'Gestión de Sistemas Energéticos', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(23, 10, 'Gestión de Sistemas Energéticos', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(24, 10, 'Sistemas Digitales', 1, NULL, '2023-09-12', NULL, '2023-09-12'),
(25, 11, 'Concurrencia Computacional Avanzada', 1, NULL, '2023-09-12', NULL, '2023-09-12');

CREATE TABLE `tbl_generacion_egresada` (
  `generacionId` int(11) NOT NULL,
  `generacionPosgrado` varchar(150) NOT NULL,
  `fechaInicial` date NOT NULL,
  `fechaFinal` date DEFAULT NULL,
  `programaId` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_linea_investigacion` (
  `lineaInvestigacionId` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `objetivo` varchar(150) NOT NULL,
  `integrantes` text DEFAULT NULL,
  `programaId` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_materia` (
  `materiaId` int(11) NOT NULL,
  `programaId` int(11) NOT NULL,
  `lineaInvestigacionId` int(11) DEFAULT NULL,
  `especialidadId` int(11) DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `area` varchar(150) DEFAULT NULL,
  `semestre` int(11) NOT NULL,
  `competencia` text NOT NULL,
  `creditos` int(11) DEFAULT NULL,
  `matricula` varchar(150) DEFAULT NULL,
  `urlVideo` varchar(150) DEFAULT NULL,
  `urlPrograma` varchar(150) DEFAULT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_modulo` (
  `moduloId` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tbl_modulo` (`moduloId`, `nombre`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'Inicio', 1, 1, NULL, NULL, NULL),
(2, 'Perfil de Egreso', 1, 1, NULL, NULL, NULL),
(3, 'Plantilla Docente', 1, 1, NULL, NULL, NULL),
(4, 'Mapa Curricular', 1, 1, NULL, NULL, NULL),
(5, 'Conócenos', 1, 1, NULL, NULL, NULL),
(6, 'Comunidades', 1, 1, NULL, NULL, NULL),
(7, 'Enlaces', 1, 1, NULL, NULL, NULL),
(8, 'Aspirantes', 1, 1, NULL, NULL, NULL),
(9, 'Alumnos', 1, 1, NULL, NULL, NULL),
(10, 'Líneas de investigación', 1, 1, NULL, NULL, NULL),
(11, 'Núcleo Académico', 1, 1, NULL, NULL, NULL),
(12, 'Contacto', 1, 1, NULL, NULL, NULL);

CREATE TABLE `tbl_objeto` (
  `objetoId` int(11) NOT NULL,
  `seccionId` int(11) NOT NULL,
  `imagen` text DEFAULT NULL,
  `titulo` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `posicion` int(10) DEFAULT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_programa_docente` (
  `programaDocenteId` int(11) NOT NULL,
  `programaId` int(11) NOT NULL,
  `docenteId` int(11) DEFAULT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_puesto_administrativo` (
  `puestoId` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tbl_puesto_administrativo` (`puestoId`, `nombre`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'Jefe(a) de Departamento', 1, NULL, NULL, NULL, NULL),
(2, 'Jefe(a) de Proyecto de Investigación y Postgrado', 1, NULL, NULL, NULL, NULL),
(3, 'Jefe(a) de Proyecto de Vinculación', 1, NULL, NULL, NULL, NULL),
(4, 'Jefe(a) de División de Estudios de Posgrados e Investigación', 1, NULL, NULL, NULL, NULL),
(5, 'Coordinador(a) de Carrera', 1, NULL, NULL, NULL, NULL);

CREATE TABLE `tbl_rol` (
  `rolId` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tbl_rol` (`rolId`, `nombre`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'Administrador', 1, NULL, NULL, NULL, NULL),
(2, 'Jefe de departamento', 1, NULL, NULL, NULL, NULL);

CREATE TABLE `tbl_seccion` (
  `seccionId` int(11) NOT NULL,
  `moduloId` int(11) NOT NULL,
  `programaId` int(11) NOT NULL,
  `titulo` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_usuario` (
  `usuarioId` int(11) NOT NULL,
  `rolId` int(11) NOT NULL,
  `departamentoId` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `urlImagen` varchar(150) DEFAULT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedBy` int(2) DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tbl_usuario` (`usuarioId`, `rolId`, `departamentoId`, `nombre`, `username`, `password`, `urlImagen`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 1, 1, 'Admin', 'Admin', 'Admin01', NULL, 1, NULL, NULL, NULL, NULL),
(2, 2, 6, 'Sistemas01', 'Sistemas01', 'Sistemas01', NULL, 1, NULL, NULL, NULL, NULL);
(3, 2, 6, 'Sistemas02', 'Sistemas02', '$2b$08$onRYp16dj6tH89iUmf6tL.Mm9nKLlpOV5EFihHULqVR7rLH2Xh3UW', 'user.webp', 1, NULL, '2023-09-25', NULL, '2023-09-25'),
(4, 1, 6, 'Administrador01', 'Administrador01', '$2b$08$PYvd7Ux/ctAMtnuX/5zbrOWz5DGGrryuWNLu7sf/Re1npeOkxXmvm', 'user.webp', 1, NULL, '2023-09-25', NULL, '2023-09-25');


ALTER TABLE `tbl_administrativo`
  ADD PRIMARY KEY (`administrativoId`),
  ADD UNIQUE KEY `administrativoId_UNIQUE` (`administrativoId`),
  ADD KEY `fk_tbl_administrativo_puestoId` (`puestoId`);

ALTER TABLE `tbl_administrativo_programa`
  ADD PRIMARY KEY (`adminProgramaId`),
  ADD UNIQUE KEY `adminProgramaId_UNIQUE` (`adminProgramaId`),
  ADD KEY `fk_tbl_administrativo_programa_administrativoId` (`administrativoId`),
  ADD KEY `fk_tbl_administrativo_programa_programaId` (`programaId`);

ALTER TABLE `tbl_comunidad`
  ADD PRIMARY KEY (`comunidadId`),
  ADD UNIQUE KEY `comunidadId_UNIQUE` (`comunidadId`),
  ADD KEY `fk_tbl_comunidad_programaId` (`programaId`);

ALTER TABLE `tbl_departamento`
  ADD PRIMARY KEY (`departamentoId`),
  ADD UNIQUE KEY `departamentoId_UNIQUE` (`departamentoId`);

ALTER TABLE `tbl_docente`
  ADD PRIMARY KEY (`docenteId`),
  ADD UNIQUE KEY `docenteId_UNIQUE` (`docenteId`),
  ADD KEY `fk_tbl_docente_programaId` (`programaId`);

ALTER TABLE `tbl_egresado`
  ADD PRIMARY KEY (`egresadoId`),
  ADD UNIQUE KEY `egresadoId_UNIQUE` (`egresadoId`),
  ADD KEY `fk_tbl_egresado_generacionId` (`generacionId`);

ALTER TABLE `tbl_especialidad`
  ADD PRIMARY KEY (`especialidadId`),
  ADD UNIQUE KEY `especialidadId_UNIQUE` (`especialidadId`),
  ADD KEY `fk_tbl_especialidad_programaId` (`programaId`);

ALTER TABLE `tbl_generacion_egresada`
  ADD PRIMARY KEY (`generacionId`),
  ADD UNIQUE KEY `generacionId_UNIQUE` (`generacionId`),
  ADD KEY `fk_tbl_egresado_programaId` (`programaId`);

ALTER TABLE `tbl_linea_investigacion`
  ADD PRIMARY KEY (`lineaInvestigacionId`),
  ADD UNIQUE KEY `lineaInvestigacionId_UNIQUE` (`lineaInvestigacionId`),
  ADD KEY `fk_tbl_linea_investigacion_programaId` (`programaId`);

ALTER TABLE `tbl_materia`
  ADD PRIMARY KEY (`materiaId`),
  ADD UNIQUE KEY `materiaId_UNIQUE` (`materiaId`),
  ADD KEY `fk_tbl_materia_programaId` (`programaId`),
  ADD KEY `fk_tbl_materia_lineaInvestigacionId` (`lineaInvestigacionId`),
  ADD KEY `fk_tbl_materia_especialidadId` (`especialidadId`);

ALTER TABLE `tbl_modulo`
  ADD PRIMARY KEY (`moduloId`),
  ADD UNIQUE KEY `moduloId_UNIQUE` (`moduloId`);

ALTER TABLE `tbl_objeto`
  ADD PRIMARY KEY (`objetoId`),
  ADD UNIQUE KEY `objetoId_UNIQUE` (`objetoId`),
  ADD KEY `fk_tbl_objeto_seccionId` (`seccionId`);

ALTER TABLE `tbl_programa_docente`
  ADD PRIMARY KEY (`programaDocenteId`),
  ADD UNIQUE KEY `programaDocenteId_UNIQUE` (`programaDocenteId`),
  ADD KEY `fk_tbl_programa_docente_programaId` (`programaId`),
  ADD KEY `fk_tbl_programa_docente_docenteId` (`docenteId`);

ALTER TABLE `tbl_programa_estudio`
  ADD PRIMARY KEY (`programaId`),
  ADD UNIQUE KEY `programaId_UNIQUE` (`programaId`),
  ADD KEY `fk_tbl_programa_estudio_departamentoId` (`departamentoId`);

ALTER TABLE `tbl_puesto_administrativo`
  ADD PRIMARY KEY (`puestoId`),
  ADD UNIQUE KEY `puestoId_UNIQUE` (`puestoId`);

ALTER TABLE `tbl_rol`
  ADD PRIMARY KEY (`rolId`),
  ADD UNIQUE KEY `rolId_UNIQUE` (`rolId`);

ALTER TABLE `tbl_seccion`
  ADD PRIMARY KEY (`seccionId`),
  ADD UNIQUE KEY `seccionId_UNIQUE` (`seccionId`),
  ADD KEY `fk_tbl_seccion_moduloId` (`moduloId`),
  ADD KEY `fk_tbl_seccion_programaId` (`programaId`);

ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`usuarioId`),
  ADD UNIQUE KEY `usuarioId_UNIQUE` (`usuarioId`),
  ADD KEY `fk_tbl_usuario_rolId` (`rolId`),
  ADD KEY `fk_tbl_usuario_departamentoId` (`departamentoId`);


ALTER TABLE `tbl_administrativo`
  MODIFY `administrativoId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_administrativo_programa`
  MODIFY `adminProgramaId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_comunidad`
  MODIFY `comunidadId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_departamento`
  MODIFY `departamentoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `tbl_docente`
  MODIFY `docenteId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_egresado`
  MODIFY `egresadoId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_especialidad`
  MODIFY `especialidadId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

ALTER TABLE `tbl_generacion_egresada`
  MODIFY `generacionId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_linea_investigacion`
  MODIFY `lineaInvestigacionId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_materia`
  MODIFY `materiaId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_modulo`
  MODIFY `moduloId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `tbl_objeto`
  MODIFY `objetoId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_programa_docente`
  MODIFY `programaDocenteId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_programa_estudio`
  MODIFY `programaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

ALTER TABLE `tbl_puesto_administrativo`
  MODIFY `puestoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `tbl_rol`
  MODIFY `rolId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `tbl_seccion`
  MODIFY `seccionId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_usuario`
  MODIFY `usuarioId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `tbl_administrativo`
  ADD CONSTRAINT `fk_tbl_administrativo_puestoId` FOREIGN KEY (`puestoId`) REFERENCES `tbl_puesto_administrativo` (`puestoId`);

ALTER TABLE `tbl_administrativo_programa`
  ADD CONSTRAINT `fk_tbl_administrativo_programa_administrativoId` FOREIGN KEY (`administrativoId`) REFERENCES `tbl_administrativo` (`administrativoId`),
  ADD CONSTRAINT `fk_tbl_administrativo_programa_programaId` FOREIGN KEY (`programaId`) REFERENCES `tbl_programa_estudio` (`programaId`);

ALTER TABLE `tbl_comunidad`
  ADD CONSTRAINT `fk_tbl_comunidad_programaId` FOREIGN KEY (`programaId`) REFERENCES `tbl_programa_estudio` (`programaId`);

ALTER TABLE `tbl_docente`
  ADD CONSTRAINT `fk_tbl_docente_programaId` FOREIGN KEY (`programaId`) REFERENCES `tbl_programa_estudio` (`programaId`);

ALTER TABLE `tbl_egresado`
  ADD CONSTRAINT `fk_tbl_egresado_generacionId` FOREIGN KEY (`generacionId`) REFERENCES `tbl_generacion_egresada` (`generacionId`);

ALTER TABLE `tbl_especialidad`
  ADD CONSTRAINT `fk_tbl_especialidad_programaId` FOREIGN KEY (`programaId`) REFERENCES `tbl_programa_estudio` (`programaId`);

ALTER TABLE `tbl_generacion_egresada`
  ADD CONSTRAINT `fk_tbl_egresado_programaId` FOREIGN KEY (`programaId`) REFERENCES `tbl_programa_estudio` (`programaId`);

ALTER TABLE `tbl_linea_investigacion`
  ADD CONSTRAINT `fk_tbl_linea_investigacion_programaId` FOREIGN KEY (`programaId`) REFERENCES `tbl_programa_estudio` (`programaId`);

ALTER TABLE `tbl_materia`
  ADD CONSTRAINT `fk_tbl_materia_especialidadId` FOREIGN KEY (`especialidadId`) REFERENCES `tbl_especialidad` (`especialidadId`),
  ADD CONSTRAINT `fk_tbl_materia_lineaInvestigacionId` FOREIGN KEY (`lineaInvestigacionId`) REFERENCES `tbl_linea_investigacion` (`lineaInvestigacionId`),
  ADD CONSTRAINT `fk_tbl_materia_programaId` FOREIGN KEY (`programaId`) REFERENCES `tbl_programa_estudio` (`programaId`);

ALTER TABLE `tbl_objeto`
  ADD CONSTRAINT `fk_tbl_objeto_seccionId` FOREIGN KEY (`seccionId`) REFERENCES `tbl_seccion` (`seccionId`);

ALTER TABLE `tbl_programa_docente`
  ADD CONSTRAINT `fk_tbl_programa_docente_docenteId` FOREIGN KEY (`docenteId`) REFERENCES `tbl_docente` (`docenteId`),
  ADD CONSTRAINT `fk_tbl_programa_docente_programaId` FOREIGN KEY (`programaId`) REFERENCES `tbl_programa_estudio` (`programaId`);

ALTER TABLE `tbl_programa_estudio`
  ADD CONSTRAINT `fk_tbl_programa_estudio_departamentoId` FOREIGN KEY (`departamentoId`) REFERENCES `tbl_departamento` (`departamentoId`);

ALTER TABLE `tbl_seccion`
  ADD CONSTRAINT `fk_tbl_seccion_moduloId` FOREIGN KEY (`moduloId`) REFERENCES `tbl_modulo` (`moduloId`);

ALTER TABLE `tbl_usuario`
  ADD CONSTRAINT `fk_tbl_usuario_departamentoId` FOREIGN KEY (`departamentoId`) REFERENCES `tbl_departamento` (`departamentoId`),
  ADD CONSTRAINT `fk_tbl_usuario_rolId` FOREIGN KEY (`rolId`) REFERENCES `tbl_rol` (`rolId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
