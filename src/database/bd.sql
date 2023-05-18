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
-- Estructura de tabla para la tabla `tbl_puestoadministrativo`
--

CREATE TABLE `tbl_puestoadministrativo` (
  `puestoId` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePuesto` text NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`puestoId`),
  UNIQUE INDEX `puestoId_UNIQUE` (`puestoId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_administrativo`
--

CREATE TABLE `tbl_administrativo` (
  `administrativoId` int(11) NOT NULL AUTO_INCREMENT,
  `puestoId` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` text NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`administrativoId`),
  UNIQUE INDEX `administrativoId_UNIQUE` (`administrativoId` ASC),
  CONSTRAINT `fk_tbl_administrativo_puestoId` FOREIGN KEY (`puestoId`)
  REFERENCES `dashboardCarreras`.`tbl_puestoAdministrativo`(`puestoId`)
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
-- Estructura de tabla para la tabla `tbl_administrativo_carrera`
--

CREATE TABLE `tbl_administrativo_carrera` (
  `adminCarreraId` int(11) NOT NULL AUTO_INCREMENT,
  `administrativoId` int(11) NOT NULL,
  `carreraId` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`adminCarreraId`),
  UNIQUE INDEX `adminCarreraId_UNIQUE` (`adminCarreraId` ASC),
  CONSTRAINT `fk_tbl_administrativo_carrera_administrativoId` FOREIGN KEY (`administrativoId`)
  REFERENCES `dashboardCarreras`.`tbl_administrativo`(`administrativoId`),
  CONSTRAINT `fk_tbl_administrativo_carrera_carreraId` FOREIGN KEY (`carreraId`)
  REFERENCES `dashboardCarreras`.`tbl_carrera`(`carreraId`)
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
  `carreraId` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`especialidadId`),
  UNIQUE INDEX `especialidadId_UNIQUE` (`especialidadId` ASC),
  CONSTRAINT `fk_tbl_especialidad_carreraId` FOREIGN KEY (`carreraId`)
  REFERENCES `dashboardCarreras`.`tbl_carrera`(`carreraId`)
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
-- Estructura de tabla para la tabla `tbl_carrera_docente`
--

