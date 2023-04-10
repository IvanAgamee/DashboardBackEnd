CREATE DATABASE IF NOT EXISTS `dashboardCarreras` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dashboardCarreras`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
-- --------------------------------------------------------
--
-- Base de datos: `dashboardCarreras`
--
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rol`
--

CREATE TABLE `tbl_rol` (
  `rolId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`rolId`),
  UNIQUE INDEX `rolId_UNIQUE` (`rolId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `usuarioId` int(11) NOT NULL AUTO_INCREMENT,
  `rolId` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`usuarioId`),
  UNIQUE INDEX `usuarioId_UNIQUE` (`usuarioId` ASC),
  CONSTRAINT `fk_tbl_usuario_rolId` FOREIGN KEY (`rolId`)
  REFERENCES `dashboardCarreras`.`tbl_rol`(`rolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_departamento`
--

CREATE TABLE `tbl_departamento` (
  `departamentoId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`departamentoId`),
  UNIQUE INDEX `departamentoId_UNIQUE` (`departamentoId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rolPermiso`
--

CREATE TABLE `tbl_rolPermiso` (
  `rolPermisoId` int(11) NOT NULL AUTO_INCREMENT,
  `rolId` int(11) NOT NULL,
  `departamentoId` int(11) NOT NULL,
  `add` int(2) NOT NULL,
  `modify` int(2) NOT NULL,
  `delete` int(2) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`rolPermisoId`),
  UNIQUE INDEX `rolPermisoId_UNIQUE` (`rolPermisoId` ASC),
  CONSTRAINT `fk_tbl_rolPermiso_rolId` FOREIGN KEY (`rolId`)
  REFERENCES `dashboardCarreras`.`tbl_rol`(`rolId`),
  CONSTRAINT `fk_tbl_rolPermiso_departamentoId` FOREIGN KEY (`departamentoId`)
  REFERENCES `dashboardCarreras`.`tbl_departamento`(`departamentoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_modulo`
--

CREATE TABLE `tbl_modulo` (
  `moduloId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`moduloId`),
  UNIQUE INDEX `moduloId_UNIQUE` (`moduloId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_carrera`
--

CREATE TABLE `tbl_carrera` (
  `carreraId` int(11) NOT NULL AUTO_INCREMENT,
  `departamentoId` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`carreraId`),
  UNIQUE INDEX `carreraId_UNIQUE` (`carreraId` ASC),
  CONSTRAINT `fk_tbl_carrera_departamentoId` FOREIGN KEY (`departamentoId`)
  REFERENCES `dashboardCarreras`.`tbl_departamento`(`departamentoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_docente`
--

CREATE TABLE `tbl_docente` (
  `docenteId` int(11) NOT NULL AUTO_INCREMENT,
  `carreraId` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `informacionAcademica` text NOT NULL,
  `materias` text NOT NULL,
  `contacto` text NOT NULL,
  `urlImagen` varchar(150) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`docenteId`),
  UNIQUE INDEX `docenteId_UNIQUE` (`docenteId` ASC),
  CONSTRAINT `fk_tbl_docente_carreraId` FOREIGN KEY (`carreraId`)
  REFERENCES `dashboardCarreras`.`tbl_carrera`(`carreraId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_comunidad`
--

CREATE TABLE `tbl_comunidad` (
  `comunidadId` int(11) NOT NULL AUTO_INCREMENT,
  `carreraId` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `logo` varchar(250) NOT NULL,
  `quienesSomos` text NOT NULL,
  `queHacemos` text NOT NULL,
  `fotosComunidad` text NOT NULL,
  PRIMARY KEY (`comunidadId`),
  UNIQUE INDEX `comunidadId_UNIQUE` (`comunidadId` ASC),
  CONSTRAINT `fk_tbl_comunidad_carreraId` FOREIGN KEY (`carreraId`)
  REFERENCES `dashboardCarreras`.`tbl_carrera`(`carreraId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_especialidad`
--

CREATE TABLE `tbl_especialidad` (
  `especialidadId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`especialidadId`),
  UNIQUE INDEX `especialidadId_UNIQUE` (`especialidadId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_materia`
--

CREATE TABLE `tbl_materia` (
  `materiaId` int(11) NOT NULL AUTO_INCREMENT,
  `carreraId` int(11) NOT NULL,
  `especialidadId` int(11) NULL,
  `nombre` varchar(150) NOT NULL,
  `area` varchar(150) NOT NULL,
  `semestre` int(11) NOT NULL,
  `competencia` text NOT NULL,
  `urlVideo` varchar(150) NOT NULL,
  `urlPrograma` varchar(150) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`materiaId`),
  UNIQUE INDEX `materiaId_UNIQUE` (`materiaId` ASC),
  CONSTRAINT `fk_tbl_materia_carreraId` FOREIGN KEY (`carreraId`)
  REFERENCES `dashboardCarreras`.`tbl_carrera`(`carreraId`),
  CONSTRAINT `fk_tbl_materia_especialidadId` FOREIGN KEY (`especialidadId`)
  REFERENCES `dashboardCarreras`.`tbl_especialidad`(`especialidadId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pagina`
--

CREATE TABLE `tbl_pagina` (
  `paginaId` int(11) NOT NULL AUTO_INCREMENT,
  `moduloId` int(11) NOT NULL,
  `carreraId` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`paginaId`),
  UNIQUE INDEX `paginaId_UNIQUE` (`paginaId` ASC),
  CONSTRAINT `fk_tbl_pagina_moduloId` FOREIGN KEY (`moduloId`)
  REFERENCES `dashboardCarreras`.`tbl_modulo`(`moduloId`),
  CONSTRAINT `fk_tbl_pagina_carreraId` FOREIGN KEY (`carreraId`)
  REFERENCES `dashboardCarreras`.`tbl_carrera`(`carreraId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_seccion`
--

CREATE TABLE `tbl_seccion` (
  `seccionId` int(11) NOT NULL AUTO_INCREMENT,
  `moduloId` int(11) NOT NULL,
  `titulo` text NOT NULL,
  `descripcion` text NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`seccionId`),
  UNIQUE INDEX `seccionId_UNIQUE` (`seccionId` ASC),
  CONSTRAINT `fk_tbl_seccion_moduloId` FOREIGN KEY (`moduloId`)
  REFERENCES `dashboardCarreras`.`tbl_modulo`(`moduloId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_objeto`
--

CREATE TABLE `tbl_objeto` (
  `objetoId` int(11) NOT NULL AUTO_INCREMENT,
  `seccionId` int(11) NOT NULL,
  `imagen` text NULL,
  `titulo` text NULL,
  `descripcion` text NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`objetoId`),
  UNIQUE INDEX `objetoId_UNIQUE` (`objetoId` ASC),
  CONSTRAINT `fk_tbl_objeto_seccionId` FOREIGN KEY (`seccionId`)
  REFERENCES `dashboardCarreras`.`tbl_seccion`(`seccionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipoOobjeto`
--

CREATE TABLE `tbl_tipoOobjeto` (
  `tipoObjId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`tipoObjId`),
  UNIQUE INDEX `tipoObjId_UNIQUE` (`tipoObjId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `maestro`
--

INSERT INTO `dashboardCarreras`.`tbl_modulo` 
(`moduloId`, `nombre`, `status`, `createdBy`) VALUES
(1, 'Inicio', 1, 1),
(2, 'Perfil de Egreso', 1, 1),
(3, 'Plantilla Docente', 1, 1),
(4, 'Mapa Curricular', 1, 1),
(5, 'Conócenos', 1, 1),
(6, 'Comunidades', 1, 1),
(7, 'Enlaces', 1, 1);

COMMIT;
