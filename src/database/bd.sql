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
-- Estructura de tabla para la tabla `tbl_puesto_administrativo`
--

CREATE TABLE `tbl_puesto_administrativo` (
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
  REFERENCES `dashboardCarreras`.`tbl_puesto_Administrativo`(`puestoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rol_permiso`
--

CREATE TABLE `tbl_rol_permiso` (
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
  CONSTRAINT `fk_tbl_rol_permiso_rolId` FOREIGN KEY (`rolId`)
  REFERENCES `dashboardCarreras`.`tbl_rol`(`rolId`),
  CONSTRAINT `fk_tbl_rol_permiso_departamentoId` FOREIGN KEY (`departamentoId`)
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
  UNIQUE INDEX `docenteId_UNIQUE` (`docenteId` ASC)
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
  `status` int(2) NOT NULL,
  `createdBy` int(2) NULL,
  `createdAt` DATE NULL,
  `updatedBy` int(2) NULL,
  `updatedAt` DATE NULL,
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
  `posicion` INT(10) NOT NULL 
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
-- Estructura de tabla para la tabla `tbl_tipo_objeto`
--

CREATE TABLE `tbl_tipo_objeto` (
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
(3, 'Departamento de Ingeniería Metal-Mecánica', 1, NULL, NULL, NULL, NULL),
(4, 'Departamento Industrial', 1, NULL, NULL, NULL, NULL),
(5, 'Departamento de Ingeniería Eléctrica-Electrónica', 1, NULL, NULL, NULL, NULL),
(6, 'Departamento de Sistemas y Computación', 1, NULL, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `tbl_carrera`
--

INSERT INTO `tbl_carrera` (`carreraId`, `departamentoId`, `nombre`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 1, 'Ingeniería en Gestión Empresarial', 1, NULL, NULL, NULL, NULL),
(2, 1, 'Administración', 1, NULL, NULL, NULL, NULL),
(3, 2, 'Ingeniería Química', 1, NULL, NULL, NULL, NULL),
(4, 2, 'Ingeniería Bioquímica', 1, NULL, NULL, NULL, NULL),
(5, 3, 'Ingeniería Mecánica', 1, NULL, NULL, NULL, NULL),
(6, 3, 'Ingeniería Mecatrónica', 1, NULL, NULL, NULL, NULL),
(7, 4, 'Ingeniería Industrial', 1, NULL, NULL, NULL, NULL),
(8, 5, 'Ingeniería en Energías Renovables', 1, NULL, NULL, NULL, NULL),
(9, 5, 'Ingeniería Eléctrica', 1, NULL, NULL, NULL, NULL),
(10, 5, 'Ingeniería Electronica', 1, NULL, NULL, NULL, NULL),
(11, 6, 'Ingeniería en Sistemas Computacionales', 1, NULL, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `tbl_puesto_administrativo`
--

INSERT INTO `tbl_puesto_administrativo` (`puestoId`, `nombrePuesto`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'Jefe de Departamento', 1, NULL, NULL, NULL, NULL),
(2, 'Jefe de Proyecto de Investigación y Postgrado', 1, NULL, NULL, NULL, NULL),
(3, 'Jefe de Proyecto de Vinculación', 1, NULL, NULL, NULL, NULL),
(4, 'Coordinador de Carrera', 1, NULL, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `tbl_administrativo_carrera`
--

INSERT INTO `tbl_administrativo_carrera` (`adminCarreraId`, `administrativoId`, `carreraId`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 1, 11, 1, NULL, NULL, NULL, NULL),
(2, 2, 11, 1, NULL, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `tbl_administrativo`
--

INSERT INTO `tbl_administrativo` (`administrativoId`, `puestoId`, `nombre`, `descripcion`, `imagen`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 1, 'Daniela Hernández Barrios', 'Daniela Hernández Barrios, Jefa del departamento de Sistemas y Computación de la carrera Ingeniería en Sistemas Computacionales en el Tecnológico de Veracruz; Ingeniero en Sistemas Computacionales, En el cargo de jefatura del departamento, su función principal, es coordinar la aplicación de programas de estudio relacionados con las áreas de sistemas y computación de las carreras que se imparten en el instituto tecnológico, así mismo el desarrollo de proyectos de investigación y vinculación con el sector productivo, derivados de los programas mencionados, proponiendo objetivos, metas y acciones; verificar que las actividades de las áreas se realicen de acuerdo con las normas, lineamientos y procedimientos establecidos con calidad y espíritu de servicio.', 'img/Docentes/danielaHernandezBarrios.webp', 1, NULL, NULL, NULL, NULL),
(2, 4, 'Berenice Lagunes Padilla', 'Berenice Lagunes Padilla, coordinadora de la carrera ingeniería en Sistemas Computacionales en el Tecnológico de Veracruz; licenciada en Ciencias de la Educación, con maestría en Educación por competencias. En el cargo de coordinación, su función principal, es la orientación académica de los alumnos estudiantes de dicha licenciatura a lo largo de su estancia en la Institución, para un correcto avance y aprovechamiento de su programa de estudios. Así mismo se realizan diferentes funciones en la coordinación, como lo son: consulta y cambio de NIP, realizar la estructura académica con base en las estadísticas de la población inscrita y las necesidades de grupos que así se generen dentro de los periodos semestrales así como de cursos de verano.', 'img/Docentes/bereniceLagunesPadilla.webp', 1, NULL, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `tbl_comunidad`
--

INSERT INTO `tbl_comunidad` (`comunidadId`, `carreraId`, `nombre`, `logo`, `quienesSomos`, `queHacemos`, `fotosComunidad`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 11, 'Comunidad de Ingeniería en Sistemas', 'CIS-logo.webp', 'Somos una comunidad estudiantil que colabora en la formación y capacitación del estudiante para potenciar los conocimientos adquiridos en clase y desarrollar habilidades que actualmente se encuentran en pleno auge en el mundo laboral.\r\n\r\nNuestra misión es brindar conocimiento y actividades en pro de la comunidad estudiantil. Alentando al estudiante a lo largo de su carrera ofreciendo competencias, talleres, ponencias y cursos que mejoren sus habilidades dentro del área de Tecnologías de información.', '<ul>\n    <li>\n        Eventos. Como parte de la comunidad estudiantil colaboramos con el Instituto Tecnológico de Veracruz en la\n        elaboración y realización de eventos con temáticas que involucren tópicos de nuestra área cuyo conocimientos y\n        experiencias pueden ser aprovechada por los estudiantes.\n    </li>\n    <li>\n        Cursos. La comunidad de ingeniería en sistemas busca la forma de apoyar a la búsqueda de permisos, salones y en\n        que condiciones se imparte.\n    </li>\n    <li> Talleres. En el mismo caso que los cursos, los talleres son en su mayoría prácticos, por lo que si buscas \n        impartir algo ligero o un poco aislado de la retícula de la carrera anímate a impartirlo. Mismo caso que el anterior las condiciones, permisos, la comunidad se encarga de administrar todo eso.\n    </li>\n    <li>\n        Desarrollo de software. La comunidad busca potenciar los proyectos de sus miembros y estudiantes en general que\n        busquen destacarse por medio de proyectos en el cual si lo hacen individualmente o como parte de la comunidad\n        todos tendrán sus respectivos créditos.\n    </li>\n</ul>', 'CIS-1.webp,CIS-2.webp', 0, NULL, NULL, NULL, NULL),
(2, 11, 'Club de Programación Competitiva', 'CPC-logo.webp', 'El Club de Programación Competitiva es una comunidad estudiantil enfocada en el desarrollo de habilidades para el análisis y la resolución de problemas computacionales a través del uso del pensamiento lógico-matemático y la implementación de algoritmos y estructuras de datos. El club nace como continuación al antiguo proyecto de la CEPC (Comunidad Estudiantil de Programación Competitiva) para impulsar y ayudar a los alumnos a obtener los conocimientos y las habilidades necesarias para alcanzar una carrera exitosa en la industria del desarrollo de software, a nivel local, nacional e internacional.', 'El club realiza actividades tales como difundir convocatorias relacionadas con pasantías en empresas de tecnología, concursos de programación, conferencias, cursos, talleres o bootcamps externos a la institución; de igual manera, organizar nuestros propios eventos de este tipo; y además llevar a cabo sesiones de entrenamiento y mentorías sobre tópicos especializados de algoritmos y estructuras de datos entre los miembros del club al mismo tiempo que se brinda apoyo y orientación para la resolución de problemas alojados en plataformas de juez en línea.', 'CPC-1.webp,CPC-2.webp', 0, NULL, NULL, NULL, NULL),
(3, 11, 'CODTIWEB', 'CODTIWEB-logo.webp', 'Nuestra misión es unir a una comunidad apasionada por el desarrollo web y\r\nproporcionar un espacio para que aquellos que se encuentren interesados en esta área\r\ny así compartan sus conocimientos, aprendan juntos y avancen en el desarrollo de sus habilidades.\r\n\r\nNuestra visión es crear una comunidad dinámica y colaborativa de desarrolladores web que promueva el\r\naprendizaje, la innovación y el crecimiento profesional, y que tenga como objetivo\r\nimpulsar la creación de sitios web y aplicaciones de alta calidad que satisfagan las\r\nnecesidades y expectativas de los usuarios y clientes en un mundo donde cada vez es\r\nmás común el uso de los medios digitales', 'Nuestros objetivos son:\r\n<ul>\r\n<li>Organizar eventos y talleres para que los interesados en el desarrollo web se reúnan, aprendan juntos y se conecten.</li>\r\n<li>Proporcionar recursos educativos, como tutoriales, artículos y videos, para ayudar a la comunidad estudiantil a mejorar sus habilidades y conocimientos en tecnologías web.</li>\r\n<li>Fomentar la colaboración y el trabajo en equipo entre los miembros de la comunidad a través de proyectos colectivos y desafíos de programación.</li>\r\n<li>Brindar un espacio en el cual puedan compartir sus experiencias, desafíos y éxitos con otros miembros de la comunidad.</li>\r\n<li>Ser un recurso para la comunidad estudiantil contribuyendo a la divulgación del conocimiento y la educación en el campo del desarrollo web.</li>\r\n</ul>', '', 0, NULL, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `tbl_docente`
--

INSERT INTO `tbl_docente` (`docenteId`, `nombre`, `descripcion`, `informacionAcademica`, `materias`, `contacto`, `urlImagen`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'Abelardo Rodríguez León', 'Desde que fui estudiante (allá por finales de los 90) me gusto impulsar la investigación entre los jóvenes compañeros de ISC. Hoy ya más de 30 años después y con un cúmulo de experiencia aplicada en el desarrollo de proyectos y haber tenido la formación adecuada (maestría y doctorado) me sigue motivando el hecho de enseñarles a creer a los estudiantes del ITV en sus propias capacidades para crear cosas útiles y sorprendentes. Porque de eso se trata todo, no de ser el más popular o el que más sabe, sino de creer que podemos solucionar problemas que ayuden a otros a mejorar su paso por este mundo.', 'Culminé la ISC en 1989, la maestría en Ciencias de la Computación en 1996 y el Doctorado en Ciencias de la Computación en 2007. Desde 1999 he presentado y desarrollado proyectos de investigación financiados por diferentes entidades federales acompañado por otros compañeros profesores y con la participación de alumnos. En 2018 logre mi caro anhelo de ser parte del SNI, logro que ha ayudado a participar también en otras áreas como en la Maestría en Eficiencia Energética y Energías Renovables.', '<ul>\n<li>Programación Orientada a Objetos</li>\n<li>Graficación</li>\n<li>Tópicos Avanzados de Programación</li>\n<li>Seminario 1-2</li>\n<li>Taller de Sistemas de Altas Prestaciones</li>\n<li>Computación Concurrente</li>\n<li>Programación Concurrente</li>\n<li>Concurrencia con videojuegos y GPUs</li>\n</ul>', '<ul> <li>abelardo.rl@veracruz.tecnm.mx</li> <li>2291720662</li> </ul>', 'abelardoRodriguezLeon.webp', 1, NULL, NULL, NULL, NULL),
(2, 'Ana Maria Meléndez López', 'NO PERMITAS QUE TU EXITO SEA OBSTACULIZADO, SE MáS FUERTE QUE CUALQUIER EVENTUALIDAD', 'COORDINADOR DE LA CARRERA DE SISTEMAS\r\nDIPLOMADOS:\r\n* FORMACIÓN DE TUTORES\r\n*COMPETENCIAS DOCENTES\r\n*EN OFIMÁTICA AVANZADA\r\n\r\nACTUALMENTE FORMO PARTE DE LA COMISIÓN DICTAMINADORA DOCENTE', '<ul>\r\n<li>ALGORITMOS Y LENGUAJES DE PROGRAMACIÓN</li>\r\n<li>ALGORITMOS Y PROGRAMACIÓN</li>\r\n<li> PROGRAMACIÓN</li>\r\n<li>ESTRUCTURA DE DATOS</li>\r\n<li>FUNDAMENTOS DE PROGRAMACIÓN</li>\r\n<li>PROGRAMACIÓN ORIENTADA A OBJETOS</li>\r\n<li>TALLER DE INVESTIGACIÓN</li>\r\n</ul>', 'melendez_ana68@hotmail.com', 'user.webp', 1, NULL, NULL, NULL, NULL),
(3, 'Alberto Méndez Torreblanca', 'Profesor de tiempo completo, adscrito al departamento de Sistemas y Computación del TecNM - Instituto Tecnológico de Veracruz. Apasionado de la programación, sus áreas de interés son la tecnología móvil y ciencia de datos.', 'Obtuvo el grado de Doctor en Ciencias en Ciencias Computacionales, en el Instituto Nacional de Astrofísica, Óptica y Electrónica y cuenta con el reconocimiento de perfil deseable por parte de PRODEP. Amplia colaboración con  estudiantes en el desarrollo de aplicaciones móviles, participación como entrenador en los concursos de programación a nivel nacional (Coding Cup y ICPC Gran Premio). Responsable del programa de asesorías de lógica y programación (PALPROG). Co-autor del libro Python desde-1. Un lenguaje fácil, básico y funcional.', '<ul><li>Fundamentos de Programación</li><li>Programación Orientada a Objetos</li></ul>', 'alberto.mt@veracruz.tecnm.mx', 'albertoMendezTorreblanca.webp', 1, NULL, NULL, NULL, NULL),
(4, 'Armando Bravo Bautista', 'Que sigan preparándose para ser mejor profesionistas en las nuevas tecnologías ', 'Maestría en Sistemas \r\n', '<ul>\r\n<li>Simulación</li>\r\n<li>investigación de operaciones</li>\r\n<li>Matemáticas</li>\r\n</ul>\r\n', 'armandobravob1@gmail.com', 'armandoBravoBautista.webp', 1, NULL, NULL, NULL, NULL),
(5, 'Carlos Julián Genis Triana', '', 'Maestría en Ciencias de la Computación cuyo trabajo de tesis permitió hacer la publicación de diversos artículos en relación a algoritmos paralelos para la compresión de vídeo.', '<ul>\r\n<li>Fundamentos de Programación</li>\r\n<li>Matemáticas Discretas</li>\r\n<li>Cómputo Distribuido</li>\r\n<li>Graficación</li>\r\n<li>Entre otras</li>\r\n</ul>', 'carlos gt@verscruz.tecnm.mx', 'carlosJulianGenisTriana.webp', 1, NULL, NULL, NULL, NULL),
(6, 'Carlos Ley Borraz', 'A mis estudiantes y a la comunidad estudiantil en general del Tecnológico Nacional de México (TECNM), me permito ratificar mi compromiso que como docente adquirimos al tener la oportunidad de ser parte del proyecto educativo a nivel nacional, contribuir directamente en los programas educativos institucionales y coadyuvar a logro de sus metas personales y profesionales.<br>\r\nAgradezco infinitamente la confianza y la oportunidad de servir en esta noble actividad mediante la convivencia y dinámicas educativas que actualmente exigen los retos de nuestro país.<br>\r\n<br>\r\nGracias.', ' <ul><li>Diplomado en formación Docente (ITESM)</li>\n      <li>Especialidad en Informática para la administración gerencial (SALLE)</li>\n      <li>Maestría en Ingeniería de Sistemas (ITESM)</li>\n      <li>Maestría en Ciencias Computacionales (Instituto de Ingeniería U.V.)</li></ul>', '<ul>\n<li>Informática</li>\n<li>Gestión de Proyectos</li>\n<li>Cultura Empresarial</li>\n<li>Taller de Investigación</li>\n</ul>', 'carlos.lb@veracruz.tecnm.mx', 'carlosLeyBorraz.webp', 1, NULL, NULL, NULL, NULL),
(7, 'Daniela Hernández Barrios', '“La inteligencia consiste no solo en el conocimiento, sino también en la destreza de aplicarlos en la práctica”. Aristóteles.', '<ul><li>Instructora de cursos de capacitación para el H. Ayuntamiento de Boca del Río en el programa HABITAT (2011)</li>\n<li>Participación como jurado calificador en el concurso Estatal de Prototipos (2016)</li>\n<li>Coordinador de la Segunda Semana Académica de ISC en el ITVer(2013)</li>\n<li>Coordinadora de Tutorías de Sistemas (2014)</li>\n<li>Participación en el comité de acreditación por CACEI (2014)</li>\n<li>Jefa del Laboratorio de Cómputo del ITVer (2013)</li>\n<li>Coordinadora del 8vo. encuentro Regional de Tutorías (2017)</li>\n<li>Coautor del artículo \"El uso de la plataforma MOODLE para la administración de tutorías\"(2017)</li>\n<li>Impartición de la conferencia \"Educación, Cultura y Sociedad\" (2018)</li>\n<li>Presidente de Academia (2021)</li>\n<li>Participación en el comité de acreditación por CIEES (2022)</li>\n<li>Participación en el comité organizador del primer encuentro de Egresadas de ISC</li></ul>', '<ul>\n<li>Fundamentos de Programación</li>\n<li>Sistemas Operativos</li>\n<li>Estructura de Datos</li>\n</ul>', 'daniela.hb@veracruz.tecnm.mx', 'danielaHernandezBarrios.webp', 1, NULL, NULL, NULL, NULL),
(8, 'Delio Coss Camilo', 'La buena administración y gestión siempre te llevará a la excelencia.', 'Impacto de las redes sociales en el rendimiento académico (Articulo Journal).', '<ul>\n<li>Fundamentos de programación</li>\n<li>Programación orientada a objetos</li>\n<li>Fundamentos de base de datos</li>\n<li>Taller de base de datos</li>\n<li>Administración de base de datos</li>\n<li>Programación web, gestores de contenido</li>\n<li>Programación móvil</li>\n<li>Sistemas operativos</li>\n<li>Base de datos distribuidas</li>\n<li>Programación</li>\n<li>Fundamentos de investigación</li>\n</ul>', 'delio.cc@veracruz.tecnm.mx', 'delioCossCamilo.webp', 1, NULL, NULL, NULL, NULL),
(9, 'Efrén Mendoza Chaparro', '\"Quien se atreve enseñar, nunca puede dejar de aprender\", \r\n10 años de experiencia laboral en maquiladora.', 'ING. EN ELECTRÓNICA (ITV), MAESTRÍA EN ADMINISTRACIÓN DE EMPRESAS (UANL) Manejo de Plataformas Educativas. <br>\n<a \nhref=\"https://youtube.com/user/efrenmen\" target=\"_blank\">Canal de YouTube - Efren Mendoza</a>\n', '<ul>\n<li>Fundamentos de Programación</li>\n<li>Programación Básica</li>\n<li>Programación Avanzada</li>\n<li>Programación Lógica y Funcional</li>\n</ul>', 'efren.mc@veracruz.tecnm.mx', 'efrenMendozaChaparro.webp', 1, NULL, NULL, NULL, NULL),
(10, 'Enrique Soto Andrade', '', 'Egresado del Instituto Tecnológico de Veracruz, con el título de Ingeniero en Sistemas Computacionales y con más de 20 años de experiencia en el ámbito de tecnologías de la información.<br>\r\n<br>\r\nLas empresas en las que participe en la implementación de sistemas de información ERP incluyen a CFE, TAMSA y Grupo Contino con los sistemas SAP y Oracle E-Business Suite en los cuales obtuve gran experiencia de la implementación y configuración de la infraestructura de TI.<br>\r\n<br>\r\nEn mi experiencia en la implementación y administración de infraestructura tecnológica colaboré en la empresa Grupo Contino como administrador del centro de datos (Servidores, Almacenamiento, Respaldo y Red)  y encargado del área de soporte técnico implementando mejores prácticas en los procesos internos.<br>\r\n<br>\r\nMe desempeñe como líder del área de Tecnologías de Información a nivel corporativo tanto en la división de infraestructura como en el análisis, diseño, desarrollo e implementación de software para soluciones empresariales de diferentes giros de negocios.', '<ul>\r\n<li>Taller de Base de Datos</li>\r\n<li>Fundamentos de Base de Datos</li>\r\n<li>Lenguajes y Autómatas II</li>\r\n<li>Programación Web</li>\r\n<li>Fundamentos de Telecomunicaciones</li>\r\n<li>Algoritmo y Programación</li>\r\n</ul>', 'enrique.sa@veracruz.tecnm.mx', 'enriqueSotoAndrade.webp', 1, NULL, NULL, NULL, NULL),
(11, 'Esteban Jesús Mendoza y López', 'La educación es el proceso de facilitar el aprendizaje o la adquisición de conocimientos, habilidades, competencias, valores y hábitos que un grupo de personas transfieren a otras personas a través de la enseñanza, la discusión, el ejemplo, la formación y la investigación. ', 'Licenciatura Ingeniería en Sistemas Computacionales.', '<ul>\r\n<li>Fundamentos de Programación</li>\r\n<li>Sistemas Operativos</li>\r\n<li>Informática para la Administración</li>\r\n<li>Programación</li>\r\n</ul>', '<ul><li>esteban.my@veracruz.tecnm.mx</li> <li>ejmelo@yahoo.com</li> </ul>', 'estebanJesusMendozayLopez.webp', 1, NULL, NULL, NULL, NULL),
(12, 'Ezequiel Piña Ortiz', '\"Creo firmemente que todo es cuestión de actitud... no se trata de lo que ocurre, sino como lo afrontas\"', 'Egresado del Tecnológico de Veracruz, Realice dos maestrías, una en Ciencias de la Computación y otra en Admón., Diplomado en Sistemas y Arquitecturas Avanzada en Informática (LANIA), Colaborador en el proyecto Moodle. Evaluador por 3 años de CACEI. Participación en Congresos con ponencias como: Seguimiento de egresados del ITV para la mejora continua, Aplicación efectiva del paradigma de POO usando componentes de programación. Fuentes confiables de información para proyectos de investigación. Certificado por Microsoft como Database Administration Fundamentals y Professional. Trabajado en empresas como BANCOMER, TAMSA, RR & Asociados SC., SIGSA, CENESCO, UV, Administración, Contabilidad y Computación SA de CV y varias más. Impartido y recibido una gran variedad de cursos en temas relacionados con las TICs y Docencia.', '<ul>\r\n<li>Diseño estructurado de algoritmos</li>\r\n<li>Diseño de BD</li>\r\n<li>Taller de BD</li>\r\n<li>Sistemas Operativos</li>\r\n<li>Programación</li>\r\n<li>Análisis y diseño de Sistemas de Información</li>\r\n<li>Informática I y II</li>\r\n<li>Habilidades del Pensamiento</li>\r\n<li>Matemáticas Discretas</li>\r\n<li>Probabilidad y Estadística</li>\r\n<li>Métodos Numéricos</li>\r\n<li>etc.</li>\r\n</ul>', '<ul>\r\n<li>ezequiel.po@veracruz.tecnm.mx</li>\r\n<li>pina.ezequiel@gmail.com</li>\r\n</ul>', 'ezequielPinaOrtiz.webp', 1, NULL, NULL, NULL, NULL),
(13, 'Gabriel Antonio Sánchez Ortiz', 'No sé qué le pasa a la gente: no aprenden comprendiendo; aprenden de alguna otra forma, por la rutina, o de algún otro modo. ¡Que frágil es su conocimiento! R.F.', 'Licenciatura en Ingeniería en Sistemas Computacionales.', '<ul>\r\n<li>Conmutación y Enrutamiento en Redes de Datos</li>\r\n<li>Sistemas Operativos de Red</li>\r\n<li>Algorítmica</li>\r\n<li>Administración de Bases de Datos</li>\r\n<li>Análisis de Algoritmos</li>\r\n<li>Fundamentos de Telecomunicaciones</li>\r\n<li>Fundamentos de Programación</li>\r\n<li>Redes de Computadoras</li>\r\n</ul>', 'gabriel.so@veracruz.tecnm.mx', 'gabrielAntonioSanchezOrtiz.webp', 1, NULL, NULL, NULL, NULL),
(14, 'Genaro Méndez López', 'Egresado de la carrera en Sistemas Computacionales del\r\nInstituto Tecnológico de Veracruz, cuenta con Maestría en Sistemas de la Información\r\npor parte el Instituto Tecnológico Rosenblueth y recientemente con el diploma en \"Blockchain Course\" por el Berkeley Fintech Institute de la Universidad de Berkeley California. <br>\r\n<br>\r\nSe ha desempeñado como catedrático en los últimos 25 años; impartiendo distintas\r\nponencias y asignaturas enfocadas a los Sistemas Computacionales en instituciones\r\ncomo Universidad Cristóbal Colón, Instituto Tecnológico Rosenblueth, Universidad\r\nVeracruzana y el Instituto Tecnológico de Veracruz.', 'Durante su desarrollo profesional ha ejercido en diferentes cargos de los que\r\ndestacan: <br>\r\n<ul>\r\n<li>Gerencia de Desarrollo de Sistemas, RECO (Redes y Consultoría al Comercio\r\nExterior)</li>\r\n<li>Subgerencia de Informática, Administración Portuaria Integral de Veracruz</li>\r\n<li>Coordinación de Proyectos de Automatización, Tenaris Tamsa</li>\r\n<li>Dirección de Sistemas, H. Ayuntamiento de Veracruz,  2004-2007</li>\r\n<li>Dirección de Administración en Grupo CICE</li>\r\n<li>Dirección de Tecnologías de la Información en Grupo CICE</li>\r\n</ul>', 'Tecnologico de México - Campus Veracruz<br>\n      <ul><li>Topicos Avanzados de Programación</li>\n      <li>Graficación por Computadora</li>\n      <li>Transacciones Computacionales con Blockchain</li>\n      <li>Lenguaje Ensamblador</li>\n      <li>Analisis y Diseño Orientado a Objetos</li>\n       <li>Taller de Base de Datos II</li></ul>\n       \n       <br><ul><li>Universidad Cristobal Colón, 2004 - 2006</li>\n       <li>Catedrático en la materia Modelado de Sistemas en la Maestría en Sistemas deInformación y del Diplomado\n        “Proceso Unificado de Desarrollo de Software y Java 2EE” para ICCE.</li>\n        <li>Universidad Veracruzana, Instituto de Ingeniería - 2003</li>\n        <li>Catedrático de la materia Seguridad en Redes en la Maestría de Telecomunicaciones.</li>\n        <li>Instituto Tecnológico Rosenblueth - 2003</li>\n        <li>Catedrático de la materia Administración de Proyectos Informáticos en la Maestría en Sistemas de Información.', 'genaro.ml@veracruz.tecnm.mx', 'genaroMendezLopez.webp', 1, NULL, NULL, NULL, NULL),
(15, 'Hector Pérez Ortiz', '', 'MAESTRO EN REDES Y TELECOMUNICACIONES', 'CÁLCULO INTEGRAL , REDES DE COMPUTADORAS, TECNOLOGIA DE NEGOCIOS', 'hector.po@veracruz.tecnm.mx', 'user.webp', 1, NULL, NULL, NULL, NULL),
(16, 'Jesús Apolinar Martínez San Germán', 'Podemos automatizar lo que esta estandarizado. Para lo cual los sistemas de cómputo se convierten en un activo para la empresa. Cuando apoyan las tomas de decisiones en apoyo su Planeación Estratégica.', 'Diploma en Evaluación de Proyectos de Inversión. Diplomado en Administración Publica. Diplomado en Liderazgo. Diplomada en Alta Dirección.', '<ul>\r\n<li>Estructura de Datos</li>\r\n<li>Inteligencia Artificial</li>\r\n<li>Fundamentos , Taller y Administración de Bases de Datos </li>\r\n<li>Bases de Datos Distribuidas en el modulo de especialidad de Concurrencia Computacional Avanzada</li>\r\n</ul>', 'jesus.ms@veracruz.tecnm.mx', 'jesusApolinarMartinezSanGerman.webp', 1, NULL, NULL, NULL, NULL),
(17, 'Jesus Cruzado Calleja', 'Enfocado a todo proceso relacionado con la tecnología y su aplicación en la solución de problemas de indole empresarial, enfocar la atención y compartirla con los alumnos para el desarrollo de soluciones para la toma de decisiones.', '\"Maestria en Sistemas de Información\r\nMapeo de procesos\"\r\n', '<ul>\r\n<li>Ingeniería de software</li>\r\n<li>Administración de bases de datos</li>\r\n<li>Taller de bases de datos</li>\r\n<li>Auditoría de datos</li>\r\n<li>Fundamentos de bases de datos</li>\r\n<li>Organización computacional</li>\r\n<li>Innovación tecnológica para las empresas</li>\r\n<li>Gestión de proyectos de software</li>\r\n<li>Formulación y evaluación de proyectos de inversión</li>\r\n</ul>\r\n', 'jcruzado@hotmail.com', 'jesusCruzadoCalleja.webp', 1, NULL, NULL, NULL, NULL),
(18, 'Jorge Estudillo Ramírez', 'Pienso que todos las personas tenemos la capacidad mental de aprender en menor o mayor grado dependiendo de la disponibilidad y la actitud, lo cual nos permitirá enfocar nuestras destrezas y habilidades en la búsqueda del conocimiento. Como profesor, mi compromiso es ser guía y acompañante en dicho proceso para el logro de los objetivos planteados en el programa educativo.', 'Estudié la carrera de Ingeniería en Sistemas Computacionales en el Instituto Tecnológico de Tuxtla Gutiérrez. He realizado tres posgrados, dos maestrías y un doctorado. Cursé la Maestría en Redes y Telecomunicaciones en la Universidad Cristóbal Colón, la Maestría en Ciencias en Ciencias Computacionales y Doctorado en Ciencias en Ciencias Computacionales, éstos últimos en el Instituto Nacional de Astrofísica, Óptica y Electrónica.  Actualmente soy profesor de tiempo completo reconocido con perfil deseable por la Secretaría de Educación Pública.', '<ul>\r\n<li>Lenguajes y autómatas I</li>\r\n<li>Tópicos Avanzados de Programación</li>\r\n<li>Programación Avanzada</li>\r\n<li>Programación Orientada a Objetos</li>\r\n<li>Fundamentos de Programación</li>\r\n<li>Programación Lógica y Funcional</li>\r\n<li>Arquitecturas de Desarrollo Web</li>\r\n<li>Sistemas Distribuidos</li>\r\n<li>Programación Móvil</li>\r\n<li>Tecnologías de Desarrollo Ágil</li>\r\n<li>Taller de Investigación I</li>\r\n<li>Taller de Investigación II</li>\r\n<li>Fundamentos de Bases de Datos</li>\r\n<li>Redes de Computadoras</li>\r\n<li>Teleproceso</li>\r\n</ul>', 'jorge.er@veracruz.tecnm.mx', 'jorgeEstudilloRamirez.webp', 1, NULL, NULL, NULL, NULL),
(19, 'José Enrique Torres Montoya ', 'Orgullo ITVer : Bachillerato e Ingeniería en Sistemas Computacionales. Más de 25 años de docencia.', 'Maestría en Tecnología Educativa (Especialidad en Educación a Distancia). Diplomado y seminarista en Educación Ambiental. Artículos varios en ambas temáticas en congresos nacionales  e internacionales.', 'Asignaturas varias en el área de Sistemas. \nProgramación y Desarrollo Sustentable para diferentes planes de estudio.', 'enriquetorresmontoya@gmail.com ', 'joseEnriqueTorresMontoya.webp', 1, NULL, NULL, NULL, NULL),
(20, 'José Gerardo Javier Ortiz Quiroz', 'Desarrolla tu algoritmo para lograr tus objetivos profesionales y personales. existen muchas alternativas, pero siempre hay una mejor. \r\n\"No lo intentes hazlo\": jgjoq.\r\n', 'ingeniero industrial eléctrico con estudios de maestría en sistemas de información, catedrático en el itv desde 1974 y precursor organizador de la carrera de i.s.c. en los institutos tecnológicos. así como ocupado diferentes cargos de jefatura y comisiones académicas.', '<ul>\r\n<li>Cálculo</li>\r\n<li>Electricidad y magnetismo</li>\r\n<li>Ingeniería eléctrica</li>\r\n<li>Lenguajes algorítmicos</li>\r\n<li>Introducción a las ciencias computacionales</li>\r\n<li>Lenguajes de programación: fortran, basic, pascal, dbase, c/c++, java</li>\r\n<li>Estructura de datos i y ii</li>\r\n<li>Administración de archivos</li>\r\n<li>Algoritmos computacionales</li>\r\n<li>Bases de datos</li>\r\n</ul>', 'jose.oq@veracruz.tecnm.mx', 'joseGerardoJavierOrtizQuiroz.webp', 1, NULL, NULL, NULL, NULL),
(21, 'José Hernández Silva', 'Catedrático fundador de la Lic. en Sistemas Computacionales.', 'Licenciatura: Ingeniería Industrial en Electrónica, Posgrado: Maestría en Sistemas de Información y Estudios de Doctorado en Arquitectura y Tecnología de los Sistemas Informáticos.', '<ul>\r\n<li>Redes de Computadoras</li>\r\n<li>Administración de redes</li>\r\n<li>Conmutación y enrutamiento</li>\r\n<li>Lenguajes y Autómatas</li>\r\n<li>Sistemas Operativos</li>\r\n<li>Taller de Sistemas Operativos</li>\r\n<li>Taller de Sistemas Concurrentes I y II</li>\r\n</ul>', 'jose.hs@veracruz.tecnm.mx', 'joseHernandezSilva.webp', 1, NULL, NULL, NULL, NULL),
(22, 'José Ramón Beltrán Guzmán', 'Una mente curiosa no deja de formular preguntas, ni de cuestionarlo absolutamente todo. ¡No dejes de preguntar!', 'Ingeniero en Sistemas Computacionales, Agente en sitio de HP para la aduana de Veracruz, Jefe de Proyecto de Vinculación del ITVer.', '<ul>\r\n<li>Sistemas Operativos</li>\r\n<li>Taller de Sistemas Operativos</li>\r\n</ul>', 'jose.bg@veracruz.tecnm.mx', 'joseRamonBeltranGuzman.webp', 1, NULL, NULL, NULL, NULL),
(23, 'Julia Guadalupe Trujillo Salamanca ', 'Bienvenidos a nuestra Alma Máter, espero sea de su agrado y que los servicios prestados se encuentren al nivel de sus expectativas. ', 'Ingeniería en Sistemas computacionales,  egresada del Instituto Tecnológico de Veracruz. \r\nMaestría en Sistemas de Información egresada de la Universidad Mexicana ', '<ul>\r\n<li>Fundamentos de programación</li>\r\n<li>Lenguajes algoritmicos</li>\r\n<li>Estructura de datos</li>\r\n<li>Lenguajes y autómatas</li>\r\n<li>Sistemas Operativos</li>\r\n<li>Taller de Investigacion II</li>\r\n<li>Administración de Centros de Computo</li>\r\n<li>Cultura Empresarial</li>\r\n</ul>', 'julia.ts@veracruz.tecnm.mx ', 'juliaGuadalupeTrujilloSalamanca.webp', 1, NULL, NULL, NULL, NULL),
(24, 'Karla Gabriela Peralta Madrigal', '\"Cuando uno enseña, dos aprenden\"', 'POSTGRADO EN ADMINISTRACIÓN', '<ul>\r\n<li>Fundamentos de investigación</li>\r\n<li>Fundamentos de programación</li>\r\n<li>Estructura de datos</li>\r\n<li>Programación orientada a objetos</li>\r\n<li>Graficación</li>\r\n<li>Sistemas operativos</li>\r\n<li>Taller de base de datos</li>\r\n<li>Lenguajes y autómatas I</li>\r\n<li>Conmutación y enrutamiento de datos</li>\r\n</ul>', 'karla.pm@veracruz.tecnm.mx', 'karlaGabrielaPeraltaMadrigal.webp', 1, NULL, NULL, NULL, NULL),
(25, 'Leonardo Lezama Hernández', 'Los éxitos profesionales requieren de esfuerzo, dedicación, compromiso y sobre todo de ética profesional para ser valorados y reconocidos.', 'A lo largo de 37 años de experiencia profesional y docente en el campo de la Ingeniería en Sistemas Computacionales, he participado en múltiples actividades tanto en la Industria como en el sector educativo que han contribuido a mi desarrollo profesional y docente.', '<ul>\n<li>Programación</li>\n<li>Estructura de datos</li>\n<li>Simulación</li>\n<li>Bases de datos</li>\n<li>Taller de Investigación</li>\n<li>Sistemas Operativos</li>\n<li>Administración de Redes</li>\n<li>Conmutacion y Enrutamiento de redes de datos</li>\n<li>etc.</li>\n</ul>', 'leonardo.lh@veracruz.tecnm.mx', 'leonardoLezamaHernandez.webp', 1, NULL, NULL, NULL, NULL),
(26, 'Lizbeth Sánchez Ferrer', 'El estudio sin deseo estropea la memoria y no retiene nada de lo que toma (Leonardo da Vinci).<br>\r\n<br>\r\nEn las enseñanzas del budismo tibetano, nos dicen que a lo largo de nuestra vida necesitamos siempre tener un maestro que nos guíe y tener la disposición de aprender de cada uno de nuestros maestros. Dicho maestro será alguien formal o informal. ', 'Egresada de licenciatura del IT de Veracruz de la carrera en Ingeniería en \r\nsistemas computacionales y de la Universidad Cristóbal Colón de la maestría en \r\nredes y telecomunicaciones.<br>\r\n<br>\r\nA lo largo de mis 28 años de servicio he colaborado en:<br>\r\n<ul>\r\n<li>Proyectos de investigación.</li>\r\n<li>Cuerpos académicos.</li>\r\n<li>Publicaciones.</li>\r\n<li>Ponencias.</li>\r\n<li>Instructora de cursos.</li>\r\n<li>Certificaciones.</li>\r\n<li>Diseño curricular a nivel nacional.</li>\r\n<li>Concursos de creatividad, innovación.</li>\r\n<li>Puestos administrativos.</li>\r\n<li>Configuración de redes.</li>\r\n<li>Capacitación a empresas.</li>\r\n<li>Asesor de tesis de licenciatura y maestría.</li>\r\n<li>Estadías profesionales en diversas empresas.</li>\r\n<li>Convenios con el sector privado y de gobierno.</li>\r\n</ul>', '<ul>\r\n<li>Programación</li>\r\n<li>Administración de centros de cómputo</li>\r\n<li>Auditoría de datos</li>\r\n<li>Taller de investigación</li>\r\n<li>Telecomunicaciones</li>\r\n<li>Redes de computadoras</li>\r\n<li>Administración de redes</li>\r\n</ul>', 'lizbeth.sf@veracruz.tecnm.mx', 'lizbethSanchezFerrer.webp', 1, NULL, NULL, NULL, NULL),
(27, 'Marco Alberto Romo Medina', '', '', '<ul>\r\n<li>Programación</li>\r\n<li>Simulación</li>\r\n</ul>', 'marco.rm@veracruz.tecnm.mx', 'user.webp', 1, NULL, NULL, NULL, NULL),
(28, 'Miguel Angel Pérez Cabada', 'La programación mueve al mundo.', 'Maestría en seguridad informática, Participe en concursos de robótica con el robot NAO, actualmente preparando un sistema de realidad virtual para el metaverso', '<ul>\r\n<li>Programación avanzada</li>\r\n<li>Base de datos distribuidas</li>\r<li>Concurrencia con GPUs en videojuegos</li>\n</ul>', 'miguel.pc@veracruz.tecnm.mx', 'miguelAngelPerezCabada.webp', 1, NULL, NULL, NULL, NULL),
(29, 'Noemi Del Carmen Tenorio Prieto', 'Profesor de tiempo completo con 27 años de experiencia docente, en el Tecnológico Nacional de México, campus Instituto Tecnológico Superior de San Andrés Tuxtla, Instituto Tecnológico Cerro Azul e Instituto Tecnológico de Veracruz.', 'Ha impartido asignaturas en las siguientes ingenierías:<br>\r\nIng. en Sistemas Computacionales, Industrial, Bioquímica, Química, Eléctrica, Electrónica, Energías Renovables, Mecatrónica, Mecánica,  y licenciatura en Administración.<br>\r\nProfesor con reconocimiento de Perfil Deseable.<br>\r\nEjerce la tutoría I y II para los alumnos de la carrera de Ingeniería en Sistemas Computacionales.<br>\r\n<br>\r\nFunciones administrativas ejercidas entre otras:<br>\r\n          &emsp;*  Enlace de Sistemas de Gestión del ITVER<br>\r\n          &emsp;*  Coordinadora de posgrado de la DEPI<br>\r\n          &emsp;*  Subcoordinadora de la Zona V de los Centros de Información del SNIT,<br>\r\n          &emsp;*  Instructor  de la Biblioteca Virtual tecnológica<br>\r\n          &emsp;*  Enlace de Conricyt<br>\r\n<br>\r\nEgresada del Instituto Tecnológico de Orizaba como Técnico laboratorista Químico,  Licenciado en Informática y Maestra en Ingeniería Administrativa.<br> \r\n<br>\r\nProfesor con Reconocimiento de Perfil deseable.<br> \r\n<br>\r\nHa realizado los siguientes diplomados:<br>\r\n       	&emsp;*  Microsoft Teams 4ª Emisión: Alternancia de dinámicas de enseñanza y aprendizaje.<br> \r\n        &emsp;   para la educación híbrida y remota (2021)<br>\r\n	&emsp;*  Educación Inclusiva (2020)<br>\r\n        &emsp;*  Recursos educativos en ambientes virtuales de aprendizaje (2017)<br>\r\n	&emsp;*  Formación de tutores (2016)<br>\r\n	&emsp;*  Formación docente en TIC (2014)<br>\r\n        &emsp;*  Formación y desarrollo de competencias docentes (2011)<br>\r\n	&emsp;*  Ingeniería Administrativa (2008)<br>\r\n	&emsp;*  Praxis de la Docencia (2004)<br>\r\n	&emsp;*  Iniciación a la Docencia (2002)<br>\r\n<br>\r\nCuenta con las siguientes certificaciones:<br>\r\nCertificado de competencias laborales en el estándar de competencia (CONOCER):<br>\r\n         &emsp;Impartición de cursos de formación del capital humano de manera presencial grupal<br> \r\n         &emsp;NORMA EC0217<br>\r\n         <br>\r\n         &emsp;Evaluación del aprendizaje con enfoque en competencias profesionales<br>\r\n         &emsp;NORMA EC0772<br>\r\n         <br>\r\n	 &emsp;Desarrollo de cursos en línea<br> \r\n         &emsp;NORMA EC0366<br>\r\n	 <br>\r\nHa publicado los siguientes libros:<br>\r\n         &emsp;Análisis de factibilidad de un CRAI, un nuevo paradigma de gestión del conocimiento<br>\r\n         &emsp;ISBN: 978-3-8417-6308-2<br>\r\n<br>\r\nEs coautora del siguiente libro:<br>\r\n        &emsp;Prospectivas y teorías integrales para ingeniería y administración<br>\r\n        &emsp;ISBN: 978-3-639-60263-0<br>\r\n<br>\r\nHa participado en los siguientes capítulos de libro:<br>\r\n         &emsp;Estudio Técnico.<br>\r\n         &emsp;ISBN: 978-1-4633-8127-1<br>\r\n<br>\r\n         &emsp;El efecto de la corrupción en las estrategias de gestión de las micro y pequeñas \r\n         &emsp;empresas. Casos: Boca del Río y Medellín, Veracruz, México.<br>\r\n         &emsp;ISBN: TOMO II 978-607-736-634-8<br>\r\n<br>\r\n         &emsp;Imagen pública de la micro y pequeña empresa en Veracruz, Veracruz.<br>\r\n         &emsp;ISBN:978-607-98311-6-5<br>\r\n<br>\r\n         &emsp;Innovación e Industria 4.0 en las micro y pequeñas empresas de Veracruz, Veracruz.<br>\r\n         &emsp;ISBN TOMO II: 978-1-4562-8208-0<br>\r\n<br>\r\n         &emsp;Caracterización de la cultura financiera en micro y pequeñas empresas del municipio \r\n         &emsp;de Veracruz del estado de Veracruz de Ignacio de la Llave, México.<br>\r\n         &emsp;ISBN TOMO II: 978-607-15-1602-2, entre otros.<br>\r\n<br>\r\nAsí como varios artículos de publicaciones<br>', '<ul>\r\n<li>Fundamentos de programación</li>\r\n<li>Algoritmos y Lenguajes de Programación</li>\r\n<li>Taller de Informática Administrativa I</li>\r\n<li>Análisis de Sistemas</li>\r\n<li>Introducción a la Ingeniería en Sistemas Computacionales</li>\r\n<li>Informática</li> \r\n<li>Planificación y Modelado</li>\r\n<li>Fundamentos de Desarrollo de Sistemas</li>\r\n<li>Taller de Administración</li>\r\n<li>Fundamentos de Investigación</li>\r\n<li>Taller de Investigación I</li>\r\n<li>Taller de Investigación II</li>\r\n<li>Cultura Empresarial</li>\r\n<li>Administración Estratégica</li>\r\n<li>Desarrollo Sustentable</li>\r\n<li>Taller de Gestión Empresarial</li>\r\n<li>Calidad Aplicada a la Gestión Empresarial</li>\r\n</ul>', 'noemi.tp@veracruz.tecnm.mx', 'noemiDelCarmenTenorioPrieto.webp', 1, NULL, NULL, NULL, NULL),
(30, 'Ofelia Gutiérrez Giraldi', '\"Un profesor trabaja para la eternidad, nadie puede decir dónde acaba su influencia\" Henry Adams.', 'Maestría en Educación, con especialidad en Organización y Administración de la Educación Superior. <br>\r\n<br>\r\nMaestría en Sistemas de Información.', 'En licenciatura: \r\n<ul>\r\n<li>Lenguajes y Autómatas I y II</li>\r\n<li>Ingeniería de Software</li>\r\n<li>Estructura de Datos</li>\r\n<li>Taller de Investigación I y II</li>\r\n<li>Compiladores</li>\r\n<li>Teoría de la Computación</li>\r\n</ul>\r\n\r\nEn Maestría: \r\n<ul>\r\n<li>Teoría de la Computación</li>\r\n<li>Seminario de Investigación</li>\r\n<li>Tópicos de Computación</li>\r\n</ul>', 'ofelia.gg@veracruz.tecnm.mx', 'ofeliaGutierrezGiraldi.webp', 1, NULL, NULL, NULL, NULL),
(31, 'Patricia Horta Rosado', '', 'Licenciatura en Sistemas Computacionales, Maestría en Sistemas de Información.\r\n', '<ul>\r\n<li>Programación</li>\r\n<li>Fundamentos de Programación</li>\r\n<li>Inteligencia Artificial</li>\r\n<li>Fundamentos de Telecomunicaciones</li>\r\n<li>Taller de Investigación I y II</li>\r\n<li>Taller de Sistemas Operativos</li>\r\n</ul>\r\n', 'patricia.hr@veracruz.tecnm.mx', 'patriciaHortaRosado.webp', 1, NULL, NULL, NULL, NULL),
(32, 'Primavera Argüelles Lucho', '', 'Mi formación como Ingeniera en Sistemas Computacionales, Maestría en Ingeniería Aplicada y Doctorado en Materiales y Nanociencia las cuales las terminé en tiempo y forma. He participado en la publicación de 15 artículos de los cuales 4 son de investigación, 5 de congreso internacional, 5 de congreso nacional y 1 de divulgación; publicados en revistas pertenecientes al índice de revistas mexicanas de divulgación científica y tecnológica del CONACYT.  Algunos de mis trabajos están relacionados con el modelado de elementos finitos de sistemas microelectromecánicos, sensores de gas y síntesis química de óxido de titanio. En la siguiente liga se encuentran los trabajos antes mencionados<br><a href=\"https://scholar.google.com/citations?view_op=list_works&hl=es&hl=es&user=3EUcm1YAAAAJ\" target=\"_blank\">Google Scholar - Primavera Argüelles Lucho</a>', '<ul>\r\n<li>Tópicos selectos de programación</li>\r\n<li>Graficación</li>\r\n<li>Lenguajes y Autómatas I</li>\r\n<li>Taller de base de datos</li>\r\n<li>Ingeniería de materiales no metálicos</li>\r\n<li>Tópicos selectos de física</li>\r\n<li>Física y Física general  </li>\r\n</ul>', 'primavera.al@veracruz.tecnm.mx\n', 'primaveraArguellesLucho.webp', 1, NULL, NULL, NULL, NULL),
(33, 'Rafael Córdoba Del Valle', 'Doctor en Sistemas y Ambientes Educativos. Catedrático del Departamento de Sistemas y Computación. \r\nLínea de investigación que desarrolla: Ambientes Virtuales de Aprendizaje. ', 'Publicación de diversos artículos en revistas nacionales. Participación de Congresos Nacionales e Internacionales. \r\nDesarrollo de un proyecto de investigación acerca de la inclusión de aplicaciones multimedia en la enseñanza y \r\naprendizaje para mejorar la comprensión de las fracciones en estudiantes de primaria. Miembro Activo del Consejo de \r\nTransformación Educativa.', '<ul>\r\n<li>Estructura de Datos</li>\r\n<li>Fundamentos de Programación</li>\r\n<li>Sistemas Operativos</li>\r\n<li>Taller de Investigación</li>\r\n<li>Programación</li>\r\n<li>Programación Estructurada</li>\r\n<li>Programación Orientada a Objetos</li>\r\n<li>Algoritmos y Lenguajes de Programación</li>\r\n<li>Tópicos Selectos de Programación</li>\r\n</ul>', 'rafael.cd@veracruz.tecnm.mx', 'rafaelCordobaDelValle.webp', 1, NULL, NULL, NULL, NULL),
(34, 'Rafael Rivera López', 'Haz lo que tengas que hacer dando tu mayor esfuerzo\r\n', '\"Originario de Poza Rica de Hidalgo, Veracruz. Ingeniero en Sistemas Computacionales por el Instituto Tecnológico de Veracruz (1989), Maestro en Ciencias de la Computación por el Instituto Tecnológico y de Estudios Superiores de Monterrey (2000) y Doctor en Ciencias de la Computación por la Universidad Juárez Autónoma de Tabasco (2018).<br>\r\n<br>\r\nFue premiado como uno de los cinco mejores estudiantes de Física en México por la Dirección General de Educación Tecnológica Industrial en 1985, reconocido como estudiante de excelencia por el Tecnológico de Monterrey en el 2000, y con mención honorífica por la defensa de su tesis doctoral. <br>\r\n<br>\r\nActualmente es Profesor Investigador de Tiempo Completo del Departamento de Sistemas y Computación del Instituto Tecnológico de Veracruz.<br>\r\n<br>\r\nImparte cursos a nivel licenciatura en las áreas de programación orientada a objetos e inteligencia artificial.<br>\r\n<br>\r\nDesde 2007, es profesor con perfil deseable reconocido por PRODEP y a partir de 2019 es miembro del Sistema Nacional de Investigadores (SNI) de Conacyt. Además, en 2021 se integró como miembro de la Red Temática Conacyt de Aprendizaje e Inteligencia Computacional Aplicada (REDICA) y como miembro adherente de la Academia Mexicana de la Computación (AMEXCOMP). Desde 2022 forma parte de la Sociedad Mexicana de Ciencia de la Computación (SMCC).<br>\r\n<br>\r\nHa publicado artículos en revistas indexadas por el Journal Citation Report (JCR), y en diversos congresos nacionales y extranjeros. Sus intereses de investigación incluyen el estudio y aplicación de metaheurísticas para resolver problemas complejos y el diseño de modelos orientados a objetos para implementar procedimientos de aprendizaje automático.<br>\r\n<br>\r\n<br><a href=\"https://www.rafaelriveralopez.net\" target=\"_blank\">Sitio web personal</a> <br><a href=\"https://www.researchgate.net/profile/Rafael-Rivera-Lopez\" target=\"_blank\">Cuenta de ResearchGate - Rafael Rivera Lopez</a> <br><a href=\"https://www.webofscience.com/wos/author/record/1097915\" target=\"_blank\">Cuenta de Web of Sciences - Rafael Rivera Lopez</a>', '<ul>\r\n<li>Fundamentos de Programación</li>\r\n<li>Programación</li>\r\n<li>Programación Orientada a Objetos</li> <li>Graficación</li>\r\n<li>Tópicos Avanzados de Programación</li>\r\n<li>Inteligencia Artificial</li>\r\n<li>Redes de Computadoras</li>\r\n<li>Física</li>\r\n<li>Análisis de Sistemas</li>\r\n<ul>', '<ul><li>rafael.rl@veracruz.tecnm.mx</li><li>rafaelriveralopez@gmail.com</li></ul>', 'rafaelRiveraLopez.webp', 1, NULL, NULL, NULL, NULL),
(35, 'Raúl Héctor Trujillo Jimémez', 'El éxito es la suma de pequeños esfuerzos repetidos día a día.', 'Ing. en sistemas computacionales y Master en sistemas de información así como empresario con mas de 30 años en TI \r\nen el sector Financiero. <br>\r\nCon 35 años Catedrático a nivel licenciatura como maestrías en diversas Universidades en el puerto de Veracruz.', '<ul>\r\n<li>Administración de Proyectos</li>\r\n<li>Fundamentos de Programación</li>\r\n<li>Programación</li>\r\n<li>Fundamentos de Bases de Datos</li>\r\n<li>Administración de Base de Datos</li> \r\n<li>Minería de base de datos</li>\r\n<li>Base de datos distribuidas</li>\r\n<li>Redes</li> \r\n<li>Entre Otras</li>\r\n</ul>', 'raul.tj@veracruz.tecnm.mx', 'raulHectorTrujilloJimemez.webp', 1, NULL, NULL, NULL, NULL),
(36, 'Ricardo Rodríguez de la Lanza', 'Lo mas importante es obtener Profesionistas de Calidad Mundial', '28 años de Labor docente', '<ul><li>Bases de Datos</li><li>fundamentos</li><li>Ing de software</li><li>auditoria en informatica</li></ul>', 'ricardo.rd@veracruz.tecnm.mx', 'user.webp', 1, NULL, NULL, NULL, NULL),
(37, 'Senén Juárez Tinoco', 'Trabajar por una superación constante.', 'Ingeniero en Sistemas Computacionales, miembro de la primera generación en la Carrera de ISC en el Instituto Tecnológico de Veracruz. Maestría en Sistemas Computacionales con especialidad en Inteligencia Artificial. Experiencia laboral en el área de Tecnologías de la Información en sectores Comercial y Portuario. Empresario en áreas como Tecnologías de la Información y la Seguridad. Consultor en Factorías de Software.', '<ul>\r\n<li>Programación Orientada a Objetos</li>\r\n<li>Tópicos Avanzados de Programación</li>\r\n<li>Ingeniería de Software</li>\r\n<li>Taller de Investigación I y II</li>\r\n<li>Introducción a las Bases de Datos</li>\r\n<li>Administración de Bases de Datos</li>\r\n</ul>', 'senen.jt@veracruz.tecnm.mx', 'senenJuarezTinoco.webp', 1, NULL, NULL, NULL, NULL),
(38, 'Virginia Osorio Campos', '...', 'Maestría en Administración.', '<ul>\r\n<li>Programación</li> \r\n<li>Programación Estructurada</li>\r\n<li>Programación Básica</li>\r\n<li>Algoritmos y Lenguajes de Programación</li>\r\n<li>Algoritmos y Programación</li> \r\n<li>Lógica de Programación</li>\r\n<li>Tecnologías de la Información</li>\r\n<li>Taller de Informática Administrativa</li>\r\n</ul>', 'virginia.oc@veracruz.tecnm.mx', 'virginiaOsorioCampos.webp', 1, NULL, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `tbl_carrera_docente`
--

INSERT INTO `tbl_carrera_docente` (`carreraDocenteId`, `carreraId`, `docenteId`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 11, 1, 1, NULL, NULL, NULL, NULL),
(2, 11, 2, 1, NULL, NULL, NULL, NULL),
(3, 11, 3, 1, NULL, NULL, NULL, NULL),
(4, 11, 4, 1, NULL, NULL, NULL, NULL),
(5, 11, 5, 1, NULL, NULL, NULL, NULL),
(6, 11, 6, 1, NULL, NULL, NULL, NULL),
(7, 11, 7, 1, NULL, NULL, NULL, NULL),
(8, 11, 8, 1, NULL, NULL, NULL, NULL),
(9, 11, 9, 1, NULL, NULL, NULL, NULL),
(10, 11, 10, 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1, NULL, NULL, NULL, NULL),
(12, 11, 12, 1, NULL, NULL, NULL, NULL),
(13, 11, 13, 1, NULL, NULL, NULL, NULL),
(14, 11, 14, 1, NULL, NULL, NULL, NULL),
(15, 11, 15, 1, NULL, NULL, NULL, NULL),
(16, 11, 16, 1, NULL, NULL, NULL, NULL),
(17, 11, 17, 1, NULL, NULL, NULL, NULL),
(18, 11, 18, 1, NULL, NULL, NULL, NULL),
(19, 11, 19, 1, NULL, NULL, NULL, NULL),
(20, 11, 20, 1, NULL, NULL, NULL, NULL),
(21, 11, 21, 1, NULL, NULL, NULL, NULL),
(22, 11, 22, 1, NULL, NULL, NULL, NULL),
(23, 11, 23, 1, NULL, NULL, NULL, NULL),
(24, 11, 24, 1, NULL, NULL, NULL, NULL),
(25, 11, 25, 1, NULL, NULL, NULL, NULL),
(26, 11, 26, 1, NULL, NULL, NULL, NULL),
(27, 11, 27, 1, NULL, NULL, NULL, NULL),
(28, 11, 28, 1, NULL, NULL, NULL, NULL),
(29, 11, 29, 1, NULL, NULL, NULL, NULL),
(30, 11, 30, 1, NULL, NULL, NULL, NULL),
(31, 11, 31, 1, NULL, NULL, NULL, NULL),
(32, 11, 32, 1, NULL, NULL, NULL, NULL),
(33, 11, 33, 1, NULL, NULL, NULL, NULL),
(34, 11, 34, 1, NULL, NULL, NULL, NULL),
(35, 11, 35, 1, NULL, NULL, NULL, NULL),
(36, 11, 36, 1, NULL, NULL, NULL, NULL),
(37, 11, 37, 1, NULL, NULL, NULL, NULL),
(38, 11, 38, 1, NULL, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `tbl_especialidad`
--

INSERT INTO `tbl_especialidad` (`especialidadId`, `carreraId`, `nombre`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 1, 'Calidad y Productividad', 1, NULL, NULL, NULL, NULL),
(2, 1, 'Negocios Globales', 1, NULL, NULL, NULL, NULL),
(3, 2, 'Gestión y Negocios', 1, NULL, NULL, NULL, NULL),
(4, 2, 'Mercadotecnia y Negocios Internacionales', 1, NULL, NULL, NULL, NULL),
(5, 3, 'Ingeniería de Procesos', 1, NULL, NULL, NULL, NULL),
(6, 3, 'Alimentos', 1, NULL, NULL, NULL, NULL),
(7, 3, 'Gestión Ambiental', 1, NULL, NULL, NULL, NULL),
(8, 4, 'Ingeniería de Bioprocesos en Alimentos', 1, NULL, NULL, NULL, NULL),
(9, 4, 'Ingeniería de Bioprocesos en Ambiente-Energía', 1, NULL, NULL, NULL, NULL),
(10, 4, 'Ingeniería de Bioprocesos Farmacéuticos', 1, NULL, NULL, NULL, NULL),
(11, 5, 'Manufactura', 1, NULL, NULL, NULL, NULL),
(12, 5, 'Mantenimiento', 1, NULL, NULL, NULL, NULL),
(13, 6, 'Sistemas Robóticos y Mecatrónicos', 1, NULL, NULL, NULL, NULL),
(14, 6, 'Sistemas Digitales', 1, NULL, NULL, NULL, NULL),
(15, 6, 'Energías Renovables', 1, NULL, NULL, NULL, NULL),
(16, 7, 'Gestión de la productividad, calidad y competencia', 1, NULL, NULL, NULL, NULL),
(17, 7, 'Optativas', 1, NULL, NULL, NULL, NULL),
(18, 8, 'Gestión de la Calidad de la Energía', 1, NULL, NULL, NULL, NULL),
(19, 8, 'Ingeniería Ambiental y Seguridad Laboral', 1, NULL, NULL, NULL, NULL),
(20, 8, 'Innovación para el desarrollo empresarial', 1, NULL, NULL, NULL, NULL),
(21, 9, 'Aplicaciones Industriales', 1, NULL, NULL, NULL, NULL),
(22, 9, 'Gestión de Sistemas Energéticos', 1, NULL, NULL, NULL, NULL),
(23, 10, 'Gestión de Sistemas Energéticos', 1, NULL, NULL, NULL, NULL),
(24, 10, 'Sistemas Digitales', 1, NULL, NULL, NULL, NULL),
(25, 11, 'Concurrencia Computacional Avanzada', 1, NULL, NULL, NULL, NULL);

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
(52, 11, 11, 'Bases de Datos Distribuidas', 'Especialidad', 9, 'Conocer y aplicar la filosofía de manejo de Base de Datos Distribuidas.', 'https://www.youtube.com/embed/eys4i3Bb5_s', 'https://bit.ly/3Yde3nb', 1, NULL, NULL, NULL, NULL),
(53, 3, NULL, 'Taller de ética', ' ', 1, 'Desarrolla conciencia sobre el significado y sentido de la Ética para orientar su comportamiento en el contexto social y profesional.', '', '', 1, NULL, NULL, NULL, NULL),
(54, 3, NULL, 'Fundamentos de investigación', ' ', 1, 'Aplica los elementos de la investigación documental para elaborar escritos académicos de su entorno profesional.', '', '', 1, NULL, NULL, NULL, NULL),
(55, 3, NULL, 'Cálculo diferencial', ' ', 1, 'Plantea y resuelve problemas utilizando las definiciones de límite y derivada de funciones de una variable para la elaboración de modelos matemáticos aplicados.', '', '', 1, NULL, NULL, NULL, NULL),
(56, 3, NULL, 'Química Inorgánica', ' ', 1, 'Relaciona las propiedades físicas y químicas de las sustancias con los conceptos fundamentales de la estructura atómica y la forma en que los átomos interactúan entre sí para la formación de compuestos.', '', '', 1, NULL, NULL, NULL, NULL),
(57, 3, NULL, 'Programación', ' ', 1, 'Desarrolla programas mediante el uso de un lenguaje de programación como herramientas en la construcción de soluciones a problemas de ingeniería optimizando el tiempo de resolución.', '', '', 1, NULL, NULL, NULL, NULL),
(58, 3, NULL, 'Dibujo Asistido por Computadora', ' ', 1, 'Interpreta, elabora, y utiliza planos y diagramas de equipos y procesos de Ingeniería Química o Bioquímica apoyándose en el dibujo asistido por computadora.', '', '', 1, NULL, NULL, NULL, NULL),
(59, 3, NULL, 'Álgebra Lineal', ' ', 2, 'Resuelve problemas de modelos lineales aplicados en ingeniería para la toma de decisiones de acuerdo a la interpretación de resultados utilizando matrices y sistemas de ecuaciones.', '', '', 1, NULL, NULL, NULL, NULL),
(60, 3, NULL, 'Mecánica Clásica', ' ', 2, 'Conoce los conceptos de estática y dinámica para establecer y comprender las bases del planteamiento de problemas de ingeniería, verificándolo mediante su modelado matemático.', '', '', 1, NULL, NULL, NULL, NULL),
(61, 3, NULL, 'Cálculo Integral', ' ', 2, 'Aplica la definición de integral y las técnicas de integración para resolver problemas de ingeniería.', '', '', 1, NULL, NULL, NULL, NULL),
(62, 3, NULL, 'Química Organica I', ' ', 2, 'Identifica los compuestos orgánicos por su estructura, su nomenclatura y su estereoquímica para comprender y desarrollar los procesos químicos donde participan dichos compuestos.', '', '', 1, NULL, NULL, NULL, NULL),
(63, 3, NULL, 'Química Analítica', ' ', 2, 'Aplica los distintos métodos empleados en el análisis químico cuantitativo, así como los fundamentos y aplicaciones del equilibro químico (ácido-base, redox, solubilidad y complejos) para llevar a cabo procedimientos analíticos de diversas sustancias.', '', '', 1, NULL, NULL, NULL, NULL),
(64, 3, NULL, 'Análisis de Datos Experimentales', ' ', 3, 'Aplica conceptos estadísticos, análisis de varianza, diseño de experimentos y control estadístico de datos para probar inferencias y tomar decisiones que permitan optimizar las variables de procesos en industrias químicas y de servicios.', '', '', 1, NULL, NULL, NULL, NULL),
(65, 3, NULL, 'Electricidad, Magnetismo y Óptica', ' ', 3, 'Aplica los principios fundamentales y leyes de la óptica y electromagnetismo para resolver problemas relacionados con los fenómenos físicos del entorno.', '', '', 1, NULL, NULL, NULL, NULL),
(66, 3, NULL, 'Cálculo Vectorial', ' ', 3, 'Aplica los principios y técnicas básicas del cálculo vectorial para resolver problemas de ingeniería del entorno.', '', '', 1, NULL, NULL, NULL, NULL),
(67, 3, NULL, 'Química Orgánica II', ' ', 3, 'Reconoce a los compuestos orgánicos por su estructura y nombre para identificar sus propiedades y comprende los mecanismos de reacción más importantes que suceden en estos compuestos.', '', '', 1, NULL, NULL, NULL, NULL),
(68, 3, NULL, 'Termodinámica', ' ', 3, 'Aplica los principios y leyes de la termodinámica, para evaluar la energía en un sistema utilizando tablas y diagramas, cuantificando los requerimientos térmicos en diferentes procesos.', '', '', 1, NULL, NULL, NULL, NULL),
(69, 3, NULL, 'Gestión de la Calidad', ' ', 3, 'Implementa y opera sistemas de gestión de calidad, ambiental y seguridad en la industria, para lograr la estandarización y sistematización de los procesos.', '', '', 1, NULL, NULL, NULL, NULL),
(70, 3, NULL, 'Métodos Numéricos', ' ', 4, 'Aplica algoritmos numéricos y software estadístico para agilizar la solución de problemas relacionados con la ingeniería de procesos.', '', '', 1, NULL, NULL, NULL, NULL),
(71, 3, NULL, 'Ecuaciones Diferenciales', ' ', 4, 'Aplica los métodos de solución de ecuaciones diferenciales ordinarias para resolver problemas que involucran sistemas dinámicos que se presentan en la ingeniería.', '', '', 1, NULL, NULL, NULL, NULL),
(72, 3, NULL, 'Mecánismos de Transferencia', ' ', 4, 'Genera grupos adimensionales y/o correlaciones en sistemas con transferencia de cantidad de movimiento, calor y masa utilizando las técnicas o métodos de análisis dimensional.', '', '', 1, NULL, NULL, NULL, NULL),
(73, 3, NULL, 'Ingeniería Ambiental', ' ', 4, 'Maneja la terminología de la Química orgánica e inorgánica, conoce e identifica los tipos de ecosistema y sus componentes, dimensiona los elementos y componentes del ambiente, completa y balancea reacciones químicas.', '', '', 1, NULL, NULL, NULL, NULL),
(74, 3, NULL, 'Balance de Materia y Energía', ' ', 4, 'Identifica, analiza y establece balances de materia y energía en sistemas en estado estable para cuantificar el proceso de transformación de la materia y la energía asegurando el óptimo aprovechamiento de los recursos involucrados.', '', '', 1, NULL, NULL, NULL, NULL),
(75, 3, NULL, 'Análisis Instrumental', ' ', 4, 'Aplica los métodos de instrumentación analítica para identificar y cuantificar los componentes de una muestra con el mínimo de error.', '', '', 1, NULL, NULL, NULL, NULL),
(76, 3, NULL, 'Desarrollo Sustentable', ' ', 5, 'Aplica una visión sustentable, en los ámbitos social, económico y ambiental que le permitirá evaluar y disminuir el impacto de la sociedad sobre el entorno, tomando en cuenta estrategias y considerando profesionalmente los valores ambientales.', '', '', 1, NULL, NULL, NULL, NULL),
(77, 3, NULL, 'Ingeniería de Costos', ' ', 5, 'Comprende y aplica los métodos más adecuados para estimar, proyectar y reducir costos de capital para mejorar la factibilidad o rentabilidad de un proyecto.', '', '', 1, NULL, NULL, NULL, NULL),
(78, 3, NULL, 'Balance de Momento, Calor y Masa', ' ', 5, 'Calcula el flujo de masa o volumétrico, el flujo de calor, densidad de flujo de masa, perfiles de velocidad, de temperatura y concentración en sistemas con transferencia de cantidad de movimiento, calor y masa utilizando los balances correspondientes.', '', '', 1, NULL, NULL, NULL, NULL),
(79, 3, NULL, 'Procesos de Separación I', ' ', 5, 'Selecciona equipo relacionado con el flujo de fluidos, agitación y mezclado, reducción de tamaño, transporte de sólidos y separaciones mecánicas e hidráulica con base a los criterios de selección respectivos.', '', '', 1, NULL, NULL, NULL, NULL),
(80, 3, NULL, 'Fisicoquímica I', ' ', 5, 'Resuelve problemas de equilibrio de fases de sistemas puros y mezclas, evaluando propiedades termodinámicas con el empleo de las relaciones fundamentales de la termodinámica, relaciones de Maxwell y coeficientes de actividad y fugacidad.', '', '', 1, NULL, NULL, NULL, NULL),
(81, 3, NULL, 'Salud y Seguridad en el Trabajo', ' ', 5, 'Propone programas de Seguridad e higiene industrial para una empresa, de acuerdo a los riesgos a los que se encuentre el trabajador y cumpliendo con la normatividad nacional e internacional , con la ética profesional y convivencia armónica.', '', '', 1, NULL, NULL, NULL, NULL),
(82, 3, NULL, 'Taller de Investigación I', ' ', 6, 'Elabora un protocolo de investigación en el que presenta soluciones científico - tecnológicas a problemáticas relacionadas con su campo profesional en diversos contextos.', '', '', 1, NULL, NULL, NULL, NULL),
(83, 3, NULL, 'Procesos de Separación II', ' ', 6, 'Diseña y selecciona equipos utilizados en plantas químicas tales como: intercambiadores de calor, evaporadores, cristalizadores, torres de enfriamiento y secadores aplicando los conceptos de transferencia de masa y calor, equilibrio de fases y procedimientos de cálculo necesarios para el dimensionamiento de ellos.', '', '', 1, NULL, NULL, NULL, NULL),
(84, 3, NULL, 'Laboratorio Integral I', ' ', 6, 'Opera equipo y obtiene e interpreta datos en mecánica de fluidos, manejo de sólidos, separación hidráulica y transferencia de momentum, calor y masa en un ambiente controlado de laboratorio mediante la planeación y desarrollo de actividades prácticas.', '', '', 1, NULL, NULL, NULL, NULL),
(85, 3, NULL, 'Fisicoquímica II', ' ', 6, 'Realiza un balance termodinámico para determinar la constante de equilibrio químico y analiza el efecto de la presión y la temperatura en la composición de equilibrio y las condiciones óptimas de operación de un sistema con reacción química reversible.', '', '', 1, NULL, NULL, NULL, NULL),
(86, 3, NULL, 'Taller de Investigación II', ' ', 7, 'Consolida el protocolo para ejecutar la investigación y obtener productos para su exposición, defensa y gestión de su transcendencia.', '', '', 1, NULL, NULL, NULL, NULL),
(87, 3, NULL, 'Procesos de Separación III', ' ', 7, 'Diseña y selecciona equipos utilizados en plantas químicas, tales como: destilación, absorción, extracción y adsorción de mezclas binarias y multicomponentes integrando las aplicaciones de transferencia de calor, transferencia de masa y equilibrio de fases en los procedimientos de cálculo que se establecen para la integración en los procesos químicos.', '', '', 1, NULL, NULL, NULL, NULL),
(88, 3, NULL, 'Sínstesis y Óptimización de Procesos', ' ', 7, 'Adapta, selecciona, desarrolla, optimiza y evalúa económicamente un proceso o tecnología nueva, elaborando un informe para tomar decisiones, considerando la factibilidad ambiental.', '', '', 1, NULL, NULL, NULL, NULL),
(89, 3, NULL, 'Reactores Químicos', ' ', 7, 'Diseña reactores continuos y discontinuos, isotérmicos y no isotérmicos para la obtención de productos de la industria química y combina diferentes tipos de reactores para mejorar la eficiencia de reacción.', '', '', 1, NULL, NULL, NULL, NULL),
(90, 3, NULL, 'Laboratorio Integral II', ' ', 7, 'Planea y desarrolla experimentos para la obtención de datos que permitan la comprobación de las teorías y leyes de la Fisicoquímica I, II y de Reactores Químicos, para comprobar los fenómenos involucrados, en un ambiente controlado de laboratorio.', '', '', 1, NULL, NULL, NULL, NULL),
(91, 3, NULL, 'Taller de Administración General', ' ', 8, 'Conoce las etapas del proceso administrativo dentro de las empresas industriales y de servicios con el propósito de administrar adecuadamente una organización.', '', '', 1, NULL, NULL, NULL, NULL),
(92, 3, NULL, 'Laboratorio Integral III', ' ', 8, 'Desarrolla la capacidad de obtención de datos experimentales y su interpretación de acuerdo con los conceptos de procesos de separación en un ambiente controlado de laboratorio.', '', '', 1, NULL, NULL, NULL, NULL),
(93, 3, NULL, 'Instrumentación y Control', ' ', 8, 'Selecciona y aplica la instrumentación para el control de procesos químicos o bioquímicos a partir de los requerimientos óptimos de operación.', '', '', 1, NULL, NULL, NULL, NULL),
(94, 3, NULL, 'Ingeniería de Proyectos', ' ', 8, 'Desarrolla y evalúa un proyecto técnico considerando el desarrollo sustentable.', '', '', 1, NULL, NULL, NULL, NULL),
(95, 3, NULL, 'Simulación de Procesos', ' ', 8, 'Simula procesos químicos utilizando software comercial.', '', '', 1, NULL, NULL, NULL, NULL),
(96, 3, 1, 'Optimización y Costos de Procesos', ' ', 0, 'Optimizar procesos químicos y elaborar reportes de los costos involucrados mediante el uso de simuladores comerciales de procesos.', '', '', 1, NULL, NULL, NULL, NULL),
(97, 3, 1, 'Tubería e Instrumentación', ' ', 0, 'Diseñar el sistema de tuberías de un proceso químico, su instrumentación y control requerido utilizando normas nacionales e internacionales vigentes.', '', '', 1, NULL, NULL, NULL, NULL),
(98, 3, 1, 'Simulación dinámica', ' ', 0, 'Modelar equipos de procesos utilizados de la Industria Química en estado dinámico utilizando simuladores comerciales.', '', '', 1, NULL, NULL, NULL, NULL),
(99, 3, 1, 'Seguridad y Riesgo de los Procesos', ' ', 0, 'Proporcionar los conocimientos necesarios para llevar a cabo los mecanismos del Análisis de Riesgo a través de la Identificación del Peligro y de las situaciones peligrosas.', '', '', 1, NULL, NULL, NULL, NULL),
(100, 3, 1, 'Ingeniería de Servicios de Planta', ' ', 0, 'Especificar los componentes que conforman los diferentes circuitos de servicios auxiliares requeridos en plantas industriales tales como agua, vapor, aire y combustibles.', '', '', 1, NULL, NULL, NULL, NULL),
(101, 3, 2, 'Sistemas de Calidad e Inocuidad Alimentaria', ' ', 0, 'Identificar y desarrollar sistemas de inocuidad y de Calidad alimentaria, en base a la normatividad vigente.', '', '', 1, NULL, NULL, NULL, NULL),
(102, 3, 2, 'Química de Alimentos', ' ', 0, 'Relacionar las características bioquímicas y de funcionalidad química del agua, proteínas y enzimas, carbohidratos, lípidos, vitaminas y minerales con su influencia sobre los alimentos y los procesos de transformación en los alimentos.', '', '', 1, NULL, NULL, NULL, NULL),
(103, 3, 2, 'Innovaciones Tecnológicas en la Industria Alimentaria', ' ', 0, 'Desarrollar mecanismos para la producción de nuevos alimentos funcionalizados de origen animal o vegetal tomando en consideración las propiedades fisicoquímicas, sensoriales, así como las legislaciones vigentes de este tipo de productos alimenticios.', '', '', 1, NULL, NULL, NULL, NULL),
(104, 3, 2, 'Ingeniería de Alimentos', ' ', 0, 'Conocer, comprender y dominar las características y aplicación de las operaciones unitarias y los procesos de conservación, embalaje y empacado más comunes en la industria de alimentos.', '', '', 1, NULL, NULL, NULL, NULL),
(105, 3, 2, 'Microbiología y la Ingeniería  Alimentaria', ' ', 0, 'Analizar y valorar la importancia de la microbiología en los alimentos, considerando su identificación y cuantificación para asegurar la inocuidad de los alimentos.', '', '', 1, NULL, NULL, NULL, NULL),
(106, 3, 3, 'Ingeniería de Procesos Ambientales', ' ', 0, 'Conoce los mecanismos de potabilización del agua, del tratamiento de aguas residuales, residuos sólidos y peligrosos y de emisiones a la atmósfer', '', '', 1, NULL, NULL, NULL, NULL),
(107, 3, 3, 'Seguridad Laboral', ' ', 0, 'Proporcionar los conocimientos necesarios para la Gestión y el monitoreo la seguridad laboral de los trabajadores de la empresa.', '', '', 1, NULL, NULL, NULL, NULL),
(108, 3, 3, 'Seguridad y Riesgo de los Proceso', ' ', 0, 'Proporcionar los conocimientos necesarios para la administración de Riesgos en las empresas mediante el conocimiento del Sistema Globalmente Armonizado, los mecanismos de Identificación, Cuantificación y Jerarquización de Riesgos.', '', '', 1, NULL, NULL, NULL, NULL),
(109, 3, 3, 'Gestión Integral de Residuos', ' ', 0, 'Identificar los diferentes aspectos de la problemática ambiental por residuos, clasificar las fuentes contaminantes, conocer los conceptos básicos para identificar, y caracterizar los residuos,saber los principios de operación de los diferentes tratamientos aplicados para su prevención y control.', '', '', 1, NULL, NULL, NULL, NULL),
(110, 3, 3, 'Gestión Ambiental', ' ', 0, 'Proporcionar los conocimientos necesarios para comprender los sistemas de gestión, la política ambiental, administrativa y jurídica que se aplica en materia ambiental en el país, para la protección del ambiente.', '', '', 1, NULL, NULL, NULL, NULL),
(111, 8, 21, 'Instalaciones Eléctricas Industriales', '7', 7, 'Proyectar instalaciones eléctricas de manejo y utilización de fuerza en media y baja tensión en sistemas industriales y de servicios de alto consumo, respetando la normatividad \n', '', '', 1, NULL, NULL, NULL, NULL),
(112, 8, 22, 'Gestión Ambiental', '7', 7, 'Proporcionar los conocimientos necesarios para comprender la política ambiental, de calidad y de la seguridad desde una óptica administrativa y jurídica que se aplica en materia ambiental en el país, para la protección del ambiente.', '', '', 1, NULL, NULL, NULL, NULL),
(113, 8, 23, 'Contabilidad Orientada a los Negocios', '7', 7, 'Comprende la importancia del proceso contable en los negocios para formular Estados Financieros Básicos utilizando normas y procedimientos. ', '', '', 1, NULL, NULL, NULL, NULL),
(114, 8, 21, 'Electrónica Industrial', '8', 8, 'Analizar, diseñar y simular circuitos eléctricos y electrónicos, para interpretar las formas de ondas y el funcionamiento de los dispositivos semiconductores de potencia para la implementación de convertidores para aplicaciones industriales. ', '', '', 1, NULL, NULL, NULL, NULL),
(115, 8, 21, 'Instrumentación Virtual', '8', 8, 'Empleando: Controles, indicadores, gráficas, ciclos de repetición, temporización, subrutinas, grupos de datos y Registro de datos en archivos.txt y .csv', '', '', 1, NULL, NULL, NULL, NULL),
(116, 8, 22, 'Microbiología Ambiental', '8', 8, '', '', '', 1, NULL, NULL, NULL, NULL),
(117, 8, 22, 'Gestión de Sustancias y Residuos Peligrosos', '8', 8, '', '', '', 1, NULL, NULL, NULL, NULL),
(118, 8, 23, 'Costos Empresariales', '8', 8, 'Aplica la información generada por la contabilidad de los costos empresariales en la gestión de los procesos relacionados con los costos de adquisición, producción, distribución, administración y financiamiento', '', '', 1, NULL, NULL, NULL, NULL),
(119, 8, 23, 'Gestión Estratégica', '8', 8, 'Desarrolla estrategias empresariales considerando criterios de sustentabilidad, para obtener ventajas competitivas sostenibles en un entorno cambiante y globalizado. ', '', '', 1, NULL, NULL, NULL, NULL),
(120, 8, 21, 'Sistemas de Gestión Integral', '9', 9, '', '', '', 1, NULL, NULL, NULL, NULL),
(121, 8, 21, 'Calidad de la Energía Eléctrica', '9', 9, 'Comprende, identifica y analiza los problemas de calidad de la energía en sistemas eléctricos de potencia para proponer las soluciones pertinentes.', '', '', 1, NULL, NULL, NULL, NULL),
(122, 8, 22, 'Seguridad Laboral', '9', 9, 'Proporcionar los conocimientos necesarios para llevar a cabo el monitoreo la seguridad laboral de los trabajadores de la empresa.', '', '', 1, NULL, NULL, NULL, NULL),
(123, 8, 22, 'Ingeniería de Sistemas Ambientales', '9', 9, '', '', '', 1, NULL, NULL, NULL, NULL),
(124, 8, 23, 'El Emprendedor y la Innovación', '9', 9, 'Desarrolla la capacidad creativa y el espíritu empresarial, la elaboración de un portafolio de ideas emprendedoras, respetando la ética en el ámbito personal y profesional', '', '', 1, NULL, NULL, NULL, NULL),
(125, 8, 23, 'Gestión y Liderazgo', '9', 9, 'Desarrollar las habilidades que le permitan guiar, dirigir y orientar grupos de personas en el diseño, y mejora de los sistemas organizacionales cumpliendo con los estándares de calidad, eficiencia, ambientales, económicos y sociales y en la creación de empresas.', '', '', 1, NULL, NULL, NULL, NULL),
(126, 4, NULL, 'Fundamentos de Investigación', ' ', 1, 'Aplica los elementos de la investigación documental para elaborar escritos académicos de su entorno profesional. ', '', '', 1, NULL, NULL, NULL, NULL),
(127, 4, NULL, 'Cálculo Diferencial', ' ', 1, 'Plantea y resuelve problemas utilizando las definiciones de límite y derivada de funciones de una variable para la elaboración de modelos matemáticos aplicados.', '', '', 1, NULL, NULL, NULL, NULL),
(128, 4, NULL, 'Química', ' ', 1, 'Nombra adecuadamente a los elementos y compuestos químicos de importancia agronómica e industriales usando correctamente la tabla periódica para reafirmar conceptos básicos inorgánicos y orgánicos.', '', '', 1, NULL, NULL, NULL, NULL),
(129, 4, NULL, 'Taller de Ética', ' ', 1, 'Desarrolla conciencia sobre el significado y sentido de la Ética para orientar su comportamiento en el contexto social y profesional. ', '', '', 1, NULL, NULL, NULL, NULL),
(130, 4, NULL, 'Comportamiento Organizacional', ' ', 1, 'Conoce los elementos que con las características de un individuo, del grupo y de las organizaciones y aplica los conocimientos para proponer estrategias en la solución de conflictos y propiciar el desarrollo de organizaciones sanas. ', '', '', 1, NULL, NULL, NULL, NULL),
(131, 4, NULL, 'Dibujo Asistido por Computadora', ' ', 1, 'Interpreta, elabora, y utiliza planos y diagramas de equipos y procesos de Ingeniería Química o Bioquímica apoyándose en el dibujo asistido por computadora. ', '', '', 1, NULL, NULL, NULL, NULL),
(132, 4, NULL, 'Administración y Legislación de Empresas', ' ', 2, 'Aplica los conceptos del proceso administrativo para proveer una visión global de las áreas funcionales de una empresa con sustentabilidad.', '', '', 1, NULL, NULL, NULL, NULL),
(133, 4, NULL, 'Cálculo Integral', ' ', 2, 'Aplica la definición de integral y las técnicas de integración para resolver problemas de ingeniería. ', '', '', 1, NULL, NULL, NULL, NULL),
(134, 4, NULL, 'Química Orgánica I', ' ', 2, 'Identifica y analiza las propiedades físicas y químicas de los compuestos orgánicos para comprender su relación con los distintos tipos de reacciones que generan. ', '', '', 1, NULL, NULL, NULL, NULL),
(135, 4, NULL, 'Biología', ' ', 2, 'Comprende y describe la estructura y el funcionamiento de los sistemas biológicos, desde el nivel de organización de la célula hasta la transmisión de la información genética.', '', '', 1, NULL, NULL, NULL, NULL),
(136, 4, NULL, 'Química Analítica', ' ', 2, 'Comprender, aplicar y relacionar los fundamentos, métodos volumétricos, electros analíticos y gravimétricos de química analítica utilizados para la evaluación de materiales, intermediarios y productos de procesos industriales y recursos bióticos.', '', '', 1, NULL, NULL, NULL, NULL),
(137, 4, NULL, 'Álgebra Lineal', ' ', 2, 'Resuelve problemas de modelos lineales aplicados en ingeniería para la toma de decisiones de acuerdo a la interpretación de resultados utilizando matrices y sistemas de ecuaciones.', '', '', 1, NULL, NULL, NULL, NULL),
(138, 4, NULL, 'Cálculo Vectorial', ' ', 3, 'Aplica los métodos de solución de ecuaciones diferenciales ordinarias para resolver problemas que involucran sistemas dinámicos que se presentan en la ingeniería. ', '', '', 1, NULL, NULL, NULL, NULL),
(139, 4, NULL, 'Ecuaciones Diferenciales', ' ', 3, 'Aplica los métodos de solución de ecuaciones diferenciales ordinarias para resolver problemas que involucran sistemas dinámicos que se presentan en la ingeniería. ', '', '', 1, NULL, NULL, NULL, NULL),
(140, 4, NULL, 'Química Orgánica II', ' ', 3, 'Identifica, compara y analiza las características estructurales, y las propiedades de glúcidos y proteínas para tener una base fundamental de la diversidad de grupos funcionales para comprender el metabolismo celular.', '', '', 1, NULL, NULL, NULL, NULL),
(141, 4, NULL, 'Termonidámica', ' ', 3, 'Aplica los principios y leyes de la termodinámica, para evaluar la energía en un sistema utilizando tablas y diagramas, cuantificando los requerimientos térmicos en diferentes procesos. ', '', '', 1, NULL, NULL, NULL, NULL),
(142, 4, NULL, 'Física', ' ', 3, 'Comprende las leyes que gobiernan los diferentes fenómenos físicos en los que intervienen fuerzas, movimiento, trabajo y energía para aplicar los principios fundamentales de la mecánica clásica en el análisis y la solución de problemas. ', '', '', 1, NULL, NULL, NULL, NULL),
(143, 4, NULL, 'Estadística', ' ', 3, 'Resuelve problemas donde se involucren eventos con incertidumbre, analiza procesos estadísticos para toma de decisiones mediante pruebas de hipótesis y un diseño de experimentos aplicado al tipo de proceso aplicando los modelos analíticos.', '', '', 1, NULL, NULL, NULL, NULL),
(144, 4, NULL, 'Programación y Métodos Numéricos', ' ', 4, 'Aplica los métodos numéricos para la solución de problemas de ingeniería, utilizando la programación como una herramienta que facilita la resolución de problemas complejos.', '', '', 1, NULL, NULL, NULL, NULL),
(145, 4, NULL, 'Electromagnetismo', ' ', 4, 'Aplica los conceptos básicos de las leyes y principios fundamentales del Electromagnetismo para la solución de problemas reales.', '', '', 1, NULL, NULL, NULL, NULL),
(146, 4, NULL, 'Bioquímica', ' ', 4, 'Analiza la estructura, clasificación, función y propiedades de las biomoléculas y comprende las principales rutas del metabolismo celular para su aplicación en el aprovechamiento de recursos bióticos.', '', '', 1, NULL, NULL, NULL, NULL),
(147, 4, NULL, 'Balance de Materia y Energía ', ' ', 4, 'Identifica, analiza y establece balances de materia y energía en sistemas en estado estable para cuantificar el proceso de transformación de la materia y la energía.', '', '', 1, NULL, NULL, NULL, NULL),
(148, 4, NULL, 'Analisís Instrumental', ' ', 4, 'Identifica, comprende, y relaciona los principios de la Química analítica e instrumental para la aplicación y solución de problemas en el análisis químico.', '', '', 1, NULL, NULL, NULL, NULL),
(149, 4, NULL, 'Aseguramiento de la calidad', ' ', 4, 'Aplica e integra las filosofías, las técnicas de aseguramiento y administración de la calidad y las normas nacionales e internacionales para la implementación de sistemas de aseguramiento de calidad total.', '', '', 1, NULL, NULL, NULL, NULL),
(150, 4, NULL, 'Ingeniería Económica', ' ', 5, 'Determina los costos fijos, variables y el costo total unitario de un producto que se genera en un proceso de manufactura para evaluar la factibilidad de venta de este producto. ', '', '', 1, NULL, NULL, NULL, NULL),
(151, 4, NULL, 'Fenómenos de Transporte I', ' ', 5, 'Deduce y resuelve los balances microscópicos de cantidad de movimiento para efectuar el diseño termodinámico de sistemas de transporte de fluidos.', '', '', 1, NULL, NULL, NULL, NULL),
(152, 4, NULL, 'Bioquímica del Nitrógeno y Regulación Genética', ' ', 5, 'Comprende, identifica, analiza y relaciona al metabolismo del nitrógeno y ácidos nucleicos en su composición, función y control.', '', '', 1, NULL, NULL, NULL, NULL),
(153, 4, NULL, 'Fisicoquímica', ' ', 5, 'Aplica los conocimientos físico-químicos que rigen a los diversos equilibrios de fases y fenómenos superficiales que permiten el diseño de procesos de transformación de los recursos naturales.', '', '', 1, NULL, NULL, NULL, NULL),
(154, 4, NULL, 'Desarrollo Sustentable', ' ', 5, 'Aplica una visión sustentable, en los ámbitos social, económico y ambiental que le permitirá evaluar y disminuir el impacto de la sociedad sobre el entorno, tomando en cuenta.', '', '', 1, NULL, NULL, NULL, NULL),
(155, 4, NULL, 'Instrumentación y Control', ' ', 5, 'Selecciona y aplica la instrumentación para el control de procesos químicos o bioquímicos a partir de los requerimientos óptimos de operación.', '', '', 1, NULL, NULL, NULL, NULL),
(156, 4, NULL, 'Operaciones Unitarias I', ' ', 6, 'Aplica los conceptos, principios, métodos y criterios para el diseño, selección, operación y adaptación de equipos industriales utilizados en los procesos de separación mecánica, reducción de tamaño, agitación y mezclado y en el transporte de sólidos.', '', '', 1, NULL, NULL, NULL, NULL),
(157, 4, NULL, 'Fenómenos de Transporte II', ' ', 6, 'Diseña, selecciona, simula y escala equipos y procesos en los que se aprovechen de manera sustentable los recursos bióticos.  ', '', '', 1, NULL, NULL, NULL, NULL),
(158, 4, NULL, 'Microbiología', ' ', 6, 'Aplica los conocimientos relacionados con la organización estructural de los microorganismos, identificando sus características químicas, físicas y metabólicas para su clasificación y manejo, resaltando su importancia en los ecosistemas y la industria.', '', '', 1, NULL, NULL, NULL, NULL),
(159, 4, NULL, 'Higiene y Seguridad', ' ', 6, 'Elabora programas y procedimientos de seguridad e higiene industrial que serán usados en la operación y supervisión de procesos industriales para cumplir con la legislación y normas gubernamentales y propias de la empresa, considerando el contexto social, ambiental y económico.', '', '', 1, NULL, NULL, NULL, NULL),
(160, 4, NULL, 'Cinética Química y Biológica', ' ', 6, 'Aplica los principios de la cinética química y de la catálisis química y enzimática, de la cinética de crecimiento microbiano, de consumo de sustrato y de formación de producto. ', '', '', 1, NULL, NULL, NULL, NULL),
(161, 4, NULL, 'Taller de Investigación I', ' ', 6, 'Elabora un protocolo de investigación en el que presenta soluciones científico - tecnológicas a problemáticas relacionadas con su campo profesional en diversos contextos. ', '', '', 1, NULL, NULL, NULL, NULL),
(162, 4, NULL, 'Taller de Investigación II', ' ', 7, 'Consolida el protocolo para ejecutar la investigación y obtener productos para su exposición, defensa y gestión de su transcendencia.', '', '', 1, NULL, NULL, NULL, NULL),
(163, 4, NULL, 'Operaciones Unitarias III', ' ', 7, 'Diseña, selecciona, opera, adapta e investiga científica y tecnológicamente equipos en procesos industriales que involucren las operaciones unitarias de transferencia de masa y energía de humidificación, secado, extracción y destilación.', '', '', 1, NULL, NULL, NULL, NULL),
(164, 4, NULL, 'Operaciones Unitarias II', ' ', 7, 'Diseña y selecciona equipos que involucran la transferencia de masa en los procesos de estudio de esta materia, es decir, absorción y adsorción. ', '', '', 1, NULL, NULL, NULL, NULL),
(165, 4, NULL, 'Ingeniería de Biorreactores', ' ', 7, 'Diseña, selecciona, adapta y opera los biorreactores industriales y equipos auxiliares utilizados en los procesos de producción celular o tisular y enzimática, aplicando los conceptos, principios, métodos y criterios técnicos científicos del área.', '', '', 1, NULL, NULL, NULL, NULL),
(166, 4, NULL, 'Ingeniería de Proyectos', ' ', 8, 'Diseña proyectos para la instalación de plantas industriales de procesos de transformación que satisfagan las necesidades sociales en un marco sustentable; aplicando las diversas competencias de la Ingeniería Bioquímica adquiridas a lo largo de su formación profesional', '', '', 1, NULL, NULL, NULL, NULL),
(167, 4, NULL, 'Ingeniería y Gestión Ambiental', ' ', 8, 'Aplica los fundamentos para la evaluación y selección de los tratamientos adecuados para la prevención y control de la contaminación ambiental de agua, aire y suelo y aplica los métodos para la evaluación del impacto ambiental, considerando la legislación vigente correspondiente.', '', '', 1, NULL, NULL, NULL, NULL),
(168, 4, NULL, 'Ingeniería de Procesos', ' ', 8, 'Modela, simula y optimiza equipos y procesos, para que, interactuando de manera interdisciplinaria y multidisciplinaria, desarrolle, transfiera y adapte tecnologías apropiadas para el aprovechamiento de los recursos bióticos.', '', '', 1, NULL, NULL, NULL, NULL),
(169, 4, NULL, 'Formulación y Evaluación de Proyectos', ' ', 9, 'Definir la factibilidad y sustentabilidad de proyectos, mediante la integración de conocimientos de las áreas de producción, diseño, administración, mercadotecnia y finanzas; con el fin de emprender y desarrollar proyectos productivos aplicables a la industria. ', '', '', 1, NULL, NULL, NULL, NULL),
(170, 4, 4, 'Artes y humanidades para ingeniería ', ' ', 0, 'Conoce, reconoce e identifica las 7 bellas artes mayores y 2 menores por medio de la presentación de dichas artes alrededor del mundo y sus principales expositores.', '', '', 1, NULL, NULL, NULL, NULL),
(171, 4, 4, 'Ingeniería y Sociedad ', ' ', 0, 'Reconoce y comprende la relación entre pobreza y modos-políticas socio-económicos, extendiendo el análisis hacia el objetivo No. 1 de la Agenda 2030 para el Desarrollo Sostenible, de la Organización de las Naciones Unidas ONU.', '', '', 1, NULL, NULL, NULL, NULL),
(172, 4, 4, 'Simulación de procesos ', ' ', 0, 'Al finalizar este curso el estudiante será capaz de aplicar la simulación de procesos y con ello dar solución a problemas reales a través del desarrollo de programas para simular un equipo de proceso.', '', '', 1, NULL, NULL, NULL, NULL),
(173, 4, 4, 'Ingeniería de Servicios Auxiliares ', ' ', 0, 'El alumno deberá ser capaz de diseñar su propia planta e identificar todo lo necesario para la construcción y operación de la mismo.', '', '', 1, NULL, NULL, NULL, NULL),
(174, 4, 4, 'Diseño de Bioprocesos ', ' ', 0, 'Desarrolla la capacidad de una visión holística e integrada de un diseño de proceso, desde la biología a través del bioproceso y finalmente a aspectos vinculados con los negocios” y con el desarrollo sostenible.', '', '', 1, NULL, NULL, NULL, NULL),
(175, 4, 4, 'Innovación en procesos de tecnología de alimentos ', ' ', 0, 'Reconocer, identificar y aplicar los principios de la Fisicoquímica relacionados con las innovaciones en la Bioingeniería de los alimentos.', '', '', 1, NULL, NULL, NULL, NULL),
(176, 4, 4, 'Taller de ingeniería de alimentos ', ' ', 0, 'Conocer y aplicar los conocimientos históricos e innovadores de la deshidratación y secado en alimentos conservando sus propiedades funcionales y organolépticas.', '', '', 1, NULL, NULL, NULL, NULL),
(177, 4, 5, 'Artes y humanidades para ingeniería ', ' ', 0, 'Conoce, reconoce e identifica las 7 bellas artes mayores y 2 menores por medio de la presentación de dichas artes alrededor del mundo y sus principales expositores.', '', '', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_materia` (`materiaId`, `carreraId`, `especialidadId`, `nombre`, `area`, `semestre`, `competencia`, `urlVideo`, `urlPrograma`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(178, 4, 5, 'Ingeniería y Sociedad ', ' ', 0, 'Reconoce y comprende la relación entre pobreza y modos-políticas socio-económicos, extendiendo el análisis hacia el objetivo No. 1 de la Agenda 2030 para el Desarrollo Sostenible, de la Organización de las Naciones Unidas ONU.', '', '', 1, NULL, NULL, NULL, NULL),
(179, 4, 5, 'Simulación de procesos ', ' ', 0, 'Al finalizar este curso el estudiante será capaz de aplicar la simulación de procesos y con ello dar solución a problemas reales a través del desarrollo de programas para simular un equipo de proceso.', '', '', 1, NULL, NULL, NULL, NULL),
(180, 4, 5, 'Ingeniería de Servicios Auxiliares ', ' ', 0, 'El alumno deberá ser capaz de diseñar su propia planta e identificar todo lo necesario para la construcción y operación de la misma.', '', '', 1, NULL, NULL, NULL, NULL),
(181, 4, 5, 'Diseño de Bioprocesos ', ' ', 0, 'Desarrolla la capacidad de una visión holística e integrada de un diseño de proceso, desde la biología a través del bioproceso y finalmente a aspectos vinculados con los negocios” y con el desarrollo sostenible.', '', '', 1, NULL, NULL, NULL, NULL),
(182, 4, 5, 'Taller de bioenergías ', ' ', 0, 'Reconoce y comprende la relación entre los flujos de energía de la biósfera con los diseños en Ingeniería por medio de la presentación de un estudio de caso en Seminario.', '', '', 1, NULL, NULL, NULL, NULL),
(183, 4, 5, 'Ingeniería de diseño de sistemas ambientales ', ' ', 0, 'Identifica, reconoce y comprende los procesos de remediación, identifica, conoce y aplica los sistemas de control integral de la calidad del aire, identifica y diseña los reactores de sustrato sólido, distingue, selecciona, caracteriza y diseña la gestión de agua pertinente.', '', '', 1, NULL, NULL, NULL, NULL),
(184, 4, 6, 'Artes y humanidades para ingeniería ', ' ', 0, 'Conoce, reconoce e identifica las 7 bellas artes mayores y 2 menores por medio de la presentación de dichas artes alrededor del mundo y sus principales expositores.', '', '', 1, NULL, NULL, NULL, NULL),
(185, 4, 6, 'Ingeniería y Sociedad ', ' ', 0, 'Reconoce y comprende la relación entre pobreza y modos-políticas socio-económicos, extendiendo el análisis hacia el objetivo No. 1 de la Agenda 2030 para el Desarrollo Sostenible, de la Organización de las Naciones Unidas ONU.', '', '', 1, NULL, NULL, NULL, NULL),
(186, 4, 6, 'Simulación de procesos ', ' ', 0, 'Al finalizar este curso el estudiante será capaz de aplicar la simulación de procesos y con ello dar solución a problemas reales a través del desarrollo de programas para simular un equipo de proceso.', '', '', 1, NULL, NULL, NULL, NULL),
(187, 4, 6, 'Ingeniería de Servicios Auxiliares ', ' ', 0, 'El alumno deberá ser capaz de diseñar su propia planta e identificar todo lo necesario para la construcción y operación de la misma.', '', '', 1, NULL, NULL, NULL, NULL),
(188, 4, 6, 'Diseño de Bioprocesos ', ' ', 0, 'Desarrolla la capacidad de una visión holística e integrada de un diseño de proceso, desde la biología a través del bioproceso y finalmente a aspectos vinculados con los negocios” y con el desarrollo sostenible.', '', '', 1, NULL, NULL, NULL, NULL),
(189, 4, 6, 'Biocatalisis en la industria farmacéutica ', ' ', 0, 'Reconoce y comprende la integración de conocimientos de ciencias básicas y de bioingeniería en la aplicación de la biocatálisis en la industria química, y en un entorno específico identifica sus ventajas de especificidad, reducción de etapas y de contaminación.', '', '', 1, NULL, NULL, NULL, NULL),
(190, 4, 6, 'Proteínas terapéuticas ', ' ', 0, 'Distingue los diversos tipos y campos de aplicación de las proteínas terapéuticas y su impacto biotecnológico.', '', '', 1, NULL, NULL, NULL, NULL),
(191, 8, NULL, 'Química ', '1', 1, 'Aplica conocimientos, teorías, conceptos y procedimientos básicos de química en la comprensión de los fenómenos involucrados para su aplicación en la generación de energía proveniente de fuentes renovables.', '', '', 1, NULL, NULL, NULL, NULL),
(192, 8, NULL, 'Programación', '1', 1, 'Implementa mediante el uso de estructuras de control, bibliotecas, funciones, arreglos y archivos programas que permitan una solución rápida a problemas donde intervienen los sistemas renovables de energía.', '', '', 1, NULL, NULL, NULL, NULL),
(193, 8, NULL, 'Cálculo Diferencial', '1', 1, 'Plantea y resuelve problemas utilizando las definiciones de límite y derivada de funciones de una variable para la elaboración de modelos matemáticos aplicados.', '', '', 1, NULL, NULL, NULL, NULL),
(194, 8, NULL, 'Fundamentos de Investigación', '1', 0, 'Aplica los elementos de la investigación documental para elaborar escritos académicos de su entorno profesional. ', '', '', 1, NULL, NULL, NULL, NULL),
(195, 8, NULL, 'Dibujo', '1', 1, 'Aplica las herramientas del CAD en la realización de planos necesarios, para la elaboración de sistemas y dispositivos relacionados con la utilización de fuentes renovables de energía. ', '', '', 1, NULL, NULL, NULL, NULL),
(196, 8, NULL, 'Fuentes Renovables de Energía', '1', 1, 'Analiza los diferentes tipos de energías provenientes de fuentes renovables con la finalidad de identificar que recurso utilizar en un sitio determinado', '', '', 1, NULL, NULL, NULL, NULL),
(197, 8, NULL, 'Bioquímica ', '2', 2, 'Analiza las teorías, conceptos y procedimientos básicos de bioquímica que le permiten comprender los procesos involucrados en el metabolismo microbiano', '', '', 1, NULL, NULL, NULL, NULL),
(198, 8, NULL, 'Electromagnetismo', '2', 2, 'Aplica los conceptos básicos de las leyes y principios fundamentales del Electromagnetismo para la solución de problemas reales.', '', '', 1, NULL, NULL, NULL, NULL),
(199, 8, NULL, 'Álgebra Lineal ', '2', 2, 'Resuelve problemas de modelos lineales aplicados en ingeniería para la toma de decisiones de acuerdo a la interpretación de resultados utilizando matrices y sistemas de ecuaciones', '', '', 1, NULL, NULL, NULL, NULL),
(200, 8, NULL, 'Cálculo Integral ', '2', 2, 'Aplica la definición de integral y las técnicas de integración para resolver problemas de ingeniería.', '', '', 1, NULL, NULL, NULL, NULL),
(201, 8, NULL, 'Taller de Ética', '2', 2, 'Desarrolla conciencia sobre el significado y sentido de la Ética para orientar su comportamiento en el contexto social y profesional', '', '', 1, NULL, NULL, NULL, NULL),
(202, 8, NULL, 'Estadística y Diseño de Experimentos', '2', 2, 'Aplica herramientas estadísticas para el análisis de datos experimentales obtenidos durante pruebas o procesos de sistemas de energía renovable. ', '', '', 1, NULL, NULL, NULL, NULL),
(203, 8, NULL, 'Microbiología', '3', 3, 'Analiza el papel que desempeñan los microorganismos en su entorno y en la generación de productos para que sean utilizados en la producción de fuentes de energía renovables. ', '', '', 1, NULL, NULL, NULL, NULL),
(204, 8, NULL, 'Taller de Sistemas de Información Geográfica', '3', 3, 'Interpreta la cartografía y emplea tecnologías de posicionamiento para ubicar los sitios potenciales para la obtención y generación de energía proveniente de fuentes renovables. ', '', '', 1, NULL, NULL, NULL, NULL),
(205, 8, NULL, 'Tecnología e Ingeniería de Materiales', '3', 3, 'Selecciona el material que por su comportamiento mecánico, resistencia a la corrosión y costo, sea el adecuado para una aplicación determinada y así mismo identifica el método para mejorar la resistencia y el ensayo mecánico correspondiente.', '', '', 1, NULL, NULL, NULL, NULL),
(206, 8, NULL, 'Estática y Dinámica ', '3', 3, 'Aplica los conceptos básicos, leyes y principios fundamentales de la estática y la dinámica para solución de problemas, mediante el análisis de los fenómenos físicos relacionados con la mecánica que se presenten en el ámbito profesional. ', '', '', 1, NULL, NULL, NULL, NULL),
(207, 8, NULL, 'Cálculo Vectorial', '3', 3, 'Aplica los principios y técnicas básicas del cálculo vectorial para resolver problemas de ingeniería del entorno', '', '', 1, NULL, NULL, NULL, NULL),
(208, 8, NULL, 'Metrología Mecánica y Eléctrica', '3', 3, 'Utiliza los instrumentos de medición y prueba para la medición e interpretación de variables eléctricas en componentes y circuitos eléctricos.', '', '', 1, NULL, NULL, NULL, NULL),
(209, 8, NULL, 'Resistencia de Materiales', '4', 4, 'Aplica los conceptos de esfuerzos de deformación, normales, cortantes y apoyo para la resolución de problemas de ingeniería en los cuáles los elementos de estudio se encuentren sometidos a distribuciones de carga. ', '', '', 1, NULL, NULL, NULL, NULL),
(210, 8, NULL, 'Termodinámica ', '4', 4, 'Interpreta y aplica los conceptos básicos y las leyes de la termodinámica para seleccionar y evaluar sistemas y equipos térmicos relacionados con la ingeniería en energías renovables', '', '', 1, NULL, NULL, NULL, NULL),
(211, 8, NULL, 'Comportamiento Humano en las Organizaciones ', '4', 4, 'Analiza de forma sistémica, crítica y propositiva los diversos aspectos del comportamiento humano en las organizaciones, identificando áreas de oportunidad que le permitan plantear la solución de problemasy toma de decisiones informadas, con sentido ético. ', '', '', 1, NULL, NULL, NULL, NULL),
(212, 8, NULL, 'Óptica y Semiconductores ', '4', 4, 'Aplica la geometría y conceptos de óptico para diseñar colectores planos, de canal compuesto, parabólico y de concentración solar. ', '', '', 1, NULL, NULL, NULL, NULL),
(213, 8, NULL, 'Ecuaciones Diferenciales ', '4', 4, 'Aplica los métodos de solución de ecuaciones diferenciales ordinarias para resolver problemas que involucran sistemas dinámicos que se presentan en la ingeniería. ', '', '', 1, NULL, NULL, NULL, NULL),
(214, 8, NULL, 'Circuitos Eléctricos I ', '4', 4, 'Analiza y diseña circuitos eléctricos para entender el funcionamiento de los dispositivos electrónicos', '', '', 1, NULL, NULL, NULL, NULL),
(215, 8, NULL, 'Biocombustibles', '5', 5, 'Comprende los procesos de conversión (cos, físicos y biológicos) presentes en la transformación de la biomasa para la obtención de biocombustibles.', '', '', 1, NULL, NULL, NULL, NULL),
(216, 8, NULL, 'Marco Jurídico en Gestión Energética ', '5', 5, 'Interpreta y aplica la normatividad y legislación de la política energética, administrativa y jurídica aplicable en materia de recursos energéticos renovables y no renovables, para el desarrollo de proyectos de ingeniería. ', '', '', 1, NULL, NULL, NULL, NULL),
(217, 8, NULL, 'Desarrollo Sustentable ', '5', 5, 'Aplica una visión sustentable, en los ámbitos social, económico y ambiental que le \npermitirá evaluar y disminuir el impacto de la sociedad sobre el entorno, tomando en cuenta estrategias y considerando profesionalmente los valores ambientales.', '', '', 1, NULL, NULL, NULL, NULL),
(218, 8, NULL, 'Mecánica de Fluidos ', '5', 5, 'Aplica los principios de la mecánica de fluidos para planteamiento y resolución de problemas prácticos, relacionados con el transporte de fluidos en sistemas de fuentes renovables de energía, con el auxilio de herramientas computacionales', '', '', 1, NULL, NULL, NULL, NULL),
(219, 8, NULL, 'Transferencia de Calor', '5', 5, 'Aplica, interpreta y evalúa las leyes de transferencia de calor para analizar sistemas de energías renovables donde los mecanismos de transferencia de calor son necesarios para mejorar el diseño y funcionamiento de éstos. ', '', '', 1, NULL, NULL, NULL, NULL),
(220, 8, NULL, 'Circuitos Eléctricos II ', '5', 5, 'Aplica los conceptos y leyes fundamentales que se emplean en el análisis en estado permanente de circuitos eléctricos excitados con corriente alterna', '', '', 1, NULL, NULL, NULL, NULL),
(221, 8, NULL, 'Taller de Investigación I', '6', 6, 'Elabora un protocolo de investigación en el que presenta soluciones científico - tecnológicas a problemáticas relacionadas con su campo profesional en diversos contextos. ', '', '', 1, NULL, NULL, NULL, NULL),
(222, 8, NULL, 'Máquinas Eléctricas', '6', 6, 'Analiza el funcionamiento de las diferentes máquinas eléctricas, y selecciona la máquina apropiada para el suministro de una carga específica. ', '', '', 1, NULL, NULL, NULL, NULL),
(223, 8, NULL, 'Máquinas Hidráulicas ', '6', 6, 'Diseña, instala, evalúa y mantiene sistemas hidráulicos para solucionar problemas productivos y de servicios tecnológicos mediante la adecuada selección uso de equipos y materiales', '', '', 1, NULL, NULL, NULL, NULL),
(224, 8, NULL, 'Refrigeración y Aire Acondicionado', '6', 6, 'Diseña, evalúa y mantiene sistemas de aire acondicionado y refrigeración, relacionados con los sistemas renovables de energías, utilizando software para programar mantenimientos correctivos y preventivos', '', '', 1, NULL, NULL, NULL, NULL),
(225, 8, NULL, 'Instalaciones Eléctricas e Iluminación ', '6', 6, 'Elabora proyectos de instalaciones eléctricas de baja tensión y de iluminación para usos generales de aplicación industrial y de servicios públicos, de acuerdo a la normatividad vigente', '', '', 1, NULL, NULL, NULL, NULL),
(226, 8, NULL, 'Sistemas Térmicos ', '6', 6, 'Selecciona, instala, opera las diferentes máquinas y equipos térmicos utilizados en la industria para incrementar la eficiencia energética de los mismos solucionando consumos excesivos de energía', '', '', 1, NULL, NULL, NULL, NULL),
(227, 8, NULL, 'Sistemas Solares Fotovoltaicos y Térmicos', '7', 7, 'Diseña, construye, instala, mantiene, dimensiona y opera sistemas solares fotovoltaicos y térmicos eficientes para aplicaciones específicas', '', '', 1, NULL, NULL, NULL, NULL),
(228, 8, NULL, 'Simulación de Sistemas de Energías Renovables ', '7', 7, 'Construye y analiza los modelos de simulación para su aplicación en dispositivos y procesos que permitan la optimización de los sistemas de energía renovable ', '', '', 1, NULL, NULL, NULL, NULL),
(229, 8, NULL, 'Instrumentación ', '7', 7, 'Selecciona, aplica, calibra y opera los instrumentos de medición y control para automatizar los procesos industriales, mediante la configuración y programación adecuada de los mismos.', '', '', 1, NULL, NULL, NULL, NULL),
(230, 8, NULL, 'Energía Eólica ', '7', 7, 'Diseña, evalúa e implementa sistemas de generación eólica aprovechando la energía proveniente del viento para la obtención de energía eléctrica. ', '', '', 1, NULL, NULL, NULL, NULL),
(231, 8, NULL, 'Taller de Investigación II', '7', 7, 'Consolida el protocolo para ejecutar la investigación y obtener productos para su exposición, defensa y gestión de su transcendencia. ', '', '', 1, NULL, NULL, NULL, NULL),
(232, 8, NULL, 'Formulación y Evaluación de Proyectos de Energías Renovables', '8', 8, 'Demuestra la factibilidad y sustentabilidad de proyectos relacionados con las fuentes renovables de energía', '', '', 1, NULL, NULL, NULL, NULL),
(233, 8, NULL, 'Administración y Técnicas de Conservación ', '8', 8, 'Aplica técnicas para administrar planes y programas de conservación de equipos e instalaciones con el objeto de evitar paros no planeados en la producción de energía y para maximizar el tiempo de vida útil de los componentes que conforman un sistema de energías renovables', '', '', 1, NULL, NULL, NULL, NULL),
(234, 8, NULL, 'Auditoría Energética', '8', 8, 'Aplicar las normas vigentes de Ahorro de Energía en los sectores industriales y de servicios para promover el uso eficiente de la energía y el desarrollo sustentable. ', '', '', 1, NULL, NULL, NULL, NULL),
(235, 8, NULL, 'Gestión de Empresas de Energías Renovables', '8', 8, 'Analiza los elementos que integran la empresa particularmente relacionada con las energías renovables', '', '', 1, NULL, NULL, NULL, NULL),
(236, 1, NULL, 'Fundamentos de Investigación', '', 1, 'Aplica los elementos de la investigación documental para elaborar escritos académicos de su entorno profesional. ', '', '', 1, NULL, NULL, NULL, NULL),
(237, 1, NULL, 'Cálculo Diferencial', '', 1, 'Plantea y resuelve problemas utilizando las definiciones de límite y derivada de funciones de una variable para la elaboración de modelos matemáticos aplicados', '', '', 1, NULL, NULL, NULL, NULL),
(238, 1, NULL, 'Desarrollo Humano', '', 1, 'de una variable para la elaboración de modelos matemáticos aplicados', '', '', 1, NULL, NULL, NULL, NULL),
(239, 1, NULL, 'Fundamentos de Gestión Empresarial', '', 1, 'Descubre sus potencialidades para propiciar su desarrollo personal y la mejora de su calidad de vida, a través del autoconocimiento.', '', '', 1, NULL, NULL, NULL, NULL),
(240, 1, NULL, 'Fundamentos de Física', '', 1, 'Adquirir una visión general del desarrollo histórico de la física desde un punto de vista crítico y analítico, así como desarrollar la creatividad realizando prototipos didácticos que representen fenómenos físicos.', '', '', 1, NULL, NULL, NULL, NULL),
(241, 1, NULL, 'Fundamentos de Química', '', 1, 'Adquiere conocimientos básicos propios de la química para establecer programas de seguridad e higiene.', '', '', 1, NULL, NULL, NULL, NULL),
(242, 1, NULL, 'Software de Aplicación Ejecutivo', '', 2, 'Aplica las nuevas tecnologías de información en las organizaciones para optimizar los procesos de comunicación y procesamiento de información y hacer eficiente la toma de decisiones.', '', '', 1, NULL, NULL, NULL, NULL),
(243, 1, NULL, 'Cálculo Integral', '', 2, 'Aplica la definición de integral y las técnicas de integración para resolver problemas de ingeniería.', '', '', 1, NULL, NULL, NULL, NULL),
(244, 1, NULL, 'Contabilidad Orientada a los Negocios', '', 2, 'Formular Estados Financieros básicos utilizando normas y procedimientos, comprendiendo la importancia del proceso contable en los negocios.', '', '', 1, NULL, NULL, NULL, NULL),
(245, 1, NULL, 'Dinámica Social', '', 2, 'Construye un modelo sociológico para comprender la problemática de las organizaciones y proponer soluciones.', '', '', 1, NULL, NULL, NULL, NULL),
(246, 1, NULL, 'Taller de Ética', '', 2, 'Desarrolla conciencia sobre el significado y sentido de la Ética para orientar su comportamiento en el contexto social y profesional.', '', '', 1, NULL, NULL, NULL, NULL),
(247, 1, NULL, 'Legislación Laboral', '', 2, 'Aplica la legislación laboral en las relaciones obrero-patronal para mantener la armonía entre el capital y el trabajo.', '', '', 1, NULL, NULL, NULL, NULL),
(248, 1, NULL, 'Marco Legal de las Organizaciones', '', 3, 'Diseña, evalúa y emprende nuevos negocios y proyectos empresariales, en un mercado competitivo y globalizado, con una perspectiva legal. ', '', '', 1, NULL, NULL, NULL, NULL),
(249, 1, NULL, 'Probabilidad y Estadística Descriptiva', '', 3, 'Realiza el proceso de recopilación, presentación y análisis de información económica-administrativa, para interpretar estadísticas y parámetros en muestras y poblaciones utilizando métodos de cálculo y software estadístico para la toma de decisiones.', '', '', 1, NULL, NULL, NULL, NULL),
(250, 1, NULL, 'Costos Empresariales', '', 3, 'Aplica la información generada por la contabilidad de los costos empresariales en la gestión de los procesos relacionados con los costos de adquisición, producción, distribución, administración y financiamiento, para el desarrollo de las funciones de planeación.', '', '', 1, NULL, NULL, NULL, NULL),
(251, 1, NULL, 'Habilidades Directivas I', '', 3, 'Desarrolla habilidades directivas con el fin de resolver situaciones en el ámbito social y laboral', '', '', 1, NULL, NULL, NULL, NULL),
(252, 1, NULL, 'Economía Empresarial', '', 3, 'Aplica herramientas de análisis y diagnóstico económico empresarial que le permiten la toma de decisiones estratégicas logrando la ventaja competitiva de la organización.', '', '', 1, NULL, NULL, NULL, NULL),
(253, 1, NULL, 'Álgebra Lineal', '', 3, 'Analiza las propiedades de los espacios vectoriales y las transformaciones lineales para vincularlos con otras ramas de las matemáticas y otras disciplinas. ', '', '', 1, NULL, NULL, NULL, NULL),
(254, 1, NULL, 'Ingeniería Económica', '', 4, 'Aplica el valor del dinero a través del tiempo en las inversiones, para detectar oportunidades de mejora e inversión en un mundo global que refleje en la rentabilidad del negocio.', '', '', 1, NULL, NULL, NULL, NULL),
(255, 1, NULL, 'Estadística Inferencial I', '', 4, 'Aplica los conceptos de la teoría de la probabilidad y estadística para organizar, clasificar, analizar e interpretar datos para la toma decisiones en aplicaciones de gestión empresarial.', '', '', 1, NULL, NULL, NULL, NULL),
(256, 1, NULL, 'Instrumentos de Presupuestación Empresarial', '', 4, 'Elaborar presupuestos como instrumentos para que sirvan de herramienta en la planeación y control de recursos, diseñando diversos escenarios que faciliten la toma de decisiones. ', '', '', 1, NULL, NULL, NULL, NULL),
(257, 1, NULL, 'Habilidades Directivas II', '', 4, 'Aplica y propone diferentes habilidades directivas para la toma de decisiones efectiva, así como el manejo facultamiento, delegación, comunicación afectiva y toma de decisiones con la finalidad de resolver situaciones reales en la vida cotidiana y profesional proponiendo soluciones efectivas. ', '', '', 1, NULL, NULL, NULL, NULL),
(258, 1, NULL, 'Entorno Macroeconómico', '', 4, 'Aplica indicadores macroeconómicos como herramientas para comprender el comportamiento del entorno socioeconómico y su influencia en la toma de decisiones de las empresas.', '', '', 1, NULL, NULL, NULL, NULL),
(259, 1, NULL, 'Investigación de Operaciones', '', 4, 'Identifica y aplica las diferentes teorías y técnicas de la investigación de operaciones, en la solución de problemas relacionados con su profesión, en cuanto a una toma de decisiones adecuada y fundada en el método científico en la administración.', '', '', 1, NULL, NULL, NULL, NULL),
(260, 1, NULL, 'Finanzas en las Organizaciones', '', 5, 'Analiza, interpretar y diagnostica la información financiera de organizaciones para la toma de decisiones.', '', '', 1, NULL, NULL, NULL, NULL),
(261, 1, NULL, 'Estadística Inferencial II', '', 5, 'Utiliza las herramientas necesarias para establecer relaciones lineales entre dos o más variables explicatorias y las dependientes, así como la aplicación del diseño de experimentos industriales e identificación de las variables.', '', '', 1, NULL, NULL, NULL, NULL),
(262, 1, NULL, 'Ingeniería de Procesos', '', 5, 'Aplica los elementos de la ingeniería de procesos, favoreciendo la productividad en un ambiente organizacional, con una orientación sistémica y sustentable para la toma de decisiones en forma efectiva.', '', '', 1, NULL, NULL, NULL, NULL),
(263, 1, NULL, 'Gestión del Capital Humano', '', 5, 'Integrar la gestión del capital humano con las estrategias de la organización, permitiendo incrementar la productividad y competitividad de las mismas.', '', '', 1, NULL, NULL, NULL, NULL),
(264, 1, NULL, 'Taller de Investigación I', '', 5, 'Elabora un protocolo de investigación en el que presenta soluciones científico - tecnológicas a problemáticas relacionadas con su campo profesional en diversos contextos.', '', '', 1, NULL, NULL, NULL, NULL),
(265, 1, NULL, 'Mercadotecnia', '', 5, 'Diseña estrategias de mercadotecnia para posicionar un producto en el mercado, considerando las oportunidades y amenazas. ', '', '', 1, NULL, NULL, NULL, NULL),
(266, 1, NULL, 'Administración de la Salud y Seguridad Ocupacional', '', 6, 'Gestiona el desarrollo de programas de salud y seguridad en los centros de trabajo, para sensibilizar al estudiante en valorar las condiciones laborales a fin de asegurar que éstas favorezcan la productividad en un ambiente organizacional. ', '', '', 1, NULL, NULL, NULL, NULL),
(267, 1, NULL, 'El Emprendedor y la Innovación', '', 6, 'Desarrolla la capacidad creativa y el espíritu empresarial, la elaboración de un portafolio de ideas emprendedoras, respetando la ética en el ámbito personal y profesional, para llevar a cabo un óptimo desempeño en la realización de las habilidades emprendedoras.', '', '', 1, NULL, NULL, NULL, NULL),
(268, 1, NULL, 'Gestión de la Producción I', '', 6, 'Aplica conceptos, variables operativas, técnicas y herramientas de los procesos de producción en la optimización de los recursos de las organizaciones, mediante modelos cualitativos y cuantitativos para mejorar la productividad y competitividad organizacional.', '', '', 1, NULL, NULL, NULL, NULL),
(269, 1, NULL, 'Diseño Organizacional', '', 6, 'Diseña estructuras organizacionales considerando las características propias de cada organización para su correcto funcionamiento. ', '', '', 1, NULL, NULL, NULL, NULL),
(270, 1, NULL, 'Taller de Investigación II', '', 6, 'Consolida el protocolo para ejecutar la investigación y obtener productos para su exposición, defensa y gestión de su transcendencia.', '', '', 1, NULL, NULL, NULL, NULL),
(271, 1, NULL, 'Sistemas de Información de Mercadotecnia', '', 6, 'Desarrolla la capacidad de análisis para evaluar el significado de la información obtenida a través de un sistema de Información de Mercados para la oportuna y eficaz toma de decisiones. ', '', '', 1, NULL, NULL, NULL, NULL),
(272, 1, NULL, 'Calidad Aplicada a la Gestión Empresarial', '', 7, 'Aplica métodos estadísticos, técnicas de muestreo y las normas de un sistema de calidad, para evaluar, controlar y optimizar los procesos aplicando la mejora continua.', '', '', 1, NULL, NULL, NULL, NULL),
(273, 1, NULL, 'Plan de Negocios', '', 7, 'Elabora el plan de negocios para operar una empresa y/u obtener financiamiento, considerando los normatividad y reglas de operación vigentes.', '', '', 1, NULL, NULL, NULL, NULL),
(274, 1, NULL, 'Gestión de la Producción II', '', 7, 'Elabora los planes de producción para controlar su ejecución, de acuerdo a lo programado, en las instalaciones, recursos y procesos, y diseña políticas para las operaciones de las empresas.', '', '', 1, NULL, NULL, NULL, NULL),
(275, 1, NULL, 'Gestión Estratégica', '', 7, 'Desarrolla estrategias empresariales considerando criterios de sustentabilidad, para obtener ventajas competitivas sostenibles en un entorno cambiante y globalizado.', '', '', 1, NULL, NULL, NULL, NULL),
(276, 1, NULL, 'Desarrollo Sustentable', '', 7, 'Aplica una visión sustentable, en los ámbitos social, económico y ambiental que le permitirá evaluar y disminuir el impacto de la sociedad sobre el entorno, tomando en cuenta estrategias y considerando profesionalmente los valores ambientales.', '', '', 1, NULL, NULL, NULL, NULL),
(277, 1, NULL, 'Mercadotecnia Electrónica', '', 7, 'Conoce y desarrolla habilidades en el uso de tecnologías de negocios digitales que apoyen las decisiones mercadológicas para colocar productos o servicios en los mercados electrónicos con el fin de posicionar una marca.', '', '', 1, NULL, NULL, NULL, NULL),
(278, 1, NULL, 'Cadena de Suministros', '', 8, 'Gestiona y mejora sistemas integrados de producción, abastecimiento y distribución de organizaciones productoras de bienes y servicios para incrementar la competitividad de la cadena de suministro. ', '', '', 1, NULL, NULL, NULL, NULL),
(279, 1, 7, 'Tecnologías de Negocios Electrónicos', '', 8, 'Aplica las tecnologías de información en las organizaciones para optimizar los procesos de comunicación y procesamiento de información y hacer eficiente la toma de decisiones.', '', '', 1, NULL, NULL, NULL, NULL),
(280, 1, 7, 'Sistemas de Gestión de la Calidad', '', 8, 'Integrar los conocimientos requeridos en una organización, para gestionar y dirigir sistemas de gestión de calidad que permitan mejorar la eficacia y eficiencia tanto de sus procesos.', '', '', 1, NULL, NULL, NULL, NULL),
(281, 1, 7, 'Administración de la Productividad', '', 8, 'Aplica técnicas para la medición, el análisis, el mejoramiento y la administración de la productividad en una organización con la finalidad de aumentar su rentabilidad. ', '', '', 1, NULL, NULL, NULL, NULL),
(282, 1, 7, 'Cultura de la Calidad', '', 8, 'Analizar la importancia del desarrollo de una cultura de calidad en las organizaciones y la calidad de vida en las personas.', '', '', 1, NULL, NULL, NULL, NULL),
(283, 1, 7, 'Medición de la Competitividad y Sustentabilidad', '', 9, 'Identificar aquellos procesos críticos y estratégicos que influyan en la competitividad y sustentabilidad de una empresa u organización y será capaz de elaborar propuestas que lleven a una solución que integre los diferentes recursos físicos.', '', '', 1, NULL, NULL, NULL, NULL),
(284, 1, 7, 'Control Estadístico de la Calidad', '', 9, 'Diseñar e Implantar el Control estadístico de Calidad en procesos para alcanzar la mejora continua', '', '', 1, NULL, NULL, NULL, NULL),
(285, 1, 8, 'Tecnologías de Negocios Electrónicos', '', 8, 'Aplica las tecnologías de información en las organizaciones para optimizar los procesos de comunicación y procesamiento de información y hacer eficiente la toma de decisiones.', '', '', 1, NULL, NULL, NULL, NULL),
(286, 1, 8, 'Tratados Internacionales', '', 8, 'Evalúa las funciones de los organismos internacionales para identificar como influyen en el comercio internacional.', '', '', 1, NULL, NULL, NULL, NULL),
(287, 1, 8, 'Estrategia de Negocios Globales', '', 8, 'Desarrolla habilidades de pensamiento estratégico y marketing orientadas a solucionar problemáticas de negocios globales y a detectar oportunidades de negocio en el extranjero.', '', '', 1, NULL, NULL, NULL, NULL),
(288, 1, 8, 'Administración Financiera Internacional', '', 8, 'Conoce la estructura del Sistema Financiero Internacional y los mercados en que operan las organizaciones Internacionales.', '', '', 1, NULL, NULL, NULL, NULL),
(289, 1, 8, 'Gestión Portuaria', '', 9, 'Desarrollar habilidades básicas y fundamentales relacionadas con la Gestión Portuaria fundamentados en el Legislación que rige el Comercio Exterior.', '', '', 1, NULL, NULL, NULL, NULL),
(290, 1, 8, 'Plan de Negocios Internacionales', '', 9, 'Desarrolla habilidades de pensamiento estratégico y crítico de organización, marketing, producción, económico-financiero orientadas a desarrollar planes de negocios internacionales.', '', '', 1, NULL, NULL, NULL, NULL),
(291, 2, NULL, 'Teoría General de la Administración', '', 1, 'Identificar y enunciar los fundamentos generales de la administración que abarcan los distintos enfoques del pensamiento administrativo; la empresa, su clasificación y las tendencias globales, así como las competencias profesionales del administrador. ', '', '', 1, NULL, NULL, NULL, NULL),
(292, 2, NULL, 'Informática para la Administración', '', 1, 'Desarrolla y utiliza las herramientas de las nuevas tecnologías de la información, que le permitan optimizar los procesos de comunicación y desarrollo en las organizaciones.', '', '', 1, NULL, NULL, NULL, NULL),
(293, 2, NULL, 'Taller de Ética', '', 1, 'Desarrolla conciencia sobre el significado y sentido de la Ética para orientar su comportamiento en el contexto social y profesional. ', '', '', 1, NULL, NULL, NULL, NULL),
(294, 2, NULL, 'Fundamentos de Investigación', '', 1, 'Aplica los elementos de la investigación documental para elaborar escritos académicos de su entorno profesional.', '', '', 1, NULL, NULL, NULL, NULL),
(295, 2, NULL, 'Matemáticas Aplicadas a la Administración', '', 1, 'Analiza y aplica los criterios matemáticos como funciones lineales, sistemas de ecuaciones, matrices, cálculo diferencial e integral para mejorar el análisis de las técnicas cuantitativas plicadas a modelos económicos administrativos', '', '', 1, NULL, NULL, NULL, NULL),
(296, 2, NULL, 'Contabilidad General', '', 1, 'Identifica, analiza y aplica las técnicas y herramientas de carácter contable para generar información financiera de la organización.', '', '', 1, NULL, NULL, NULL, NULL),
(297, 2, NULL, 'Función Administrativa I', '', 2, ' Aplica las bases conceptuales y procedimentales del proceso administrativo, para elaborar planes y diseñar estructuras organizacionales que conduzcan a una organización al éxito. ', '', '', 1, NULL, NULL, NULL, NULL),
(298, 2, NULL, 'Estadística para la Administración I', '', 2, 'Aplica e interpreta la estadística descriptiva en las organizaciones para la toma de decisiones.', '', '', 1, NULL, NULL, NULL, NULL),
(299, 2, NULL, 'Derecho Laboral y Seguridad Social', '', 2, 'Interpreta el derecho laboral y la seguridad social vigentes, así como las implicaciones legales que tienen las empresas tanto públicas como privadas, para aplicar estos principios en el campo de su vida  profesional. ', '', '', 1, NULL, NULL, NULL, NULL),
(300, 2, NULL, 'Comunicación Corporativa', '', 2, 'Establece una comunicación eficaz dentro y fuera de la organización, diseñando un plan de relaciones públicas a través de la utilización de las tecnologías de la información para las organizaciones.', '', '', 1, NULL, NULL, NULL, NULL),
(301, 2, NULL, 'Taller de Desarrollo Humano', '', 2, 'Entiende la importancia de su ser y de la vida, que le permita mantener un equilibrio personal a través del desarrollo sus capacidades, para mejorar su desempeño personal en las organizaciones. ', '', '', 1, NULL, NULL, NULL, NULL),
(302, 2, NULL, 'Costos de Manufactura', '', 2, ' Identifica y aplica el sistema de costos de producción para una adecuada toma de decisiones en relación al control y análisis de las operaciones productivas en la organización', '', '', 1, NULL, NULL, NULL, NULL),
(303, 2, NULL, 'Función Administrativa II', '', 3, 'Aplica la fase dinámica procedimental del proceso administrativo para la integración, dirección y control en las organizaciones destacando las habilidades gerenciales. ', '', '', 1, NULL, NULL, NULL, NULL),
(304, 2, NULL, 'Estadística para la Administración II', '', 3, 'Aplica herramientas de la inferencia estadística con métodos paramétricos y no paramétricos para la toma de decisiones en las organizaciones.', '', '', 1, NULL, NULL, NULL, NULL),
(305, 2, NULL, 'Derecho Empresarial', '', 3, 'Identifica la importancia del derecho empresarial en el desarrollo de las operaciones mercantiles, para interpretar el marco normativo y su aplicación en lasorganizaciones. ', '', '', 1, NULL, NULL, NULL, NULL),
(306, 2, NULL, 'Comportamiento Organizacional', '', 3, 'Integra los elementos que conforman la organización que están relacionados con el comportamiento humano en un ambiente globalizado, para propiciar el desarrollo de organizaciones sanas.', '', '', 1, NULL, NULL, NULL, NULL),
(307, 2, NULL, 'Dinámica Social', '', 3, 'Analiza los elementos de los procesos básicos, la relación con sus estructuras y con la sociedad global que le permiten conceptualizar a las organizaciones como sistemas complejos con el fin de tomar la mejor decisión. ', '', '', 1, NULL, NULL, NULL, NULL),
(308, 2, NULL, 'Contabilidad Gerencial', '', 3, 'Identifica y aplica las técnicas y herramientas administrativas, que a partir de la información financiera de la organización, apoyan las funciones de planeación, control y toma de decisiones.', '', '', 1, NULL, NULL, NULL, NULL),
(309, 2, NULL, 'Gestión Estratégica del Capital Humano I', '', 4, 'Aplica modelos y procesos en el desarrollo del capital humano para lograr un alto desempeño en las organizaciones. ', '', '', 1, NULL, NULL, NULL, NULL),
(310, 2, NULL, 'Procesos Estructurales', '', 4, 'Diseña o rediseña sistemas organizacionales con el fin de lograr la competitividad y productividad de la empresa ante el constante cambio. ', '', '', 1, NULL, NULL, NULL, NULL),
(311, 2, NULL, 'Métodos Cuantitativos para la Administración', '', 4, 'Aplica los métodos de la teoría de decisiones, programación lineal, administración de proyectos y modelos de líneas de espera como técnicas de análisis cuantitativo parala toma de decisiones en la administración. ', '', '', 1, NULL, NULL, NULL, NULL),
(312, 2, NULL, 'Fundamentos de Mercadotecnia', '', 4, 'Identifica los conceptos básicos e importancia de la mercadotecnia para generar el sustento teórico que permita diseñar proyectos integradores en los diferentes entornos. ', '', '', 1, NULL, NULL, NULL, NULL),
(313, 2, NULL, 'Economía Empresarial', '', 4, 'Reconoce y utiliza las diversas teorías y herramientas de análisis microeconómico para dar tratamiento a la información de la empresa y contribuir en la toma de decisiones. ', '', '', 1, NULL, NULL, NULL, NULL),
(314, 2, NULL, 'Matemáticas Financieras', '', 4, 'Aplica las herramientas de matemáticas financieras para establecer estrategias que apoyen la planeación, control y toma de decisiones para optimizar los resultados de la organización, de tal forma que ayuden en la solución de problemas financieros de forma efectiva. ', '', '', 1, NULL, NULL, NULL, NULL),
(315, 2, NULL, 'Gestión Estratégica del Capital Humano II', '', 5, 'Realiza un diagnóstico del desempeño del capital humano, para detectar oportunidades de mejora e incrementar la competitividad de la organización.', '', '', 1, NULL, NULL, NULL, NULL),
(316, 2, NULL, 'Derecho Fiscal', '', 5, 'Conoce, interpreta y aplica con responsabilidad, honestidad y compromiso las disposiciones tributarias de las leyes fiscales en las organizaciones que les permitan cumplir con las obligaciones emanadas de ellas', '', '', 1, NULL, NULL, NULL, NULL),
(317, 2, NULL, 'Mezcla de Mercadotecnia ', '', 5, 'Diseña e implementa estrategias de mezcla de mercadotecnia basadas en el análisis de información sistemáticamente obtenida del entorno. ', '', '', 1, NULL, NULL, NULL, NULL),
(318, 2, NULL, 'Macroeconomía', '', 5, 'Identifica y analiza las variables macroeconómicas fundamentales distinguiendo los agregados económicos para interpretar la dinámica de la actividad económica nacional, así como la afectación en las diferentes organizaciones. ', '', '', 1, NULL, NULL, NULL, NULL),
(319, 2, NULL, 'Administración Financiera I', '', 5, 'Analiza, interpreta y diagnostica la información financiera de organizaciones en la toma de decisiones para la optimización de los recursos. ', '', '', 1, NULL, NULL, NULL, NULL),
(320, 2, NULL, 'Desarrollo Sustentable', '', 5, 'Aplica una visión sustentable, en los ámbitos social, económico y ambiental que le permitirá evaluar y disminuir el impacto de la sociedad sobre el entorno, tomando en cuenta estrategias y considerando profesionalmente los valores ambientales.', '', '', 1, NULL, NULL, NULL, NULL),
(321, 2, NULL, 'Gestión de la Retribución ', '', 6, 'Analiza las retribuciones de una organización desde un punto de vista legal y aplica las metodologías en su descripción y valuación para una mejor distribución y equidad en el sector productivo. ', '', '', 1, NULL, NULL, NULL, NULL),
(322, 2, NULL, 'Producción', '', 6, 'Aplica los principios y técnicas más importantes de la administración de la producción para utilizar de manera eficiente y efectiva los recursos productivos de la empresa, así como el desarrollo de habilidades para resolver los problemas de toma de decisiones asertivas', '', '', 1, NULL, NULL, NULL, NULL),
(323, 2, NULL, 'Taller de Investigación I', '', 6, 'Elabora un protocolo de investigación en el que presenta soluciones científico -tecnológicas a problemáticas relacionadas con su campo profesional en diversos contextos.', '', '', 1, NULL, NULL, NULL, NULL),
(324, 2, NULL, 'Sistemas de Información de Mercadotecnia', '', 6, 'Aplica el manejo de técnicas y herramientas que le permitan administrar los sistemas de información de mercadotecnia para generar, mediante la investigación, la toma de decisiones en los diversos ámbitos de las organizaciones.', '', '', 1, NULL, NULL, NULL, NULL),
(325, 2, NULL, 'Innovación y Emprededurismo ', '', 6, 'Fortalece el potencial creativo y emprendedor a través del desarrollo de las habilidades para definir objetivos y estrategias, para la búsqueda de información que propicie la toma de decisiones en equipos interdisciplinarios', '', '', 1, NULL, NULL, NULL, NULL),
(326, 2, NULL, 'Administración Financiera II', '', 6, 'Aplica eficazmente las diversas técnicas de evaluación de presupuesto de capital y la operación en los mercados bursátiles y extrabursátiles para la mejor toma de decisiones.', '', '', 1, NULL, NULL, NULL, NULL),
(327, 2, NULL, 'Plan de Negocios', '', 7, 'Elabora el plan de negocios para operar una empresa y/u obtener financiamiento, considerando los normatividad y reglas de operación vigentes. ', '', '', 1, NULL, NULL, NULL, NULL),
(328, 2, NULL, 'Procesos de Dirección', '', 7, 'Integra el proceso de dirección estratégica en las organizaciones para incrementar la productividad y lograr una ventaja competitiva.', '', '', 1, NULL, NULL, NULL, NULL),
(329, 2, NULL, 'Taller de Investigación II', '', 7, 'Consolida el protocolo para ejecutar la investigación y obtener productos para su exposición, defensa y gestión de su transcendencia.', '', '', 1, NULL, NULL, NULL, NULL),
(330, 2, NULL, 'Administración de la Calidad', '', 7, 'Aplica los conocimientos, habilidades y actitudes requeridas en la administración de la calidad que permita mejorar la eficacia y eficiencia de la organización, tanto en sus procesos como en sus servicios, utilizando herramientas de control estadístico y de mejora continua para la toma de decisiones', '', '', 1, NULL, NULL, NULL, NULL),
(331, 2, NULL, 'Economía Internacional', '', 7, 'Analiza la información económica internacional y diseña estrategias de mercado internacional adecuadas para las organizaciones de acuerdo al contexto global.', '', '', 1, NULL, NULL, NULL, NULL),
(332, 2, NULL, 'Diagnóstico y Evaluación Empresarial', '', 7, 'Elabora un informe donde emite una opinión acerca de la información presentada por la empresa después de haber verificado, evaluado y diagnosticado la estructura y funcionamiento general de una organización para lograr una administración más eficiente.', '', '', 1, NULL, NULL, NULL, NULL),
(333, 2, NULL, 'Consultoría Empresarial', '', 8, 'Analiza situaciones problemáticas en las organizaciones y aplica sus destrezas y habilidades en el diseño de propuestas de solución y su implantación para mejorar las prácticas empresariales. ', '', '', 1, NULL, NULL, NULL, NULL),
(334, 2, NULL, 'Formulación y Evaluación de Proyectos', '', 8, 'Formula, evalúa y gestiona proyectos de inversión, que le permitan desarrollar proyectos integrales para la generación y crecimiento de las empresas bajo criterios de competitividad y sostenibilidad. ', '', '', 1, NULL, NULL, NULL, NULL),
(335, 2, NULL, 'Desarrollo Organizacional', '', 8, 'Aplica los conceptos teórico-prácticos del desarrollo organizacional para mejorar el desempeño administrativo empresarial, a través del análisis de su cultura y ambiente organizacional fomentando el trabajo en equipo. ', '', '', 1, NULL, NULL, NULL, NULL),
(336, 2, 9, 'Sistemas de Gestión de la Calidad', '', 8, 'Aplica los conocimientos, habilidades y actitudes requeridas en las Normas de Calidad que permita mejorar la eficacia y eficiencia de una organización, tanto en sus procesos como en sus servicios, con fines de lograr una certificación', '', '', 1, NULL, NULL, NULL, NULL),
(337, 2, 9, 'Comunicación Intercultural', '', 8, 'Identificar las diferencias que se dan en la comunicación intercultural y facilitarle el conocimiento y las habilidades que le permitirán tener éxito al interaccionar con personas de culturas diferentes a la suya, incorporando la comunicación oral y escrita en idioma inglés', '', '', 1, NULL, NULL, NULL, NULL),
(338, 2, 9, 'Liderazgo y Dirección de Talento Humano', '', 8, 'Desarrolla habilidades, actitudes, valores, experiencias y criterios que permitan al alumno desempeñarse exitosamente en actividades directivas, que tengan un impacto positivo en el desarrollo de talento humano.', '', '', 1, NULL, NULL, NULL, NULL),
(339, 2, 9, 'Toma de Decisiones ', '', 9, 'El estudiante comprenderá que las decisiones son el generador de los negocios y los impactos y consecuencias de ellas', '', '', 1, NULL, NULL, NULL, NULL),
(340, 2, 9, 'Tecnologías de la Información para los negocios', '', 9, 'Identifica los elementos básicos de la computadora y sus funciones. Identifica la terminología básica del sistema operativo. Guarda y recuperar la información en distintos medios de almacenamiento.', '', '', 1, NULL, NULL, NULL, NULL),
(341, 2, 9, 'Estrategias Comerciales', '', 9, 'Formular estrategias comerciales que le permitan al estudiante comprender la importancia del logro de metas, al desarrollar estrategias orientadas al cierre de la venta a través de la creación de hábitos de mejora continua, integridad y trabajo en equipo.', '', '', 1, NULL, NULL, NULL, NULL),
(342, 2, 9, 'Cultura de la Calidad', '', 9, 'Analizar la importancia del desarrollo de una cultura de calidad en las organizaciones y la calidad de vida en las personas', '', '', 1, NULL, NULL, NULL, NULL),
(343, 2, 9, 'Responsabilidad Social', '', 10, 'Comprender los conceptos teóricos básicos de la Responsabilidad Social Empresarial. Identificar los grupos de interés y los procesos de diálogo que generen valor para los involucrados. ', '', '', 1, NULL, NULL, NULL, NULL),
(344, 2, 10, 'Mercadotecnia Internacional', '', 8, 'Conocer los tratados comerciales firmados por México con otros países. Implementar estrategias logísticas en la resolución de casos prácticos con la aplicación de tratados comerciales y barreras arancelarias utilizando las ventajas que ofrecen los tratados.', '', '', 1, NULL, NULL, NULL, NULL),
(345, 2, 10, 'Comunicación Intercultural', '', 8, 'Identificar las diferencias que se dan en la comunicación intercultural y facilitarle el conocimiento y las habilidades que le permitirán tener éxito al interaccionar con personas de culturas diferentes a la suya, incorporando la comunicación oral y escrita en idioma inglés.', '', '', 1, NULL, NULL, NULL, NULL),
(346, 2, 10, 'Tecnologías de Negocios Electrónicos ', '', 8, 'Aplica las tecnologías de información en las organizaciones para optimizar los procesos de comunicación y procesamiento de información y hacer eficiente la toma de decisiones. ', '', '', 1, NULL, NULL, NULL, NULL),
(347, 2, 10, 'Derecho Aduanero', '', 9, 'Investigar y analizar las diversas prácticas que contempla la Ley Aduanera, así como su reglamento para el ingreso y egreso legal de las mercancías.', '', '', 1, NULL, NULL, NULL, NULL),
(348, 2, 10, 'Gestión Portuaria', '', 9, 'Comprender losConceptos predominantes en el ámbito de la Gestión Internacional de los Recursos Humanos, lo que le permitirá conocer actividades de Reclutamiento, Selección, Integración, Contratación, Entrenamiento y Remuneraciones en este contexto internacional.', '', '', 1, NULL, NULL, NULL, NULL),
(349, 2, 10, 'Administración Financiera', '', 9, 'Desarrolla habilidades orientadas a solucionar problemáticas de negocios globales y a detectar oportunidades, tomando en cuenta el entorno cultural, político, económico de las organizaciones internacionales', '', '', 1, NULL, NULL, NULL, NULL),
(350, 2, 10, 'Gestión Internacional de Recursos Humanos', '', 10, 'La competencia específica de la asignatura, comprende los conceptos predominantes en el ámbito de la Gestión Internacional de los Recursos Humanos, lo que le permitirá conocer actividades de Reclutamiento, Selección, Integración, Contratación, Entrenamiento y Remuneraciones en este contexto internacional.', '', '', 1, NULL, NULL, NULL, NULL),
(351, 6, NULL, 'Taller de Ética', '', 1, 'Desarrolla conciencia sobre el significado y sentido de la Ética para orientar su comportamiento en el contexto social y profesional.', '', '', 1, NULL, NULL, NULL, NULL),
(352, 6, NULL, 'Fundamentos de Investigación', '', 1, 'Comprender y aplicar los procesos en las estructuras y funciones fundamentales de las organizaciones para contribuir sustantivamente con los procesos de planeación.', '', '', 1, NULL, NULL, NULL, NULL),
(353, 6, NULL, 'Cálculo Diferencial', '', 1, 'Plantea y resuelve problemas utilizando las definiciones de límite y derivada de funciones de una variable para la elaboración de modelos matemáticos aplicados.', '', '', 1, NULL, NULL, NULL, NULL),
(354, 6, NULL, 'Química', '', 1, 'Comprende la estructura de la materia y su relación con las propiedades físicas y químicas, así como a las técnicas requeridas para la construcción de equipos o sistemas electrónicos.', '', '', 1, NULL, NULL, NULL, NULL),
(355, 6, NULL, 'Metrología y normalización ', '', 1, 'Utiliza adecuadamente los diferentes instrumentos y/o equipos de medición para la lectura de los diferentes parámetros mecánicos y eléctricos', '', '', 1, NULL, NULL, NULL, NULL),
(356, 6, NULL, 'Dibujo Asistido por Computadora', '', 1, 'Conoce e interpreta las normas utilizadas para el correcto desarrollo de dibujos, así como las herramientas utilizadas en la elaboración de dibujos bidimensionales y tridimensionales.', '', '', 1, NULL, NULL, NULL, NULL),
(357, 6, NULL, 'Programación Básica', '', 2, 'Soluciona problemas susceptibles de ser computarizados a través del manejo de técnicas estructuradas de diseño y formulación de algoritmos. ', '', '', 1, NULL, NULL, NULL, NULL),
(358, 6, NULL, 'Estadística y Control de Calidad', '', 2, 'Aplica los métodos estadísticos en el diseño, interpretación e implantación de sistemas de control de calidad.', '', '', 1, NULL, NULL, NULL, NULL),
(359, 6, NULL, 'Ciencia e Ingeniería de materiales ', '', 2, 'Comprende las propiedades y el comportamiento de diferentes materiales utilizados en ingeniería para poder seleccionar el material más adecuado de acuerdo a su \naplicación. ', '', '', 1, NULL, NULL, NULL, NULL),
(360, 6, NULL, 'Administración y Contabilidad', '', 2, 'Aplica los conceptos de administración y contabilidad en el desempeño profesional \npara la toma de decisiones. ', '', '', 1, NULL, NULL, NULL, NULL),
(361, 6, NULL, 'Cálculo Integral ', '', 2, 'Resolver problemas de aplicación e interpretar las soluciones utilizando matrices y sistemas de ecuaciones lineales para las diferentes áreas de la ingeniería. ', '', '', 1, NULL, NULL, NULL, NULL),
(362, 6, NULL, 'Algebra Lineal', '', 2, 'Aplica la definición de integral y las técnicas de integración para resolver problemas de ingeniería.', '', '', 1, NULL, NULL, NULL, NULL),
(363, 6, NULL, 'Procesos de Fabricación', '', 3, 'Selecciona los procesos de fabricación y ensamble más apropiado de acuerdo al producto y material de construcción, para obtener la funcionalidad deseada en el producto.', '', '', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_materia` (`materiaId`, `carreraId`, `especialidadId`, `nombre`, `area`, `semestre`, `competencia`, `urlVideo`, `urlPrograma`, `status`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(364, 6, NULL, 'Estática', '', 3, 'Analiza y diseña estructuras resistentes y seguras que satisfagan las necesidades del hombre aplicando ecuaciones de equilibrio estático. ', '', '', 1, NULL, NULL, NULL, NULL),
(365, 6, NULL, 'Desarrollo Sustentable', '', 3, 'Aplica una visión sustentable, en los ámbitos social, económico y ambiental que le permitirá evaluar y disminuir el impacto de la sociedad sobre el entorno, tomando en cuenta estrategias y considerando profesionalmente los valores ambientales.', '', '', 1, NULL, NULL, NULL, NULL),
(366, 6, NULL, 'Cálculo Vectorial', '', 3, 'Aplica los principios y técnicas básicas del cálculo vectorial para resolver problemas de ingeniería del entorno.', '', '', 1, NULL, NULL, NULL, NULL),
(367, 6, NULL, 'Métodos Numéricos', '', 3, 'Utiliza algoritmos numéricos para obtener soluciones aproximadas de modelos matemáticos de interés en física e ingeniería que no se pueden resolver por métodos analíticos', '', '', 1, NULL, NULL, NULL, NULL),
(368, 6, NULL, 'Electromagnetismo', '', 3, 'Emplea adecuadamente los conceptos básicos de las leyes y principios fundamentales del Electromagnetismo, desarrollando habilidades para la resolución de problemas reales.', '', '', 1, NULL, NULL, NULL, NULL),
(369, 6, NULL, 'Mecánica de Materiales', '', 4, 'Identificar los efectos de los elementos mecánicos al ser sometidos a cargas de torsión, flexión, axial y combinados', '', '', 1, NULL, NULL, NULL, NULL),
(370, 6, NULL, 'Fundamentos de Termodinámica', '', 4, 'Aplica los conceptos y leyes termodinámicas para eficientar procesos en los que se presentan fenómenos de transformación de\nenergía en sistemas mecatrónicos, que permitan reducir consumos de energía. ', '', '', 1, NULL, NULL, NULL, NULL),
(371, 6, NULL, 'Dinámica', '', 4, 'Conoce los principios que rigen el comportamiento de partículas y cuerpos rígidos en cuanto a su posición, velocidad y aceleración así como las causas y efectos que \nlo producen, para poder aplicarlos en el  análisis a sistemas mecatrónicos \n', '', '', 1, NULL, NULL, NULL, NULL),
(372, 6, NULL, 'Análisis de circuitos eléctricos ', '', 4, 'Analiza, diseña, simula e implementa circuitos eléctricos de corriente directa y alterna básicos con elementos pasivos y activos lineales para su aplicación en sistemas eléctricos.', '', '', 1, NULL, NULL, NULL, NULL),
(373, 6, NULL, 'Ecuaciones Diferenciales', '', 4, 'Aplica los métodos de solución de ecuaciones diferenciales ordinarias para resolver problemas que involucran sistemas dinámicos que se presentan en la ingeniería.', '', '', 1, NULL, NULL, NULL, NULL),
(374, 6, NULL, 'Taller de Investigación I', '', 5, 'Elabora un protocolo de investigación con el que se propongan soluciones científico - tecnológicas a problemáticas relacionadas con el contexto de la ingeniería', '', '', 1, NULL, NULL, NULL, NULL),
(375, 6, NULL, 'Electrónica Analógica ', '', 5, 'Analiza, simula y aplica los dispositivos semiconductores básicos en el diseño \nde circuitos electrónicos utilizados en los sistemas mecatrónicos. ', '', '', 1, NULL, NULL, NULL, NULL),
(376, 6, NULL, 'Análisis de Fluidos', '', 5, 'Aplica los principios de la mecánica de fluidos en sistemas Mecatrónicos', '', '', 1, NULL, NULL, NULL, NULL),
(377, 6, NULL, 'Mecanismos', '', 5, 'Aplica los conocimientos necesarios para el diseño cinemático de sistemas mecánicos, formulando modelos matemáticos y prototipos mediante la utilización de métodos gráficos, analíticos y computacionales. ', '', '', 1, NULL, NULL, NULL, NULL),
(378, 6, NULL, 'Maquinas eléctricas', '', 5, 'Conoce y aplica los principios de funcionamiento de las máquinas eléctricas estáticas y dinámicas. ', '', '', 1, NULL, NULL, NULL, NULL),
(379, 6, NULL, 'Taller de Investigación II', '', 6, 'Consolida el protocolo para ejecutar la investigación y obtener productos para su exposición, defensa y gestión de su transcendencia.', '', '', 1, NULL, NULL, NULL, NULL),
(380, 6, NULL, 'Electrónica Digital', '', 6, 'Conoce, diseña y aplica los circuitos digitales para el control de los diferentes sistemas\nmecatrónicos', '', '', 1, NULL, NULL, NULL, NULL),
(381, 6, NULL, 'Electrónica de Potencia Aplicada', '', 6, 'Diseñar circuitos electrónicos de potencia y  convertidores de energía, para el arranque, control y protección de motores eléctricos de corriente alterna y directa de uso industrial con dispositivos electromagnéticos y de estado sólido. ', '', '', 1, NULL, NULL, NULL, NULL),
(382, 6, NULL, 'Diseño de elementos mecánicos ', '', 6, 'Diseña elementos mecánicos aplicados en sistemas mecatrónicos, analizando \ncondiciones de falla bajo diversas solicitaciones de carga estática y dinámica. Así \ncomo, seleccionar y optimizar elementos mecánicos para transmisión.', '', '', 1, NULL, NULL, NULL, NULL),
(383, 6, NULL, 'Vibraciones Mecánicas ', '', 6, 'Modela sistemas mecánicos oscilatorios para determinar sus características y comportamiento dinámico y aplicar técnicas de: balanceo dinámico de maquinaria, edición, uso de instrumentos, software para el análisis de vibraciones.', '', '', 1, NULL, NULL, NULL, NULL),
(384, 6, NULL, 'Instrumentación', '', 6, 'Desarrolla las competencias necesarias para seleccionar, aplicar, calibrar, operar los instrumentos de medición empleados en los procesos industriales, así mismo las habilidades para la sintonización de los controladores PID.', '', '', 1, NULL, NULL, NULL, NULL),
(385, 6, NULL, 'Mantenimiento', '', 7, 'Analizar, desarrollar y ejecutar planes de mantenimiento', '', '', 1, NULL, NULL, NULL, NULL),
(386, 6, NULL, 'Circuitos Hidráulicos y Neumáticos.', '', 7, 'Diseña y analiza circuitos neumáticos e hidráulicos, utilizando metodologías \nespecializadas, conecta los diferentes elementos utilizados en los circuitos \nhidráulicos y neumáticos utilizando los diferentes elementos de trabajo y control \nneumáticos e hidráulicos así como interpretar y utilizar simbología neumática e \nhidráulica.', '', '', 1, NULL, NULL, NULL, NULL),
(387, 6, NULL, 'Microcontroladores', '', 7, 'Programa y aplica sistemas basados en microcontroladores y sus interfaces en la \nautomatización y control industrial', '', '', 1, NULL, NULL, NULL, NULL),
(388, 6, NULL, 'Dinámica de Sistemas', '', 7, 'Modela, simula y analiza sistemas dinámicos continuos y discretos de distinta \nnaturaleza, entre los que se incluyen sistemas híbridos y de procesos, mediante \ndiferentes métodos de representación para el análisis de procesos o sistemas físicos \npresentes en la naturaleza.', '', '', 1, NULL, NULL, NULL, NULL),
(389, 6, NULL, 'Programación Avanzada', '', 7, 'Aprende técnicas propias de la ingeniería en sistemas computacionales, aplicándolas al desarrollo de sistemas mecatrónicos automáticos, controlados por computadora, a través de sus interfaces electrónicas, incluyendo el desarrollo de interfaces gráficas para interacción hombre-máquina', '', '', 1, NULL, NULL, NULL, NULL),
(390, 6, NULL, 'Manufactura avanzada', '', 7, 'Diseña y fabrica piezas y equipos mecatrónicos utilizando sistemas y tecnologías \nCAD-CAM', '', '', 1, NULL, NULL, NULL, NULL),
(391, 6, NULL, 'Formulación y Evaluación de \nProyectos', '', 8, 'Desarrolla, en tiempo y forma, un proyecto de inversión, técnica, económica y \nfinancieramente factible, considerando su impacto ambiental y social.', '', '', 1, NULL, NULL, NULL, NULL),
(392, 6, NULL, 'Control', '', 8, 'Adquiere los conocimientos necesarios para evaluar, analizar, comprender, construir, \nsintonizar, controlar y mantener sistemas dinámicos invariantes en el tiempo para \ndiferentes procesos industriales.', '', '', 1, NULL, NULL, NULL, NULL),
(393, 6, NULL, 'Controladores Lógicos Programables.', '', 8, 'Conoce, analiza y aplica lenguajes de programación de controladores lógicos \nprogramables para automatizar, mantener y administrar equipos y sistemas \nmecatrónicos', '', '', 1, NULL, NULL, NULL, NULL),
(394, 6, NULL, 'Robótica', '', 9, 'Adquiere los conocimientos necesarios para proponer soluciones en la automatización \nde procesos de manufactura industriales mediante la selección y aplicación de \nmanipuladores robóticos, para asegurar la calidad eficiencia y rentabilidad de dichos \nprocesos.', '', '', 1, NULL, NULL, NULL, NULL),
(395, 7, NULL, 'Fundamentos de Investigación', '', 1, 'Aplica los elementos de la investigación documental para elaborar escritos académicos de su entorno profesional.', '', '', 1, NULL, NULL, NULL, NULL),
(396, 7, NULL, 'Taller de Ética ', '', 1, 'Desarrolla conciencia sobre el significado y sentido de la Ética para orientar su comportamiento en el contexto social y profesional. ', '', '', 1, NULL, NULL, NULL, NULL),
(397, 7, NULL, 'Cálculo Diferencial', '', 1, 'Plantea y resuelve problemas utilizando las definiciones de límite y derivada de funciones de una variable para la elaboración de modelos matemáticos aplicados.', '', '', 1, NULL, NULL, NULL, NULL),
(398, 7, NULL, 'Taller de Herramientas Intelectuales', '', 1, 'Aplica las herramientas intelectuales para fortalecer en el estudiante el aprender a aprender, aprender a hacer, aprender a ser y aprender a convivir a lo largo de su vida estudiantil, profesional y personal. ', '', '', 1, NULL, NULL, NULL, NULL),
(399, 7, NULL, 'Química', '', 1, 'Adquiere conocimientos básicos sobre la estructura de los compuestos químicos orgánicos e inorgánicos, así como su nomenclatura, propiedades físicas, reactividad, energía y equilibrio, considerando los impactos económico y al medio ambiente, para tomar decisiones que permitan seleccionar materiales industriales, así como asegurar las condiciones de sustentabilidad, higiene y seguridad industrial y la responsabilidad social.', '', '', 1, NULL, NULL, NULL, NULL),
(400, 7, NULL, 'Dibujo Industrial ', '', 1, 'Adquirir conocimientos generales para elaborar, interpretar y supervisar planos de diferentes ramas de la ingeniería y especificaciones de piezas industriales, equipo especializado en los manuales y catálogo de los fabricantes, apoyándose en el software de dibujo asistido por computadora', '', '', 1, NULL, NULL, NULL, NULL),
(401, 7, NULL, 'Electricidad y Electrónica Industrial', '', 2, 'Aplica los principios de la electricidad y electrónica industrial para integrar sistemas productivos y establecer programas adecuados de mantenimiento industrial.', '', '', 1, NULL, NULL, NULL, NULL),
(402, 7, NULL, 'Propiedad de los materiales', '', 2, 'Identifica y aplica los materiales adecuados en los diferentes procesos industriales de acuerdo a sus características y propiedades para obtener productos de calidad, bajo costo y protegiendo al ambiente.', '', '', 1, NULL, NULL, NULL, NULL),
(403, 7, NULL, 'Cálculo Integral', '', 2, 'Aplica la definición de integral y las técnicas de integración para resolver problemas de ingeniería.', '', '', 1, NULL, NULL, NULL, NULL),
(404, 7, NULL, 'Probabilidad y Estadística', '', 2, 'Aplica los conceptos de la teoría de la probabilidad y estadística para organizar, clasificar, analizar e interpretar datos para la toma decisiones en aplicaciones de industrial y logística.', '', '', 1, NULL, NULL, NULL, NULL),
(405, 7, NULL, 'Análisis de la Realidad Nacional', '', 2, 'Interpretar la realidad nacional, a través de los indicadores económicos, sociales y sustentables, que le permitan comprender la situación actual del país y sea capaz de definir propuestas emprendedoras y de mejora en las industrias, con apego a la normatividad económica, social y ambiental de sustentabilidad de los recursos.', '', '', 1, NULL, NULL, NULL, NULL),
(406, 7, NULL, 'Taller de Liderazgo', '', 2, 'Desarrolla las habilidades que le permitan guiar grupos de personas en el diseño, producción y mejora de productos y servicios, cumpliendo con los estándares de calidad, eficiencia, ambientales, económicos y sociales, en los sistemas organizacionales establecidos y en la creación de empresas.', '', '', 1, NULL, NULL, NULL, NULL),
(407, 7, NULL, 'Metrología y Normalización', '', 3, 'Maneja desde un punto de vista de la metrología y normalización, los métodos y sistemas de medición.', '', '', 1, NULL, NULL, NULL, NULL),
(408, 7, NULL, 'Álgebra Lineal', '', 3, 'Resuelve problemas de modelos lineales aplicados en ingeniería para la toma de decisiones de acuerdo a la interpretación de resultados utilizando matrices y sistemas de ecuaciones.', '', '', 1, NULL, NULL, NULL, NULL),
(409, 7, NULL, 'Cálculo Vectorial', '', 3, 'Aplica los principios y técnicas básicas del cálculo vectorial para resolver problemas de ingeniería del entorno.', '', '', 1, NULL, NULL, NULL, NULL),
(410, 7, NULL, 'Economía', '', 3, 'Comprende, evalúa y analiza alternativas micro y macroeconómicas relacionadas con el consumo y la producción a través de la aplicación de los conceptos, metodología e instrumentos de la teoría económica para el mejoramiento de la productividad.', '', '', 1, NULL, NULL, NULL, NULL),
(411, 7, NULL, 'Estadística Inferencial I', '', 3, 'Emplea los métodos de muestreo adecuados para la obtención de la muestra experimental con la finalidad de realizar inferencias sobre la población y el desarrollo de pruebas estadísticas.', '', '', 1, NULL, NULL, NULL, NULL),
(412, 7, NULL, 'Estudio del trabajo I', '', 3, 'Identifica, evalúa, diseña y genera propuestas de mejora en los procesos de producción, estaciones de trabajo, distribución de planta, genera métodos de trabajo y establece tiempos estándar con cronómetro para elevar la productividad en las empresas de su entorno.', '', '', 1, NULL, NULL, NULL, NULL),
(413, 7, NULL, 'Procesos de fabricación', '', 4, 'Analiza los diferentes procesos físicos para la obtención, tratamientos térmicos y cambios de forma de materiales ferrosos, cerámicos y poliméricos para definir los más apropiados a utilizar en la industria.', '', '', 1, NULL, NULL, NULL, NULL),
(414, 7, NULL, 'Física', '', 4, 'Aplica las leyes y principios fundamentales de la mecánica en la solución de problemas de partículas y cuerpos rígidos sujetos a la acción de fuerzas.', '', '', 1, NULL, NULL, NULL, NULL),
(415, 7, NULL, 'Algoritmos y Lenguajes de Programación', '', 4, 'Resuelve problemas de programación mediante la aplicación de herramientas computacionales para el desarrollo de proyectos.', '', '', 1, NULL, NULL, NULL, NULL),
(416, 7, NULL, 'Investigación de Operaciones I', '', 4, 'Formula y plantea modelos matemáticos lineales en situaciones reales del entorno, interpreta las soluciones obtenidas a través de los diferentes criterios de optimización y las expresa en un lenguaje accesible.', '', '', 1, NULL, NULL, NULL, NULL),
(417, 7, NULL, 'Estadística Inferencial II', '', 4, 'Identifica fuentes de variación aplicando el modelo estadístico más adecuado para planear, ejecutar y desarrollar experimentación orientado a la mejora de procesos logísticos, industriales, comerciales y de servicios.', '', '', 1, NULL, NULL, NULL, NULL),
(418, 7, NULL, 'Estudio del trabajo II', '', 4, 'Diseña, mejora e integra sistemas productivos de bienes y servicios aplicando tecnologías para su optimización.', '', '', 1, NULL, NULL, NULL, NULL),
(419, 7, NULL, 'Higiene y Seguridad Industrial', '', 4, 'El estudiante gestiona sistemas de seguridad e higiene y salud ocupacional de manera sustentable, en sistemas productivos de bienes y servicios cumpliendo con los lineamientos legales aplicables.', '', '', 1, NULL, NULL, NULL, NULL),
(420, 7, NULL, 'Administración de Proyectos', '', 5, 'Planear y organizar actividades; así como integrar, dirigir y controlar recursos en tiempo-costo aplicando herramientas de la gestión de proyectos.', '', '', 1, NULL, NULL, NULL, NULL),
(421, 7, NULL, 'Gestión de Costos', '', 5, 'Calcula los diferentes tipos de costos de un proyecto, aplicando los principios y conceptos de la Gestión de Costos, para la toma de decisiones.', '', '', 1, NULL, NULL, NULL, NULL),
(422, 7, NULL, 'Administración de las Operaciones I', '', 5, 'Utiliza técnicas de pronósticos y de planeación de la capacidad para tomar decisiones en la administración de sistemas de producción de bienes y servicios.', '', '', 1, NULL, NULL, NULL, NULL),
(423, 7, NULL, 'Investigación de Operaciones II', '', 5, 'Formula y resuelve modelos matemáticos aplicando técnicas deterministas y probabilistas a situaciones reales o teóricas del entorno, interpretando las soluciones obtenidas expresadas en un lenguaje accesible al usuario como apoyo a la toma de decisiones.', '', '', 1, NULL, NULL, NULL, NULL),
(424, 7, NULL, 'Control Estadístico de la Calidad', '', 5, 'Diseñar e Implantar el Control estadístico de Calidad en procesos para alcanzar la mejora continua', '', '', 1, NULL, NULL, NULL, NULL),
(425, 7, NULL, 'Ergonomía', '', 5, 'Diseña áreas de trabajo tomando en cuenta la antropometría, la biomecánica, la ergonomía ocupacional y las condiciones ambientales para el aumento de la productividad del sector manufacturero y de servicios.', '', '', 1, NULL, NULL, NULL, NULL),
(426, 7, NULL, 'Desarrollo Sustentable', '', 5, 'Aplica una visión sustentable, en los ámbitos social, económico y ambiental que le\npermitirá evaluar y disminuir el impacto de la sociedad sobre el entorno, tomando en cuenta estrategias y considerando profesionalmente los valores ambientales.', '', '', 1, NULL, NULL, NULL, NULL),
(427, 7, NULL, 'Taller de investigación I', '', 6, 'Elabora un protocolo de investigación en el que presenta soluciones científico -\ntecnológicas a problemáticas relacionadas con su campo profesional en diversos contextos.', '', '', 1, NULL, NULL, NULL, NULL),
(428, 7, NULL, 'Ingeniería Económica', '', 6, 'Aplica las herramientas de ingeniería económica para establecer estrategias que apoyen la planeación, control y toma de decisiones para optimizar los resultados de la organización de tal forma que ayuden en la solución de problemas financieros de forma efectiva.', '', '', 1, NULL, NULL, NULL, NULL),
(429, 7, NULL, 'Administración de las Operaciones II', '', 6, 'Diseña, implementa, administra y mejora sistemas integrados de abastecimiento, producción y distribución de bienes y servicios.', '', '', 1, NULL, NULL, NULL, NULL),
(430, 7, NULL, 'Simulación', '', 6, 'Analiza sistemas e identifica problemas mediante el enfoque de la simulación con el fin de proponer una solución al problema o una reconfiguración del sistema que lo mejore\nsignificativamente.', '', '', 1, NULL, NULL, NULL, NULL),
(431, 7, NULL, 'Administración del Mantenimiento', '', 6, 'Comprende la evolución y generalidades del sistema del departamento de mantenimiento en aplicar técnicas para administrar planes y programas de conservación de equipos e instalaciones con el fin de prever problemas y evitar paros no planeados en los procesos de producción de bienes y servicios para la mejora continua.', '', '', 1, NULL, NULL, NULL, NULL),
(432, 7, NULL, 'Mercadotecnia', '', 6, 'Aplica los principales conceptos y áreas de estudio de la mercadotecnia en las organizaciones, su entorno e interrelación con la logística, desarrollando propuestas y planes de acción relacionados con el producto y la cadena de abastecimiento y distribución atendiendo a las necesidades del mercado, del cliente y de la organización.', '', '', 1, NULL, NULL, NULL, NULL),
(433, 7, NULL, 'Taller de investigación II', '', 7, 'Consolida el protocolo para ejecutar la investigación y obtener productos para su exposición, defensa y gestión de su transcendencia.', '', '', 1, NULL, NULL, NULL, NULL),
(434, 7, NULL, 'Planeación Financiera', '', 7, 'Utiliza los conceptos fundamentales, que involucran la planeación financiera, balance pro-forma, estado de resultados, el punto de equilibrio para que el estudiante sepa interpretar estados financieros usándolos como herramientas para tomar la mejor decisión en empresas de manufactura y servicios', '', '', 1, NULL, NULL, NULL, NULL),
(435, 7, NULL, 'Planeación y diseño de instalaciones', '', 7, 'Realiza estudios de localización, determinación del tamaño óptimo, diseño y distribución de instalaciones de plantas productivas.', '', '', 1, NULL, NULL, NULL, NULL),
(436, 7, NULL, 'Sistemas de Manufactura', '', 7, 'Evalúa y optimiza los sistemas de manufactura empleados en la generación de bienes y servicios, mediante el uso de técnicas y herramientas de vanguardia.', '', '', 1, NULL, NULL, NULL, NULL),
(437, 7, NULL, 'Logística y cadenas de suministro', '', 7, 'Diseña y mejora sistemas integrados de producción, abastecimiento y distribución de organizaciones productoras de bienes y servicios para incrementar la competitividad de la cadena de suministro.', '', '', 1, NULL, NULL, NULL, NULL),
(438, 7, NULL, 'Gestión de los Sistemas de Calidad', '', 7, 'Aplica los requisitos y principios de los sistemas de Gestión de Calidad con base al Marco Normativo Internacional y sus equivalentes nacionales en el diseño, implementación y mejora del modelo de calidad en las organizaciones, con la finalidad de hacerlas más productivas en un entorno de competitividad, sustentabilidad y lograr permanencia en la trascendencia de las empresas nacionales y extranjeras.', '', '', 1, NULL, NULL, NULL, NULL),
(439, 7, NULL, 'Ingeniería de Sistemas', '', 7, 'Desarrollar un pensamiento holístico al obtener conocimientos sobre el enfoque de sistemas, que le permita un mejor análisis para la toma de decisiones, búsqueda de alternativas y oportunidades, para redefinir y solucionar problemas, estableciendo una relación armónica con su medio ambiente comprendiendo todas las entradas, salidas del sistema, sus interrelaciones y características de suselementos permitiéndole modelar un sistema de interés para obtener una solución viable respetando la naturaleza del sistema.', '', '', 1, NULL, NULL, NULL, NULL),
(440, 7, NULL, 'Formulación y Evaluación de Proyectos', '', 8, 'Formula, evalúa y gestiona proyectos de inversión, que le permitan desarrollar proyectos integrales para la generación y crecimiento de las empresas bajo criterios de competitividad y sostenibilidad.', '', '', 1, NULL, NULL, NULL, NULL),
(441, 7, NULL, 'Relaciones industriales', '', 8, 'Aplicar las técnicas fundamentales de la administración de recursos humanos para el buen funcionamiento y evolución en las organizaciones de manufactura y servicios.', '', '', 1, NULL, NULL, NULL, NULL),
(442, 7, 24, 'Temas Selectos De Calidad', '', 0, 'Aplicar las herramientas específicas de calidad para la mejora de la productividad y \ncompetitividad de organizaciones productivas. ', '', '', 1, NULL, NULL, NULL, NULL),
(443, 7, 24, 'Seis Sigma (Six Sigma)', '', 0, 'Esta asignatura aporta al perfil de egreso del Ingeniero Industrial, la capacidad de: analizar,  diseñar, mejorar y evaluar un sistema productivo, además de poder utilizar una herramienta para la mejora continua de cualquier organización', '', '', 1, NULL, NULL, NULL, NULL),
(444, 7, 24, 'Medición y Mejora de la productividad y la Competitividad', '', 0, 'Conoce, diseña, administra e implementa modelos y métodos para medir, evaluar, planear y mejorar la productividad y a competitividad en todo tipo de empresa, organización o institución.', '', '', 1, NULL, NULL, NULL, NULL),
(445, 7, 24, 'Manufactura Esbelta (Lean Manufacturing)', '', 0, 'Conoce, comprende y aplica la filosofía de Lean Manufacturing. Identifica y elimina los diferentes desperdicios existentes en un sistema mediante el desarrollo de proyectos de aplicación de herramientas Lean Manufacturing.', '', '', 1, NULL, NULL, NULL, NULL),
(446, 7, 24, 'Auditorias de Seguridad y Salud Ocupacional', '', 0, 'Aplica la metodología y los procedimientos para realizar diagnósticos y auditorias de seguridad y salud ocupacional basado en el conocimiento normativo y legal nacional obligatorio y las normas internacional ISO aplicaciones', '', '', 1, NULL, NULL, NULL, NULL);