CREATE TABLE `tbl_carrera_docente` (
  `carreraDocenteId` int(11) NOT NULL AUTO_INCREMENT,
  `carreraId` int(11) NOT NULL,
  `docenteId` int(11) NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`carreraDocenteId`),
  UNIQUE INDEX `carreraDocenteId_UNIQUE` (`carreraDocenteId` ASC),
  CONSTRAINT `fk_tbl_carrera_docente_carreraId` FOREIGN KEY (`carreraId`)
  REFERENCES `dashboardCarreras`.`tbl_carrera`(`carreraId`),
  CONSTRAINT `fk_tbl_carrera_docente_docenteId` FOREIGN KEY (`docenteId`)
  REFERENCES `dashboardCarreras`.`tbl_docente`(`docenteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_especialidad_materia`
--

CREATE TABLE `tbl_especialidad_materia` (
  `espDocenteId` int(11) NOT NULL AUTO_INCREMENT,
  `especialidadId` int(11) NOT NULL,
  `materiaId` int(11) NULL,
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`espDocenteId`),
  UNIQUE INDEX `espDocenteId_UNIQUE` (`espDocenteId` ASC),
  CONSTRAINT `fk_tbl_especialidad_materia_especialidadId` FOREIGN KEY (`especialidadId`)
  REFERENCES `dashboardCarreras`.`tbl_especialidad`(`especialidadId`),
  CONSTRAINT `fk_tbl_especialidad_materia_materiaId` FOREIGN KEY (`materiaId`)
  REFERENCES `dashboardCarreras`.`tbl_materia`(`materiaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_seccion`
--

CREATE TABLE `tbl_seccion` (
  `seccionId` int(11) NOT NULL AUTO_INCREMENT,
  `moduloId` int(11) NOT NULL,
  `carreraId` int(11) NOT NULL,
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
  REFERENCES `dashboardCarreras`.`tbl_modulo`(`moduloId`),
  CONSTRAINT `fk_tbl_seccion_carreraId` FOREIGN KEY (`carreraId`)
  REFERENCES `dashboardCarreras`.`tbl_carrera`(`carreraId`)
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
-- Estructura de tabla para la tabla `tbl_tipoObjeto`
--

CREATE TABLE `tbl_tipoObjeto` (
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


--
-- Volcado de datos para la tabla `tbl_rol`
--

INSERT INTO `tbl_rol` (`rolId`, `nombre`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'Administrador', 1, NULL, NULL, NULL, NULL);


--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`usuarioId`, `rolId`, `nombre`, `username`, `password`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 1, 'Admin', 'Admin', 'Admin01', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `tbl_modulo`
--

INSERT INTO `tbl_modulo` (`moduloId`, `nombre`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'Inicio', 1, 1, NULL, NULL, NULL),
(2, 'Perfil de Egreso', 1, 1, NULL, NULL, NULL),
(3, 'Plantilla Docente', 1, 1, NULL, NULL, NULL),
(4, 'Mapa Curricular', 1, 1, NULL, NULL, NULL),
(5, 'Conócenos', 1, 1, NULL, NULL, NULL),
(6, 'Comunidades', 1, 1, NULL, NULL, NULL),
(7, 'Enlaces', 1, 1, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `tbl_departamento`
--

INSERT INTO `tbl_departamento` (`departamentoId`, `nombre`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'Departamento de Ciencias Económico Administrativas', 1, NULL, NULL, NULL, NULL),
(2, 'Departamento de Ingeniería Química-Bioquímica', 1, NULL, NULL, NULL, NULL),
(3, 'Departamento de Ingeniería Metal-Mécanica', 1, NULL, NULL, NULL, NULL),
(4, 'Departamento Industrial', 1, NULL, NULL, NULL, NULL),
(5, 'Departamento de Ingeniería Electrica-Electrónica', 1, NULL, NULL, NULL, NULL),
(6, 'Departamento de Sistemas y Computación', 1, NULL, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `tbl_carrera`
--

INSERT INTO `tbl_carrera` (`carreraId`, `departamentoId`, `nombre`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 1, 'Ingeniería en Gestión Empresarial', 1, NULL, NULL, NULL, NULL),
(2, 1, 'Administración', 1, NULL, NULL, NULL, NULL),
(3, 2, 'Ingeniería Química', 1, NULL, NULL, NULL, NULL),
(4, 2, 'Ingeniería Bioquímica', 1, NULL, NULL, NULL, NULL),
(5, 3, 'Ingeniería Mecanica', 1, NULL, NULL, NULL, NULL),
(6, 3, 'Ingeniería Mecatronica', 1, NULL, NULL, NULL, NULL),
(7, 4, 'Ingeniería Industrial', 1, NULL, NULL, NULL, NULL),
(8, 5, 'Ingeniería en Energías Renovables', 1, NULL, NULL, NULL, NULL),
(9, 5, 'Ingeniería Electrica', 1, NULL, NULL, NULL, NULL),
(10, 5, 'Ingeniería Electronica', 1, NULL, NULL, NULL, NULL),
(11, 6, 'Ingeniería en Sistemas Computacionales', 1, NULL, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `tbl_puestoadministrativo`
--

INSERT INTO `tbl_puestoadministrativo` (`puestoId`, `nombrePuesto`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'Jefe de Departamento', 1, NULL, NULL, NULL, NULL),
(2, 'Jefe de Proyecto de Investigación y Postgrado', 1, NULL, NULL, NULL, NULL),
(3, 'Jefe de Proyecto de Vinculación', 1, NULL, NULL, NULL, NULL),
(4, 'Ingeniería Bioquímica', 1, NULL, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `tbl_docente`
--

INSERT INTO `tbl_docente` (`docenteId`, `carreraId`, `nombre`, `descripcion`, `informacionAcademica`, `materias`, `contacto`, `urlImagen`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 11, 'Abelardo Rodríguez León', 'Desde que fui estudiante (allá por finales de los 90) me gusto impulsar la investigación entre los jóvenes compañeros de ISC. Hoy ya más de 30 años después y con un cúmulo de experiencia aplicada en el desarrollo de proyectos y haber tenido la formación adecuada (maestría y doctorado) me sigue motivando el hecho de enseñarles a creer a los estudiantes del ITV en sus propias capacidades para crear cosas útiles y sorprendentes. Porque de eso se trata todo, no de ser el más popular o el que más sabe, sino de creer que podemos solucionar problemas que ayuden a otros a mejorar su paso por este mundo.', 'Culminé la ISC en 1989, la maestría en Ciencias de la Computación en 1996 y el Doctorado en Ciencias de la Computación en 2007. Desde 1999 he presentado y desarrollado proyectos de investigación financiados por diferentes entidades federales acompañado por otros compañeros profesores y con la participación de alumnos. En 2018 logre mi caro anhelo de ser parte del SNI, logro que ha ayudado a participar también en otras áreas como en la Maestría en Eficiencia Energética y Energías Renovables.', '<ul>\n<li>Programación Orientada a Objetos</li>\n<li>Graficación</li>\n<li>Tópicos Avanzados de Programación</li>\n<li>Seminario 1-2</li>\n<li>Taller de Sistemas de Altas Prestaciones</li>\n<li>Computación Concurrente</li>\n<li>Programación Concurrente</li>\n<li>Concurrencia con videojuegos y GPUs</li>\n</ul>', '<ul> <li>abelardo.rl@veracruz.tecnm.mx</li> <li>2291720662</li> </ul>', 'abelardoRodriguezLeon.webp', 1, NULL, NULL, NULL, NULL),
(2, 11, 'Ana Maria Meléndez López', 'NO PERMITAS QUE TU EXITO SEA OBSTACULIZADO, SE MáS FUERTE QUE CUALQUIER EVENTUALIDAD', 'COORDINADOR DE LA CARRERA DE SISTEMAS\r\nDIPLOMADOS:\r\n* FORMACIÓN DE TUTORES\r\n*COMPETENCIAS DOCENTES\r\n*EN OFIMÁTICA AVANZADA\r\n\r\nACTUALMENTE FORMO PARTE DE LA COMISIÓN DICTAMINADORA DOCENTE', '<ul>\r\n<li>ALGORITMOS Y LENGUAJES DE PROGRAMACIÓN</li>\r\n<li>ALGORITMOS Y PROGRAMACIÓN</li>\r\n<li> PROGRAMACIÓN</li>\r\n<li>ESTRUCTURA DE DATOS</li>\r\n<li>FUNDAMENTOS DE PROGRAMACIÓN</li>\r\n<li>PROGRAMACIÓN ORIENTADA A OBJETOS</li>\r\n<li>TALLER DE INVESTIGACIÓN</li>\r\n</ul>', 'melendez_ana68@hotmail.com', 'user.webp', 1, NULL, NULL, NULL, NULL),
(3, 11, 'Alberto Méndez Torreblanca', 'Profesor de tiempo completo, adscrito al departamento de Sistemas y Computación del TecNM - Instituto Tecnológico de Veracruz. Apasionado de la programación, sus áreas de interés son la tecnología móvil y ciencia de datos.', 'Obtuvo el grado de Doctor en Ciencias en Ciencias Computacionales, en el Instituto Nacional de Astrofísica, Óptica y Electrónica y cuenta con el reconocimiento de perfil deseable por parte de PRODEP. Amplia colaboración con  estudiantes en el desarrollo de aplicaciones móviles, participación como entrenador en los concursos de programación a nivel nacional (Coding Cup y ICPC Gran Premio). Responsable del programa de asesorías de lógica y programación (PALPROG). Co-autor del libro Python desde-1. Un lenguaje fácil, básico y funcional.', '<ul><li>Fundamentos de Programación</li><li>Programación Orientada a Objetos</li></ul>', 'alberto.mt@veracruz.tecnm.mx', 'albertoMendezTorreblanca.webp', 1, NULL, NULL, NULL, NULL),
(4, 11, 'Armando Bravo Bautista', 'Que sigan preparándose para ser mejor profesionistas en las nuevas tecnologías ', 'Maestría en Sistemas \r\n', '<ul>\r\n<li>Simulación</li>\r\n<li>investigación de operaciones</li>\r\n<li>Matemáticas</li>\r\n</ul>\r\n', 'armandobravob1@gmail.com', 'armandoBravoBautista.webp', 1, NULL, NULL, NULL, NULL),
(5, 11, 'Carlos Julián Genis Triana', '', 'Maestría en Ciencias de la Computación cuyo trabajo de tesis permitió hacer la publicación de diversos artículos en relación a algoritmos paralelos para la compresión de vídeo.', '<ul>\r\n<li>Fundamentos de Programación</li>\r\n<li>Matemáticas Discretas</li>\r\n<li>Cómputo Distribuido</li>\r\n<li>Graficación</li>\r\n<li>Entre otras</li>\r\n</ul>', 'carlos gt@verscruz.tecnm.mx', 'carlosJulianGenisTriana.webp', 1, NULL, NULL, NULL, NULL),
(6, 11, 'Carlos Ley Borraz', 'A mis estudiantes y a la comunidad estudiantil en general del Tecnológico Nacional de México (TECNM), me permito ratificar mi compromiso que como docente adquirimos al tener la oportunidad de ser parte del proyecto educativo a nivel nacional, contribuir directamente en los programas educativos institucionales y coadyuvar a logro de sus metas personales y profesionales.<br>\r\nAgradezco infinitamente la confianza y la oportunidad de servir en esta noble actividad mediante la convivencia y dinámicas educativas que actualmente exigen los retos de nuestro país.<br>\r\n<br>\r\nGracias.', ' <ul><li>Diplomado en formación Docente (ITESM)</li>\n      <li>Especialidad en Informática para la administración gerencial (SALLE)</li>\n      <li>Maestría en Ingeniería de Sistemas (ITESM)</li>\n      <li>Maestría en Ciencias Computacionales (Instituto de Ingeniería U.V.)</li></ul>', '<ul>\n<li>Informática</li>\n<li>Gestión de Proyectos</li>\n<li>Cultura Empresarial</li>\n<li>Taller de Investigación</li>\n</ul>', 'carlos.lb@veracruz.tecnm.mx', 'carlosLeyBorraz.webp', 1, NULL, NULL, NULL, NULL),
(7, 11, 'Daniela Hernández Barrios', '“La inteligencia consiste no solo en el conocimiento, sino también en la destreza de aplicarlos en la práctica”. Aristóteles.', '<ul><li>Instructora de cursos de capacitación para el H. Ayuntamiento de Boca del Río en el programa HABITAT (2011)</li>\n<li>Participación como jurado calificador en el concurso Estatal de Prototipos (2016)</li>\n<li>Coordinador de la Segunda Semana Académica de ISC en el ITVer(2013)</li>\n<li>Coordinadora de Tutorías de Sistemas (2014)</li>\n<li>Participación en el comité de acreditación por CACEI (2014)</li>\n<li>Jefa del Laboratorio de Cómputo del ITVer (2013)</li>\n<li>Coordinadora del 8vo. encuentro Regional de Tutorías (2017)</li>\n<li>Coautor del artículo \"El uso de la plataforma MOODLE para la administración de tutorías\"(2017)</li>\n<li>Impartición de la conferencia \"Educación, Cultura y Sociedad\" (2018)</li>\n<li>Presidente de Academia (2021)</li>\n<li>Participación en el comité de acreditación por CIEES (2022)</li>\n<li>Participación en el comité organizador del primer encuentro de Egresadas de ISC</li></ul>', '<ul>\n<li>Fundamentos de Programación</li>\n<li>Sistemas Operativos</li>\n<li>Estructura de Datos</li>\n</ul>', 'daniela.hb@veracruz.tecnm.mx', 'danielaHernandezBarrios.webp', 1, NULL, NULL, NULL, NULL),
(8, 11, 'Delio Coss Camilo', 'La buena administración y gestión siempre te llevará a la excelencia.', 'Impacto de las redes sociales en el rendimiento académico (Articulo Journal).', '<ul>\n<li>Fundamentos de programación</li>\n<li>Programación orientada a objetos</li>\n<li>Fundamentos de base de datos</li>\n<li>Taller de base de datos</li>\n<li>Administración de base de datos</li>\n<li>Programación web, gestores de contenido</li>\n<li>Programación móvil</li>\n<li>Sistemas operativos</li>\n<li>Base de datos distribuidas</li>\n<li>Programación</li>\n<li>Fundamentos de investigación</li>\n</ul>', 'delio.cc@veracruz.tecnm.mx', 'delioCossCamilo.webp', 1, NULL, NULL, NULL, NULL),
(9, 11, 'Efrén Mendoza Chaparro', '\"Quien se atreve enseñar, nunca puede dejar de aprender\", \r\n10 años de experiencia laboral en maquiladora.', 'ING. EN ELECTRÓNICA (ITV), MAESTRÍA EN ADMINISTRACIÓN DE EMPRESAS (UANL) Manejo de Plataformas Educativas. <br>\n<a \nhref=\"https://youtube.com/user/efrenmen\" target=\"_blank\">Canal de YouTube - Efren Mendoza</a>\n', '<ul>\n<li>Fundamentos de Programación</li>\n<li>Programación Básica</li>\n<li>Programación Avanzada</li>\n<li>Programación Lógica y Funcional</li>\n</ul>', 'efren.mc@veracruz.tecnm.mx', 'efrenMendozaChaparro.webp', 1, NULL, NULL, NULL, NULL),
(10, 11, 'Enrique Soto Andrade', '', 'Egresado del Instituto Tecnológico de Veracruz, con el título de Ingeniero en Sistemas Computacionales y con más de 20 años de experiencia en el ámbito de tecnologías de la información.<br>\r\n<br>\r\nLas empresas en las que participe en la implementación de sistemas de información ERP incluyen a CFE, TAMSA y Grupo Contino con los sistemas SAP y Oracle E-Business Suite en los cuales obtuve gran experiencia de la implementación y configuración de la infraestructura de TI.<br>\r\n<br>\r\nEn mi experiencia en la implementación y administración de infraestructura tecnológica colaboré en la empresa Grupo Contino como administrador del centro de datos (Servidores, Almacenamiento, Respaldo y Red)  y encargado del área de soporte técnico implementando mejores prácticas en los procesos internos.<br>\r\n<br>\r\nMe desempeñe como líder del área de Tecnologías de Información a nivel corporativo tanto en la división de infraestructura como en el análisis, diseño, desarrollo e implementación de software para soluciones empresariales de diferentes giros de negocios.', '<ul>\r\n<li>Taller de Base de Datos</li>\r\n<li>Fundamentos de Base de Datos</li>\r\n<li>Lenguajes y Autómatas II</li>\r\n<li>Programación Web</li>\r\n<li>Fundamentos de Telecomunicaciones</li>\r\n<li>Algoritmo y Programación</li>\r\n</ul>', 'enrique.sa@veracruz.tecnm.mx', 'enriqueSotoAndrade.webp', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Esteban Jesús Mendoza y López', 'La educación es el proceso de facilitar el aprendizaje o la adquisición de conocimientos, habilidades, competencias, valores y hábitos que un grupo de personas transfieren a otras personas a través de la enseñanza, la discusión, el ejemplo, la formación y la investigación. ', 'Licenciatura Ingeniería en Sistemas Computacionales.', '<ul>\r\n<li>Fundamentos de Programación</li>\r\n<li>Sistemas Operativos</li>\r\n<li>Informática para la Administración</li>\r\n<li>Programación</li>\r\n</ul>', '<ul><li>esteban.my@veracruz.tecnm.mx</li> <li>ejmelo@yahoo.com</li> </ul>', 'estebanJesusMendozayLopez.webp', 1, NULL, NULL, NULL, NULL),
(12, 11, 'Ezequiel Piña Ortiz', '\"Creo firmemente que todo es cuestión de actitud... no se trata de lo que ocurre, sino como lo afrontas\"', 'Egresado del Tecnológico de Veracruz, Realice dos maestrías, una en Ciencias de la Computación y otra en Admón., Diplomado en Sistemas y Arquitecturas Avanzada en Informática (LANIA), Colaborador en el proyecto Moodle. Evaluador por 3 años de CACEI. Participación en Congresos con ponencias como: Seguimiento de egresados del ITV para la mejora continua, Aplicación efectiva del paradigma de POO usando componentes de programación. Fuentes confiables de información para proyectos de investigación. Certificado por Microsoft como Database Administration Fundamentals y Professional. Trabajado en empresas como BANCOMER, TAMSA, RR & Asociados SC., SIGSA, CENESCO, UV, Administración, Contabilidad y Computación SA de CV y varias más. Impartido y recibido una gran variedad de cursos en temas relacionados con las TICs y Docencia.', '<ul>\r\n<li>Diseño estructurado de algoritmos</li>\r\n<li>Diseño de BD</li>\r\n<li>Taller de BD</li>\r\n<li>Sistemas Operativos</li>\r\n<li>Programación</li>\r\n<li>Análisis y diseño de Sistemas de Información</li>\r\n<li>Informática I y II</li>\r\n<li>Habilidades del Pensamiento</li>\r\n<li>Matemáticas Discretas</li>\r\n<li>Probabilidad y Estadística</li>\r\n<li>Métodos Numéricos</li>\r\n<li>etc.</li>\r\n</ul>', '<ul>\r\n<li>ezequiel.po@veracruz.tecnm.mx</li>\r\n<li>pina.ezequiel@gmail.com</li>\r\n</ul>', 'ezequielPinaOrtiz.webp', 1, NULL, NULL, NULL, NULL),
(13, 11, 'Gabriel Antonio Sánchez Ortiz', 'No sé qué le pasa a la gente: no aprenden comprendiendo; aprenden de alguna otra forma, por la rutina, o de algún otro modo. ¡Que frágil es su conocimiento! R.F.', 'Licenciatura en Ingeniería en Sistemas Computacionales.', '<ul>\r\n<li>Conmutación y Enrutamiento en Redes de Datos</li>\r\n<li>Sistemas Operativos de Red</li>\r\n<li>Algorítmica</li>\r\n<li>Administración de Bases de Datos</li>\r\n<li>Análisis de Algoritmos</li>\r\n<li>Fundamentos de Telecomunicaciones</li>\r\n<li>Fundamentos de Programación</li>\r\n<li>Redes de Computadoras</li>\r\n</ul>', 'gabriel.so@veracruz.tecnm.mx', 'gabrielAntonioSanchezOrtiz.webp', 1, NULL, NULL, NULL, NULL),
(14, 11, 'Genaro Méndez López', 'Egresado de la carrera en Sistemas Computacionales del\r\nInstituto Tecnológico de Veracruz, cuenta con Maestría en Sistemas de la Información\r\npor parte el Instituto Tecnológico Rosenblueth y recientemente con el diploma en \"Blockchain Course\" por el Berkeley Fintech Institute de la Universidad de Berkeley California. <br>\r\n<br>\r\nSe ha desempeñado como catedrático en los últimos 25 años; impartiendo distintas\r\nponencias y asignaturas enfocadas a los Sistemas Computacionales en instituciones\r\ncomo Universidad Cristóbal Colón, Instituto Tecnológico Rosenblueth, Universidad\r\nVeracruzana y el Instituto Tecnológico de Veracruz.', 'Durante su desarrollo profesional ha ejercido en diferentes cargos de los que\r\ndestacan: <br>\r\n<ul>\r\n<li>Gerencia de Desarrollo de Sistemas, RECO (Redes y Consultoría al Comercio\r\nExterior)</li>\r\n<li>Subgerencia de Informática, Administración Portuaria Integral de Veracruz</li>\r\n<li>Coordinación de Proyectos de Automatización, Tenaris Tamsa</li>\r\n<li>Dirección de Sistemas, H. Ayuntamiento de Veracruz,  2004-2007</li>\r\n<li>Dirección de Administración en Grupo CICE</li>\r\n<li>Dirección de Tecnologías de la Información en Grupo CICE</li>\r\n</ul>', 'Tecnologico de México - Campus Veracruz<br>\n      <ul><li>Topicos Avanzados de Programación</li>\n      <li>Graficación por Computadora</li>\n      <li>Transacciones Computacionales con Blockchain</li>\n      <li>Lenguaje Ensamblador</li>\n      <li>Analisis y Diseño Orientado a Objetos</li>\n       <li>Taller de Base de Datos II</li></ul>\n       \n       <br><ul><li>Universidad Cristobal Colón, 2004 - 2006</li>\n       <li>Catedrático en la materia Modelado de Sistemas en la Maestría en Sistemas deInformación y del Diplomado\n        “Proceso Unificado de Desarrollo de Software y Java 2EE” para ICCE.</li>\n        <li>Universidad Veracruzana, Instituto de Ingeniería - 2003</li>\n        <li>Catedrático de la materia Seguridad en Redes en la Maestría de Telecomunicaciones.</li>\n        <li>Instituto Tecnológico Rosenblueth - 2003</li>\n        <li>Catedrático de la materia Administración de Proyectos Informáticos en la Maestría en Sistemas de Información.', 'genaro.ml@veracruz.tecnm.mx', 'genaroMendezLopez.webp', 1, NULL, NULL, NULL, NULL),
(15, 11, 'Hector Pérez Ortiz', '', 'MAESTRO EN REDES Y TELECOMUNICACIONES', 'CÁLCULO INTEGRAL , REDES DE COMPUTADORAS, TECNOLOGIA DE NEGOCIOS', 'hector.po@veracruz.tecnm.mx', 'user.webp', 1, NULL, NULL, NULL, NULL),
(16, 11, 'Jesús Apolinar Martínez San Germán', 'Podemos automatizar lo que esta estandarizado. Para lo cual los sistemas de cómputo se convierten en un activo para la empresa. Cuando apoyan las tomas de decisiones en apoyo su Planeación Estratégica.', 'Diploma en Evaluación de Proyectos de Inversión. Diplomado en Administración Publica. Diplomado en Liderazgo. Diplomada en Alta Dirección.', '<ul>\r\n<li>Estructura de Datos</li>\r\n<li>Inteligencia Artificial</li>\r\n<li>Fundamentos , Taller y Administración de Bases de Datos </li>\r\n<li>Bases de Datos Distribuidas en el modulo de especialidad de Concurrencia Computacional Avanzada</li>\r\n</ul>', 'jesus.ms@veracruz.tecnm.mx', 'jesusApolinarMartinezSanGerman.webp', 1, NULL, NULL, NULL, NULL),
(17, 11, 'Jesus Cruzado Calleja', 'Enfocado a todo proceso relacionado con la tecnología y su aplicación en la solución de problemas de indole empresarial, enfocar la atención y compartirla con los alumnos para el desarrollo de soluciones para la toma de decisiones.', '\"Maestria en Sistemas de Información\r\nMapeo de procesos\"\r\n', '<ul>\r\n<li>Ingeniería de software</li>\r\n<li>Administración de bases de datos</li>\r\n<li>Taller de bases de datos</li>\r\n<li>Auditoría de datos</li>\r\n<li>Fundamentos de bases de datos</li>\r\n<li>Organización computacional</li>\r\n<li>Innovación tecnológica para las empresas</li>\r\n<li>Gestión de proyectos de software</li>\r\n<li>Formulación y evaluación de proyectos de inversión</li>\r\n</ul>\r\n', 'jcruzado@hotmail.com', 'jesusCruzadoCalleja.webp', 1, NULL, NULL, NULL, NULL),
(18, 11, 'Jorge Estudillo Ramírez', 'Pienso que todos las personas tenemos la capacidad mental de aprender en menor o mayor grado dependiendo de la disponibilidad y la actitud, lo cual nos permitirá enfocar nuestras destrezas y habilidades en la búsqueda del conocimiento. Como profesor, mi compromiso es ser guía y acompañante en dicho proceso para el logro de los objetivos planteados en el programa educativo.', 'Estudié la carrera de Ingeniería en Sistemas Computacionales en el Instituto Tecnológico de Tuxtla Gutiérrez. He realizado tres posgrados, dos maestrías y un doctorado. Cursé la Maestría en Redes y Telecomunicaciones en la Universidad Cristóbal Colón, la Maestría en Ciencias en Ciencias Computacionales y Doctorado en Ciencias en Ciencias Computacionales, éstos últimos en el Instituto Nacional de Astrofísica, Óptica y Electrónica.  Actualmente soy profesor de tiempo completo reconocido con perfil deseable por la Secretaría de Educación Pública.', '<ul>\r\n<li>Lenguajes y autómatas I</li>\r\n<li>Tópicos Avanzados de Programación</li>\r\n<li>Programación Avanzada</li>\r\n<li>Programación Orientada a Objetos</li>\r\n<li>Fundamentos de Programación</li>\r\n<li>Programación Lógica y Funcional</li>\r\n<li>Arquitecturas de Desarrollo Web</li>\r\n<li>Sistemas Distribuidos</li>\r\n<li>Programación Móvil</li>\r\n<li>Tecnologías de Desarrollo Ágil</li>\r\n<li>Taller de Investigación I</li>\r\n<li>Taller de Investigación II</li>\r\n<li>Fundamentos de Bases de Datos</li>\r\n<li>Redes de Computadoras</li>\r\n<li>Teleproceso</li>\r\n</ul>', 'jorge.er@veracruz.tecnm.mx', 'jorgeEstudilloRamirez.webp', 1, NULL, NULL, NULL, NULL),
(19, 11, 'José Enrique Torres Montoya ', 'Orgullo ITVer : Bachillerato e Ingeniería en Sistemas Computacionales. Más de 25 años de docencia.', 'Maestría en Tecnología Educativa (Especialidad en Educación a Distancia). Diplomado y seminarista en Educación Ambiental. Artículos varios en ambas temáticas en congresos nacionales  e internacionales.', 'Asignaturas varias en el área de Sistemas. \nProgramación y Desarrollo Sustentable para diferentes planes de estudio.', 'enriquetorresmontoya@gmail.com ', 'joseEnriqueTorresMontoya.webp', 1, NULL, NULL, NULL, NULL),
(20, 11, 'José Gerardo Javier Ortiz Quiroz', 'Desarrolla tu algoritmo para lograr tus objetivos profesionales y personales. existen muchas alternativas, pero siempre hay una mejor. \r\n\"No lo intentes hazlo\": jgjoq.\r\n', 'ingeniero industrial eléctrico con estudios de maestría en sistemas de información, catedrático en el itv desde 1974 y precursor organizador de la carrera de i.s.c. en los institutos tecnológicos. así como ocupado diferentes cargos de jefatura y comisiones académicas.', '<ul>\r\n<li>Cálculo</li>\r\n<li>Electricidad y magnetismo</li>\r\n<li>Ingeniería eléctrica</li>\r\n<li>Lenguajes algorítmicos</li>\r\n<li>Introducción a las ciencias computacionales</li>\r\n<li>Lenguajes de programación: fortran, basic, pascal, dbase, c/c++, java</li>\r\n<li>Estructura de datos i y ii</li>\r\n<li>Administración de archivos</li>\r\n<li>Algoritmos computacionales</li>\r\n<li>Bases de datos</li>\r\n</ul>', 'jose.oq@veracruz.tecnm.mx', 'joseGerardoJavierOrtizQuiroz.webp', 1, NULL, NULL, NULL, NULL),
(21, 11, 'José Hernández Silva', 'Catedrático fundador de la Lic. en Sistemas Computacionales.', 'Licenciatura: Ingeniería Industrial en Electrónica, Posgrado: Maestría en Sistemas de Información y Estudios de Doctorado en Arquitectura y Tecnología de los Sistemas Informáticos.', '<ul>\r\n<li>Redes de Computadoras</li>\r\n<li>Administración de redes</li>\r\n<li>Conmutación y enrutamiento</li>\r\n<li>Lenguajes y Autómatas</li>\r\n<li>Sistemas Operativos</li>\r\n<li>Taller de Sistemas Operativos</li>\r\n<li>Taller de Sistemas Concurrentes I y II</li>\r\n</ul>', 'jose.hs@veracruz.tecnm.mx', 'joseHernandezSilva.webp', 1, NULL, NULL, NULL, NULL),
(22, 11, 'José Ramón Beltrán Guzmán', 'Una mente curiosa no deja de formular preguntas, ni de cuestionarlo absolutamente todo. ¡No dejes de preguntar!', 'Ingeniero en Sistemas Computacionales, Agente en sitio de HP para la aduana de Veracruz, Jefe de Proyecto de Vinculación del ITVer.', '<ul>\r\n<li>Sistemas Operativos</li>\r\n<li>Taller de Sistemas Operativos</li>\r\n</ul>', 'jose.bg@veracruz.tecnm.mx', 'joseRamonBeltranGuzman.webp', 1, NULL, NULL, NULL, NULL),
(23, 11, 'Julia Guadalupe Trujillo Salamanca ', 'Bienvenidos a nuestra Alma Máter, espero sea de su agrado y que los servicios prestados se encuentren al nivel de sus expectativas. ', 'Ingeniería en Sistemas computacionales,  egresada del Instituto Tecnológico de Veracruz. \r\nMaestría en Sistemas de Información egresada de la Universidad Mexicana ', '<ul>\r\n<li>Fundamentos de programación</li>\r\n<li>Lenguajes algoritmicos</li>\r\n<li>Estructura de datos</li>\r\n<li>Lenguajes y autómatas</li>\r\n<li>Sistemas Operativos</li>\r\n<li>Taller de Investigacion II</li>\r\n<li>Administración de Centros de Computo</li>\r\n<li>Cultura Empresarial</li>\r\n</ul>', 'julia.ts@veracruz.tecnm.mx ', 'juliaGuadalupeTrujilloSalamanca.webp', 1, NULL, NULL, NULL, NULL),
(24, 11, 'Karla Gabriela Peralta Madrigal', '\"Cuando uno enseña, dos aprenden\"', 'POSTGRADO EN ADMINISTRACIÓN', '<ul>\r\n<li>Fundamentos de investigación</li>\r\n<li>Fundamentos de programación</li>\r\n<li>Estructura de datos</li>\r\n<li>Programación orientada a objetos</li>\r\n<li>Graficación</li>\r\n<li>Sistemas operativos</li>\r\n<li>Taller de base de datos</li>\r\n<li>Lenguajes y autómatas I</li>\r\n<li>Conmutación y enrutamiento de datos</li>\r\n</ul>', 'karla.pm@veracruz.tecnm.mx', 'karlaGabrielaPeraltaMadrigal.webp', 1, NULL, NULL, NULL, NULL),
(25, 11, 'Leonardo Lezama Hernández', 'Los éxitos profesionales requieren de esfuerzo, dedicación, compromiso y sobre todo de ética profesional para ser valorados y reconocidos.', 'A lo largo de 37 años de experiencia profesional y docente en el campo de la Ingeniería en Sistemas Computacionales, he participado en múltiples actividades tanto en la Industria como en el sector educativo que han contribuido a mi desarrollo profesional y docente.', '<ul>\n<li>Programación</li>\n<li>Estructura de datos</li>\n<li>Simulación</li>\n<li>Bases de datos</li>\n<li>Taller de Investigación</li>\n<li>Sistemas Operativos</li>\n<li>Administración de Redes</li>\n<li>Conmutacion y Enrutamiento de redes de datos</li>\n<li>etc.</li>\n</ul>', 'leonardo.lh@veracruz.tecnm.mx', 'leonardoLezamaHernandez.webp', 1, NULL, NULL, NULL, NULL),
(26, 11, 'Lizbeth Sánchez Ferrer', 'El estudio sin deseo estropea la memoria y no retiene nada de lo que toma (Leonardo da Vinci).<br>\r\n<br>\r\nEn las enseñanzas del budismo tibetano, nos dicen que a lo largo de nuestra vida necesitamos siempre tener un maestro que nos guíe y tener la disposición de aprender de cada uno de nuestros maestros. Dicho maestro será alguien formal o informal. ', 'Egresada de licenciatura del IT de Veracruz de la carrera en Ingeniería en \r\nsistemas computacionales y de la Universidad Cristóbal Colón de la maestría en \r\nredes y telecomunicaciones.<br>\r\n<br>\r\nA lo largo de mis 28 años de servicio he colaborado en:<br>\r\n<ul>\r\n<li>Proyectos de investigación.</li>\r\n<li>Cuerpos académicos.</li>\r\n<li>Publicaciones.</li>\r\n<li>Ponencias.</li>\r\n<li>Instructora de cursos.</li>\r\n<li>Certificaciones.</li>\r\n<li>Diseño curricular a nivel nacional.</li>\r\n<li>Concursos de creatividad, innovación.</li>\r\n<li>Puestos administrativos.</li>\r\n<li>Configuración de redes.</li>\r\n<li>Capacitación a empresas.</li>\r\n<li>Asesor de tesis de licenciatura y maestría.</li>\r\n<li>Estadías profesionales en diversas empresas.</li>\r\n<li>Convenios con el sector privado y de gobierno.</li>\r\n</ul>', '<ul>\r\n<li>Programación</li>\r\n<li>Administración de centros de cómputo</li>\r\n<li>Auditoría de datos</li>\r\n<li>Taller de investigación</li>\r\n<li>Telecomunicaciones</li>\r\n<li>Redes de computadoras</li>\r\n<li>Administración de redes</li>\r\n</ul>', 'lizbeth.sf@veracruz.tecnm.mx', 'lizbethSanchezFerrer.webp', 1, NULL, NULL, NULL, NULL),
(27, 11, 'Marco Alberto Romo Medina', '', '', '<ul>\r\n<li>Programación</li>\r\n<li>Simulación</li>\r\n</ul>', 'marco.rm@veracruz.tecnm.mx', 'user.webp', 1, NULL, NULL, NULL, NULL),
(28, 11, 'Miguel Angel Pérez Cabada', 'La programación mueve al mundo.', 'Maestría en seguridad informática, Participe en concursos de robótica con el robot NAO, actualmente preparando un sistema de realidad virtual para el metaverso', '<ul>\r\n<li>Programación avanzada</li>\r\n<li>Base de datos distribuidas</li>\r<li>Concurrencia con GPUs en videojuegos</li>\n</ul>', 'miguel.pc@veracruz.tecnm.mx', 'miguelAngelPerezCabada.webp', 1, NULL, NULL, NULL, NULL),
(29, 11, 'Noemi Del Carmen Tenorio Prieto', 'Profesor de tiempo completo con 27 años de experiencia docente, en el Tecnológico Nacional de México, campus Instituto Tecnológico Superior de San Andrés Tuxtla, Instituto Tecnológico Cerro Azul e Instituto Tecnológico de Veracruz.', 'Ha impartido asignaturas en las siguientes ingenierías:<br>\r\nIng. en Sistemas Computacionales, Industrial, Bioquímica, Química, Eléctrica, Electrónica, Energías Renovables, Mecatrónica, Mecánica,  y licenciatura en Administración.<br>\r\nProfesor con reconocimiento de Perfil Deseable.<br>\r\nEjerce la tutoría I y II para los alumnos de la carrera de Ingeniería en Sistemas Computacionales.<br>\r\n<br>\r\nFunciones administrativas ejercidas entre otras:<br>\r\n          &emsp;*  Enlace de Sistemas de Gestión del ITVER<br>\r\n          &emsp;*  Coordinadora de posgrado de la DEPI<br>\r\n          &emsp;*  Subcoordinadora de la Zona V de los Centros de Información del SNIT,<br>\r\n          &emsp;*  Instructor  de la Biblioteca Virtual tecnológica<br>\r\n          &emsp;*  Enlace de Conricyt<br>\r\n<br>\r\nEgresada del Instituto Tecnológico de Orizaba como Técnico laboratorista Químico,  Licenciado en Informática y Maestra en Ingeniería Administrativa.<br> \r\n<br>\r\nProfesor con Reconocimiento de Perfil deseable.<br> \r\n<br>\r\nHa realizado los siguientes diplomados:<br>\r\n       	&emsp;*  Microsoft Teams 4ª Emisión: Alternancia de dinámicas de enseñanza y aprendizaje.<br> \r\n        &emsp;   para la educación híbrida y remota (2021)<br>\r\n	&emsp;*  Educación Inclusiva (2020)<br>\r\n        &emsp;*  Recursos educativos en ambientes virtuales de aprendizaje (2017)<br>\r\n	&emsp;*  Formación de tutores (2016)<br>\r\n	&emsp;*  Formación docente en TIC (2014)<br>\r\n        &emsp;*  Formación y desarrollo de competencias docentes (2011)<br>\r\n	&emsp;*  Ingeniería Administrativa (2008)<br>\r\n	&emsp;*  Praxis de la Docencia (2004)<br>\r\n	&emsp;*  Iniciación a la Docencia (2002)<br>\r\n<br>\r\nCuenta con las siguientes certificaciones:<br>\r\nCertificado de competencias laborales en el estándar de competencia (CONOCER):<br>\r\n         &emsp;Impartición de cursos de formación del capital humano de manera presencial grupal<br> \r\n         &emsp;NORMA EC0217<br>\r\n         <br>\r\n         &emsp;Evaluación del aprendizaje con enfoque en competencias profesionales<br>\r\n         &emsp;NORMA EC0772<br>\r\n         <br>\r\n	 &emsp;Desarrollo de cursos en línea<br> \r\n         &emsp;NORMA EC0366<br>\r\n	 <br>\r\nHa publicado los siguientes libros:<br>\r\n         &emsp;Análisis de factibilidad de un CRAI, un nuevo paradigma de gestión del conocimiento<br>\r\n         &emsp;ISBN: 978-3-8417-6308-2<br>\r\n<br>\r\nEs coautora del siguiente libro:<br>\r\n        &emsp;Prospectivas y teorías integrales para ingeniería y administración<br>\r\n        &emsp;ISBN: 978-3-639-60263-0<br>\r\n<br>\r\nHa participado en los siguientes capítulos de libro:<br>\r\n         &emsp;Estudio Técnico.<br>\r\n         &emsp;ISBN: 978-1-4633-8127-1<br>\r\n<br>\r\n         &emsp;El efecto de la corrupción en las estrategias de gestión de las micro y pequeñas \r\n         &emsp;empresas. Casos: Boca del Río y Medellín, Veracruz, México.<br>\r\n         &emsp;ISBN: TOMO II 978-607-736-634-8<br>\r\n<br>\r\n         &emsp;Imagen pública de la micro y pequeña empresa en Veracruz, Veracruz.<br>\r\n         &emsp;ISBN:978-607-98311-6-5<br>\r\n<br>\r\n         &emsp;Innovación e Industria 4.0 en las micro y pequeñas empresas de Veracruz, Veracruz.<br>\r\n         &emsp;ISBN TOMO II: 978-1-4562-8208-0<br>\r\n<br>\r\n         &emsp;Caracterización de la cultura financiera en micro y pequeñas empresas del municipio \r\n         &emsp;de Veracruz del estado de Veracruz de Ignacio de la Llave, México.<br>\r\n         &emsp;ISBN TOMO II: 978-607-15-1602-2, entre otros.<br>\r\n<br>\r\nAsí como varios artículos de publicaciones<br>', '<ul>\r\n<li>Fundamentos de programación</li>\r\n<li>Algoritmos y Lenguajes de Programación</li>\r\n<li>Taller de Informática Administrativa I</li>\r\n<li>Análisis de Sistemas</li>\r\n<li>Introducción a la Ingeniería en Sistemas Computacionales</li>\r\n<li>Informática</li> \r\n<li>Planificación y Modelado</li>\r\n<li>Fundamentos de Desarrollo de Sistemas</li>\r\n<li>Taller de Administración</li>\r\n<li>Fundamentos de Investigación</li>\r\n<li>Taller de Investigación I</li>\r\n<li>Taller de Investigación II</li>\r\n<li>Cultura Empresarial</li>\r\n<li>Administración Estratégica</li>\r\n<li>Desarrollo Sustentable</li>\r\n<li>Taller de Gestión Empresarial</li>\r\n<li>Calidad Aplicada a la Gestión Empresarial</li>\r\n</ul>', 'noemi.tp@veracruz.tecnm.mx', 'noemiDelCarmenTenorioPrieto.webp', 1, NULL, NULL, NULL, NULL),
(30, 11, 'Ofelia Gutiérrez Giraldi', '\"Un profesor trabaja para la eternidad, nadie puede decir dónde acaba su influencia\" Henry Adams.', 'Maestría en Educación, con especialidad en Organización y Administración de la Educación Superior. <br>\r\n<br>\r\nMaestría en Sistemas de Información.', 'En licenciatura: \r\n<ul>\r\n<li>Lenguajes y Autómatas I y II</li>\r\n<li>Ingeniería de Software</li>\r\n<li>Estructura de Datos</li>\r\n<li>Taller de Investigación I y II</li>\r\n<li>Compiladores</li>\r\n<li>Teoría de la Computación</li>\r\n</ul>\r\n\r\nEn Maestría: \r\n<ul>\r\n<li>Teoría de la Computación</li>\r\n<li>Seminario de Investigación</li>\r\n<li>Tópicos de Computación</li>\r\n</ul>', 'ofelia.gg@veracruz.tecnm.mx', 'ofeliaGutierrezGiraldi.webp', 1, NULL, NULL, NULL, NULL),
(31, 11, 'Patricia Horta Rosado', '', 'Licenciatura en Sistemas Computacionales, Maestría en Sistemas de Información.\r\n', '<ul>\r\n<li>Programación</li>\r\n<li>Fundamentos de Programación</li>\r\n<li>Inteligencia Artificial</li>\r\n<li>Fundamentos de Telecomunicaciones</li>\r\n<li>Taller de Investigación I y II</li>\r\n<li>Taller de Sistemas Operativos</li>\r\n</ul>\r\n', 'patricia.hr@veracruz.tecnm.mx', 'patriciaHortaRosado.webp', 1, NULL, NULL, NULL, NULL),
(32, 11, 'Primavera Argüelles Lucho', '', 'Mi formación como Ingeniera en Sistemas Computacionales, Maestría en Ingeniería Aplicada y Doctorado en Materiales y Nanociencia las cuales las terminé en tiempo y forma. He participado en la publicación de 15 artículos de los cuales 4 son de investigación, 5 de congreso internacional, 5 de congreso nacional y 1 de divulgación; publicados en revistas pertenecientes al índice de revistas mexicanas de divulgación científica y tecnológica del CONACYT.  Algunos de mis trabajos están relacionados con el modelado de elementos finitos de sistemas microelectromecánicos, sensores de gas y síntesis química de óxido de titanio. En la siguiente liga se encuentran los trabajos antes mencionados<br><a href=\"https://scholar.google.com/citations?view_op=list_works&hl=es&hl=es&user=3EUcm1YAAAAJ\" target=\"_blank\">Google Scholar - Primavera Argüelles Lucho</a>', '<ul>\r\n<li>Tópicos selectos de programación</li>\r\n<li>Graficación</li>\r\n<li>Lenguajes y Autómatas I</li>\r\n<li>Taller de base de datos</li>\r\n<li>Ingeniería de materiales no metálicos</li>\r\n<li>Tópicos selectos de física</li>\r\n<li>Física y Física general  </li>\r\n</ul>', 'primavera.al@veracruz.tecnm.mx\n', 'primaveraArguellesLucho.webp', 1, NULL, NULL, NULL, NULL),
(33, 11, 'Rafael Córdoba Del Valle', 'Doctor en Sistemas y Ambientes Educativos. Catedrático del Departamento de Sistemas y Computación. \r\nLínea de investigación que desarrolla: Ambientes Virtuales de Aprendizaje. ', 'Publicación de diversos artículos en revistas nacionales. Participación de Congresos Nacionales e Internacionales. \r\nDesarrollo de un proyecto de investigación acerca de la inclusión de aplicaciones multimedia en la enseñanza y \r\naprendizaje para mejorar la comprensión de las fracciones en estudiantes de primaria. Miembro Activo del Consejo de \r\nTransformación Educativa.', '<ul>\r\n<li>Estructura de Datos</li>\r\n<li>Fundamentos de Programación</li>\r\n<li>Sistemas Operativos</li>\r\n<li>Taller de Investigación</li>\r\n<li>Programación</li>\r\n<li>Programación Estructurada</li>\r\n<li>Programación Orientada a Objetos</li>\r\n<li>Algoritmos y Lenguajes de Programación</li>\r\n<li>Tópicos Selectos de Programación</li>\r\n</ul>', 'rafael.cd@veracruz.tecnm.mx', 'rafaelCordobaDelValle.webp', 1, NULL, NULL, NULL, NULL),
(34, 11, 'Rafael Rivera López', 'Haz lo que tengas que hacer dando tu mayor esfuerzo\r\n', '\"Originario de Poza Rica de Hidalgo, Veracruz. Ingeniero en Sistemas Computacionales por el Instituto Tecnológico de Veracruz (1989), Maestro en Ciencias de la Computación por el Instituto Tecnológico y de Estudios Superiores de Monterrey (2000) y Doctor en Ciencias de la Computación por la Universidad Juárez Autónoma de Tabasco (2018).<br>\r\n<br>\r\nFue premiado como uno de los cinco mejores estudiantes de Física en México por la Dirección General de Educación Tecnológica Industrial en 1985, reconocido como estudiante de excelencia por el Tecnológico de Monterrey en el 2000, y con mención honorífica por la defensa de su tesis doctoral. <br>\r\n<br>\r\nActualmente es Profesor Investigador de Tiempo Completo del Departamento de Sistemas y Computación del Instituto Tecnológico de Veracruz.<br>\r\n<br>\r\nImparte cursos a nivel licenciatura en las áreas de programación orientada a objetos e inteligencia artificial.<br>\r\n<br>\r\nDesde 2007, es profesor con perfil deseable reconocido por PRODEP y a partir de 2019 es miembro del Sistema Nacional de Investigadores (SNI) de Conacyt. Además, en 2021 se integró como miembro de la Red Temática Conacyt de Aprendizaje e Inteligencia Computacional Aplicada (REDICA) y como miembro adherente de la Academia Mexicana de la Computación (AMEXCOMP). Desde 2022 forma parte de la Sociedad Mexicana de Ciencia de la Computación (SMCC).<br>\r\n<br>\r\nHa publicado artículos en revistas indexadas por el Journal Citation Report (JCR), y en diversos congresos nacionales y extranjeros. Sus intereses de investigación incluyen el estudio y aplicación de metaheurísticas para resolver problemas complejos y el diseño de modelos orientados a objetos para implementar procedimientos de aprendizaje automático.<br>\r\n<br>\r\n<br><a href=\"https://www.rafaelriveralopez.net\" target=\"_blank\">Sitio web personal</a> <br><a href=\"https://www.researchgate.net/profile/Rafael-Rivera-Lopez\" target=\"_blank\">Cuenta de ResearchGate - Rafael Rivera Lopez</a> <br><a href=\"https://www.webofscience.com/wos/author/record/1097915\" target=\"_blank\">Cuenta de Web of Sciences - Rafael Rivera Lopez</a>', '<ul>\r\n<li>Fundamentos de Programación</li>\r\n<li>Programación</li>\r\n<li>Programación Orientada a Objetos</li> <li>Graficación</li>\r\n<li>Tópicos Avanzados de Programación</li>\r\n<li>Inteligencia Artificial</li>\r\n<li>Redes de Computadoras</li>\r\n<li>Física</li>\r\n<li>Análisis de Sistemas</li>\r\n<ul>', '<ul><li>rafael.rl@veracruz.tecnm.mx</li><li>rafaelriveralopez@gmail.com</li></ul>', 'rafaelRiveraLopez.webp', 1, NULL, NULL, NULL, NULL),
(35, 11, 'Raúl Héctor Trujillo Jimémez', 'El éxito es la suma de pequeños esfuerzos repetidos día a día.', 'Ing. en sistemas computacionales y Master en sistemas de información así como empresario con mas de 30 años en TI \r\nen el sector Financiero. <br>\r\nCon 35 años Catedrático a nivel licenciatura como maestrías en diversas Universidades en el puerto de Veracruz.', '<ul>\r\n<li>Administración de Proyectos</li>\r\n<li>Fundamentos de Programación</li>\r\n<li>Programación</li>\r\n<li>Fundamentos de Bases de Datos</li>\r\n<li>Administración de Base de Datos</li> \r\n<li>Minería de base de datos</li>\r\n<li>Base de datos distribuidas</li>\r\n<li>Redes</li> \r\n<li>Entre Otras</li>\r\n</ul>', 'raul.tj@veracruz.tecnm.mx', 'raulHectorTrujilloJimemez.webp', 1, NULL, NULL, NULL, NULL),
(36, 11, 'Ricardo Rodríguez de la Lanza', 'Lo mas importante es obtener Profesionistas de Calidad Mundial', '28 años de Labor docente', '<ul><li>Bases de Datos</li><li>fundamentos</li><li>Ing de software</li><li>auditoria en informatica</li></ul>', 'ricardo.rd@veracruz.tecnm.mx', 'user.webp', 1, NULL, NULL, NULL, NULL),
(37, 11, 'Senén Juárez Tinoco', 'Trabajar por una superación constante.', 'Ingeniero en Sistemas Computacionales, miembro de la primera generación en la Carrera de ISC en el Instituto Tecnológico de Veracruz. Maestría en Sistemas Computacionales con especialidad en Inteligencia Artificial. Experiencia laboral en el área de Tecnologías de la Información en sectores Comercial y Portuario. Empresario en áreas como Tecnologías de la Información y la Seguridad. Consultor en Factorías de Software.', '<ul>\r\n<li>Programación Orientada a Objetos</li>\r\n<li>Tópicos Avanzados de Programación</li>\r\n<li>Ingeniería de Software</li>\r\n<li>Taller de Investigación I y II</li>\r\n<li>Introducción a las Bases de Datos</li>\r\n<li>Administración de Bases de Datos</li>\r\n</ul>', 'senen.jt@veracruz.tecnm.mx', 'senenJuarezTinoco.webp', 1, NULL, NULL, NULL, NULL),
(38, 11, 'Virginia Osorio Campos', '...', 'Maestría en Administración.', '<ul>\r\n<li>Programación</li> \r\n<li>Programación Estructurada</li>\r\n<li>Programación Básica</li>\r\n<li>Algoritmos y Lenguajes de Programación</li>\r\n<li>Algoritmos y Programación</li> \r\n<li>Lógica de Programación</li>\r\n<li>Tecnologías de la Información</li>\r\n<li>Taller de Informática Administrativa</li>\r\n</ul>', 'virginia.oc@veracruz.tecnm.mx', 'virginiaOsorioCampos.webp', 1, NULL, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `tbl_especialidad`
--

INSERT INTO `tbl_especialidad` (`especialidadId`, `carreraId`, `nombre`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(11, 11, 'Concurrencia Computacional Avanzada', 1, NULL, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `tbl_materia`
--

INSERT INTO `tbl_materia` (`materiaId`, `carreraId`, `especialidadId`, `nombre`, `area`, `semestre`, `competencia`, `urlVideo`, `urlPrograma`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 11, NULL, 'Cálculo Diferencial', 'Calculo', 1, 'Plantea y resuelve problemas utilizando las definiciones de límite y derivada de funciones de una variable para la elaboración de modelos matemáticos aplicados.', 'https://www.youtube.com/embed/hiW2C7_fby0', 'https://bit.ly/3IZILMd', 1, NULL, NULL, NULL, NULL),
(2, 11, NULL, 'Fundamentos de Programación', 'Programacion', 1, 'Aplica algoritmos y lenguajes de programación para diseñar e implementar soluciones a problemáticas del entorno.', 'https://www.youtube.com/embed/5Bngn9X9R7E', 'https://bit.ly/3Ez2gsm', 1, NULL, NULL, NULL, NULL),
(3, 11, NULL, 'Taller de Ética', 'Asignaturas Comunes', 1, 'Desarrolla conciencia sobre el significado y sentido de la Ética para orientar su comportamiento en el contexto social y profesional.', 'https://www.youtube.com/embed/752YL3kRZFA', 'https://bit.ly/3ZjUydd', 1, NULL, NULL, NULL, NULL),
(4, 11, NULL, 'Matemáticas Discretas', 'Automatas', 1, 'Comprende y aplica los conceptos básicos de lógica matemática, relaciones, grafos y árboles para aplicarlos a modelos que resuelvan problemas computacionales.', 'https://www.youtube.com/embed/2-Ss3rDcI54', 'https://bit.ly/41rjmlt', 1, NULL, NULL, NULL, NULL),
(5, 11, NULL, 'Taller de Administración', 'Administracion', 1, 'Comprender y aplicar los procesos en las estructuras y funciones fundamentales de las organizaciones para contribuir sustantivamente con los procesos de planeación.', 'https://www.youtube.com/embed/Jd3e1K-5yvE', 'https://bit.ly/3m6iFhd', 1, NULL, NULL, NULL, NULL),
(6, 11, NULL, 'Fundamentos de Investigación', 'Investigacion', 1, 'Comprender y aplicar los procesos en las estructuras y funciones fundamentales de las organizaciones para contribuir sustantivamente con los procesos de planeación.', 'https://www.youtube.com/embed/-IsQFh4K53I', 'https://bit.ly/3IrZ3f5', 1, NULL, NULL, NULL, NULL),
(7, 11, NULL, 'Cálculo Integral', 'Calculo', 2, 'Aplica la definición de integral y las técnicas de integración para resolver problemas de ingeniería.', 'https://www.youtube.com/embed/c6-LvbpOb44', 'https://bit.ly/3Ik8woM', 1, NULL, NULL, NULL, NULL),
(8, 11, NULL, 'Programación Orientada a Objetos', 'Programacion', 2, 'Aplica la programación orientada a objetos para resolver problemas reales y de ingeniería.', 'https://www.youtube.com/embed/GzKmBCbi-NY', 'https://bit.ly/3SsREkh', 1, NULL, NULL, NULL, NULL),
(9, 11, NULL, 'Contabilidad Financiera', 'Administracion', 2, 'Conoce, analiza e interpreta la información financiera para la toma de decisiones empresariales.', 'https://www.youtube.com/embed/KVIQ9uk-91E', 'https://bit.ly/3Z395dJ', 1, NULL, NULL, NULL, NULL),
(10, 11, NULL, 'Química', 'Asignaturas Comunes', 2, 'Comprende la estructura de la materia y su relación con las propiedades físicas y químicas, así como a las técnicas requeridas para la construcción de equipos o sistemas electrónicos.', 'https://www.youtube.com/embed/Eo4tjAwUwg0', 'https://bit.ly/3Yd7Ojf', 1, NULL, NULL, NULL, NULL),
(11, 11, NULL, 'Álgebra Lineal', 'Matematicas Aplicada', 2, 'Aplica la definición de integral y las técnicas de integración para resolver problemas de ingeniería.', 'https://www.youtube.com/embed/FvMqme1bCZU', 'https://bit.ly/3m0UnoX', 1, NULL, NULL, NULL, NULL),
(12, 11, NULL, 'Probabilidad y Estadística', 'Estadistica', 2, 'Aplica la programación orientada a objetos para resolver problemas reales y de ingeniería.', 'https://www.youtube.com/embed/KFxTo3KaHkI', 'https://bit.ly/3EyyALV', 1, NULL, NULL, NULL, NULL),
(13, 11, NULL, 'Cálculo Vectorial', 'Calculo', 3, 'Aplica los principios y técnicas básicas del cálculo vectorial para resolver problemas de ingeniería del entorno.', 'https://www.youtube.com/embed/yKzPcBxaI68', 'https://bit.ly/41reywK', 1, NULL, NULL, NULL, NULL),
(14, 11, NULL, 'Estructura de datos', 'Programacion', 3, 'Conoce, comprende y aplica eficientemente estructuras de datos, métodos de ordenamiento y búsqueda para la optimización del rendimiento de soluciones a problemas del mundo real.', 'https://www.youtube.com/embed/nfYviQ1V9tc', 'https://bit.ly/3kspauA', 1, NULL, NULL, NULL, NULL),
(15, 11, NULL, 'Cultura empresarial', 'Administracion', 3, 'Construye un plan de negocios para crear una empresa considerando el análisis de mercado, estudio técnico, organización, análisis financiero y estados financieros del proyecto.', 'https://www.youtube.com/embed/0zjRs74FJEE', 'https://bit.ly/3KyODgk', 1, NULL, NULL, NULL, NULL),
(16, 11, NULL, 'Investigación de operaciones', 'Estadistica', 3, 'Formula soluciones óptimas para generar una mejor alternativa para la toma de decisiones aplicando conceptos de los modelos matemáticos, técnicas y algoritmos.', 'https://www.youtube.com/embed/FCJwV7_-8Bs', 'https://bit.ly/3KAlbqu', 1, NULL, NULL, NULL, NULL),
(17, 11, NULL, 'Desarrollo sustentable', 'Asignaturas Comunes', 3, 'Aplica una visión sustentable, en los ámbitos social, económico y ambiental que le permitirá evaluar y disminuir el impacto de la sociedad sobre el entorno, tomando en cuenta estrategias y considerando profesionalmente los valores ambientales.', 'https://www.youtube.com/embed/fiIjV-yrZ30', 'https://bit.ly/3KHtq3M', 1, NULL, NULL, NULL, NULL),
(18, 11, NULL, 'Física general', 'Matematicas Aplicada', 3, 'Comprender los fenómenos físicos en los que intervienen fuerzas, movimiento, trabajo, energía, así como los principios básicos de Óptica y Termodinámica, además comprende y aplica las leyes y principios fundamentales de la electricidad y el magnetismo.', 'https://www.youtube.com/embed/Hoebpkycyoc', 'https://bit.ly/3KvjZEN', 1, NULL, NULL, NULL, NULL),
(19, 11, NULL, 'Ecuaciones diferenciales', 'Calculo', 4, 'Aplica los métodos de solución de ecuaciones diferenciales ordinarias para resolver problemas que involucran sistemas dinámicos que se presentan en la ingeniería.', 'https://www.youtube.com/embed/Ozr2dc_VbCM', 'https://bit.ly/3XWfC8z', 1, NULL, NULL, NULL, NULL),
(20, 11, NULL, 'Métodos numéricos', 'Matematicas Aplicada', 4, 'Aplica los métodos numéricos para resolver problemas científicos y de ingeniería utilizando la computadora.', 'https://www.youtube.com/embed/qrrMK_nJLpU', 'https://bit.ly/3INoZTU', 1, NULL, NULL, NULL, NULL),
(21, 11, NULL, 'Tópicos avanzados de programación', 'Programacion', 4, 'Desarrolla soluciones de software para resolver problemas en diversos contextos utilizando programación concurrente, acceso a datos, que soporten interfaz gráfica de usuario y consideren dispositivos móviles.', 'https://www.youtube.com/embed/xRmR0eklsgM', 'https://bit.ly/3Zg1fNt', 1, NULL, NULL, NULL, NULL),
(22, 11, NULL, 'Fundamentos de bases de datos', 'Bases de datos', 4, 'Analiza requerimientos y diseña bases de datos para generar soluciones al tratamiento de información basándose en modelos y estándares', 'https://www.youtube.com/embed/o5Z-gTleT6Q', 'https://bit.ly/3Iovs6p', 1, NULL, NULL, NULL, NULL),
(23, 11, NULL, 'Simulación', 'Estadistica', 4, 'Analiza, modela, desarrolla y experimenta sistemas productivos y de servicios, reales o hipotéticos, a través de la simulación de eventos discretos, para dar servicio al usuario que necesite tomar decisiones, con el fin de describir con claridad su funcionamiento, aplicando herramientas matemáticas.', 'https://www.youtube.com/embed/AEXGXsRw_UU', 'https://bit.ly/3xPyT12', 1, NULL, NULL, NULL, NULL),
(24, 11, NULL, 'Principios eléctricos y aplicaciones digitales', 'Electronica', 4, 'Comprende y aplica las herramientas básicas de análisis de los sistemas analógicos y digitales para resolver problemas del ámbito computacional.', 'https://www.youtube.com/embed/nAav1fVnghI', 'https://bit.ly/3m4HASh', 1, NULL, NULL, NULL, NULL),
(25, 11, NULL, 'Graficación', 'Programacion', 5, 'Diseña e implementa modelos gráficos para enriquecer visualmente software diverso de aplicación en entornos de programación web, móvil y stand-alone, con base al trazo, manipulación, iluminación, sombreado y animación de objetos bidimensionales y tridimensionales.', 'https://www.youtube.com/embed/PqAFDgqeFmg', 'https://bit.ly/3SsAUcM', 1, NULL, NULL, NULL, NULL),
(26, 11, NULL, 'Fundamentos de telecomunicaciones', 'Redes', 5, 'Analiza los componentes y la funcionalidad de diferentes sistemas de comunicación para evaluar las tecnologías utilizadas actualmente como parte de la solución de un proyecto de conectividad.', 'https://www.youtube.com/embed/47jqjh20iHc', 'https://bit.ly/3ZlYAlD', 1, NULL, NULL, NULL, NULL),
(27, 11, NULL, 'Taller de base de datos', 'Bases de datos', 5, 'Implementa bases de datos para apoyar la toma de decisiones considerando las reglas de negocio', 'https://www.youtube.com/embed/jNybVQ19vg4', 'https://bit.ly/3Ezqlza', 1, NULL, NULL, NULL, NULL),
(28, 11, NULL, 'Sistemas operativos', 'Sistemas operativos', 5, 'Aplica los paradigmas de diseño de los sistemas operativos actuales y emergentes, para el manejo de los recursos del sistema.', 'https://www.youtube.com/embed/xTbDAyYxScc', 'https://bit.ly/3ItSdpk', 1, NULL, NULL, NULL, NULL),
(29, 11, NULL, 'Fundamentos de ingeniería de software', 'Ingenieria', 5, 'Realiza el análisis de un proyecto de software, a partir de la identificación del modelo de negocios de la organización que permita alcanzar estándares y métricas de calidad.', 'https://www.youtube.com/embed/fG6cLyOwfKY', 'https://bit.ly/3m5s34I', 1, NULL, NULL, NULL, NULL),
(30, 11, NULL, 'Arquitectura de computadoras', 'Electronica', 5, 'Conoce diferentes modelos de arquitecturas y recomienda aplicaciones para resolver problemas de su entorno profesional.', 'https://www.youtube.com/embed/eBqiygwTBeE', 'https://bit.ly/3INuXEa', 1, NULL, NULL, NULL, NULL),
(31, 11, NULL, 'Lenguajes y autómatas I', 'Automatas', 6, 'Define, diseña y programa las fases del analizador léxico y sintáctico de un traductor o compilador para preámbulo de la construcción de un compilador.', 'https://www.youtube.com/embed/oXIrClKZY0Q', 'https://bit.ly/41ldf2f', 1, NULL, NULL, NULL, NULL),
(32, 11, NULL, 'Redes de computadoras', 'Redes', 6, 'Diseña y elabora un proyecto de cableado estructurado aplicando normas y estándares vigentes para la solución de problemas de conectividad.', 'https://www.youtube.com/embed/xvj7vT0TQF0', 'https://bit.ly/3IQMQ5d', 1, NULL, NULL, NULL, NULL),
(33, 11, NULL, 'Administración de bases de datos', 'Bases de datos', 6, 'Instala, configura y administra un gestor de base de datos para el manejo de la información de una organización, optimizando la infraestructura computacional existente.', 'https://www.youtube.com/embed/k2VEX6Z848Y', 'https://bit.ly/3EvBn8E', 1, NULL, NULL, NULL, NULL),
(34, 11, NULL, 'Taller de sistemas operativos', 'Sistemas operativos', 6, 'Conoce, identifica, selecciona y administra diferentes sistemas operativos con el fin de resolver problemáticas reales, así como aplicar procedimientos de interoperabilidad entre diferentes sistemas operativos.', 'https://www.youtube.com/embed/JxPitksLr2A', 'https://bit.ly/3IPm8JZ', 1, NULL, NULL, NULL, NULL),
(35, 11, NULL, 'Ingeniería de software', 'Ingenieria', 6, 'Desarrolla soluciones de software, considerando la metodología y herramientas para la elaboración de un proyecto aplicativo en diferentes escenarios.', 'https://www.youtube.com/embed/_M9l0IGoBIw', 'https://bit.ly/41rpVo7', 1, NULL, NULL, NULL, NULL),
(36, 11, NULL, 'Lenguajes de interfaz', 'Electronica', 6, 'Desarrollar software para establecer la interfaz hombre-máquina y máquina-máquina', 'https://www.youtube.com/embed/nuE3ZTfeLdQ', 'https://bit.ly/3YP9Irf', 1, NULL, NULL, NULL, NULL),
(37, 11, NULL, 'Lenguajes y autómatas II', 'Automatas', 7, 'Implementa un compilador para un lenguaje específico considerando las etapas del mismo.', 'https://www.youtube.com/embed/eDISXkRyE-s', 'https://bit.ly/3YVwii7', 1, NULL, NULL, NULL, NULL),
(38, 11, NULL, 'Conmutación y enrutamiento de redes de datos', 'Redes', 7, 'Diseña, instala y configura redes LAN inalámbricas aplicando normas y estándares vigentes para la solución de problemas de conectividad.', 'https://www.youtube.com/embed/jcX-VxJEr2Y', 'https://bit.ly/3knDhkC', 1, NULL, NULL, NULL, NULL),
(39, 11, NULL, 'Taller de investigación I', 'Investigacion', 7, 'Elabora un protocolo de investigación en el que presenta soluciones científico-tecnológicas a problemáticas relacionadas con su campo profesional en diversos contextos.', 'https://www.youtube.com/embed/_KukZLplsEw', 'https://bit.ly/3SsLAYV', 1, NULL, NULL, NULL, NULL),
(40, 11, NULL, 'Gestión de proyectos de software', 'Ingenieria', 7, 'Aplica metodologías e instrumentos, para garantizar la gestión adecuada de un proyecto de software.', 'https://www.youtube.com/embed/_2all7R1U8g', 'https://bit.ly/3YZC6Hb', 1, NULL, NULL, NULL, NULL),
(41, 11, NULL, 'Sistemas programables', 'Electronica', 7, 'Aplica microcontroladores en el diseño de interfaces hombre—máquina y máquina-máquina de sistemas programables.', 'https://www.youtube.com/embed/WNy9kRCJSbI', 'https://bit.ly/3IQdhYD', 1, NULL, NULL, NULL, NULL),
(42, 11, NULL, 'Programación lógica funcional', 'Programacion', 8, 'Conoce los principios lógicos y funcionales de la programación para aplicarlos en la resolución de problemas.', 'https://www.youtube.com/embed/ICHytblexzA', 'https://bit.ly/3IZQjP3', 1, NULL, NULL, NULL, NULL),
(43, 11, NULL, 'Administración de redes', 'Redes', 8, 'Configura y administra servicios de red para el uso eficiente y confiable de la infraestructura tecnológica de la organización.', 'https://www.youtube.com/embed/192nELRGvLA', 'https://bit.ly/3SsmkSO', 1, NULL, NULL, NULL, NULL),
(44, 11, NULL, 'Taller de investigación II', 'Investigacion', 8, 'Consolida el protocolo para ejecutar la investigación y obtener productos para su exposición, defensa y gestión de su transcendencia.', 'https://www.youtube.com/embed/6k98_9L1O7U', 'https://bit.ly/3KzB3JH', 1, NULL, NULL, NULL, NULL),
(45, 11, NULL, 'Programación web', 'Web', 8, 'Desarrolla aplicaciones web dinámicas del lado cliente y del servidor, considerando la conectividad a orígenes de datos, la interconectividad entre aplicaciones y cómputo en la nube.', 'https://www.youtube.com/embed/R-kylURLaQM', 'https://bit.ly/3SnMBle', 1, NULL, NULL, NULL, NULL),
(46, 11, NULL, 'Inteligencia artificial', 'IA', 9, 'Conocer los principios y el desarrollo de la Inteligencia Artificial, identificando sus\r\naplicaciones (robótica, visión computacional, lógica difusa, redes neuronales y\r\nprocesamiento de lenguaje natural) para emplearlas en el diseño e implementación\r\nde sistemas inteligentes que faciliten las tareas del ser humano.', 'https://www.youtube.com/embed/vpCINOjJSdg', 'https://bit.ly/3XWhXRc', 1, NULL, NULL, NULL, NULL),
(47, 11, 11, 'Taller de Sistemas Concurrentes 1', 'Especialidad', 7, 'Capacidad de organización del hardware para obtener un equipo de altas prestaciones acorde con los diferentes requerimientos que tenga el usuario o empresa.', 'https://www.youtube.com/embed/ta9tde8HCBI', 'https://bit.ly/3Exifqw', 1, NULL, NULL, NULL, NULL),
(48, 11, 11, 'Computo Paralelo', 'Especialidad', 7, 'El alumno deberá saber aplicar los conceptos adquiridos en las materias de programación secuencial vistas al inicio de la carrera, para diseñar y desarrollar sistemas concurrentes de alta demanda de recursos.', 'https://www.youtube.com/embed/IVdFIwdBBho', 'https://bit.ly/3xV9JxP', 1, NULL, NULL, NULL, NULL),
(49, 11, 11, 'Taller de Sistemas Concurrentes 2', 'Especialidad', 8, 'Toma de decisión para elegir el mejor software para ambientes virtuales de acuerdo a las necesidades del usuario o empresa.', 'https://www.youtube.com/embed/-lqIKsKpaNQ', 'https://bit.ly/3kmyYGp', 1, NULL, NULL, NULL, NULL),
(50, 11, 11, 'Concurrencia con GPUS en Videojuegos', 'Especialidad', 8, 'Identificar y definir los diferentes elementos (personajes, guion, escenarios, roles) que requiere un videojuego en computadora.', 'https://www.youtube.com/embed/GxoV38SbVHU', 'https://bit.ly/3YYBMbA', 1, NULL, NULL, NULL, NULL),
(51, 11, 11, 'Transacciones Computacionales con Blockchain', 'Especialidad', 9, 'Capacidad de organización del hardware para obtener un equipo de altas prestaciones acorde con los diferentes requerimientos que tenga el usuario o empresa.', 'https://www.youtube.com/embed/qpwDO6ydJAA', 'https://bit.ly/3kpxv21', 1, NULL, NULL, NULL, NULL),
(52, 11, 11, 'Bases de Datos Distribuidas', 'Especialidad', 9, 'Conocer y aplicar la filosofía de manejo de Base de Datos Distribuidas.', 'https://www.youtube.com/embed/eys4i3Bb5_s', 'https://bit.ly/3Yde3nb', 1, NULL, NULL, NULL, NULL);
