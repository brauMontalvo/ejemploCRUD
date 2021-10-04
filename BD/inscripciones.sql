-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 29-09-2021 a las 22:21:16
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inscripciones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Alumno`
--

CREATE TABLE `Alumno` (
  `nNumControl` int(11) NOT NULL,
  `nCveCarrera` smallint(6) NOT NULL,
  `sCveUsuario` char(10) NOT NULL,
  `nSemestre` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Alumno`
--

INSERT INTO `Alumno` (`nNumControl`, `nCveCarrera`, `sCveUsuario`, `nSemestre`) VALUES
(102010, 1, '2', 1),
(102011, 1, '3', 1),
(102012, 2, '4', 2),
(102110, 2, '5', 3),
(102111, 3, '6', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Carrera`
--

CREATE TABLE `Carrera` (
  `nCveCarrera` smallint(6) NOT NULL,
  `sNombre` varchar(20) NOT NULL,
  `sAcronimo` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Carrera`
--

INSERT INTO `Carrera` (`nCveCarrera`, `sNombre`, `sAcronimo`) VALUES
(1, 'Ing. en Sist. Comp.', 'ISC'),
(2, 'Lic. en Informática', 'LI'),
(3, 'Ing. Electrónica', 'IE'),
(4, 'Ing. Mecánica', 'IME');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Grupo`
--

CREATE TABLE `Grupo` (
  `sCveGrupo` char(5) NOT NULL,
  `nHora` smallint(6) NOT NULL,
  `nCveMateria` int(11) NOT NULL,
  `nCveMaestro` int(11) NOT NULL,
  `nSituacion` smallint(6) NOT NULL,
  `sSalon` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Grupo`
--

INSERT INTO `Grupo` (`sCveGrupo`, `nHora`, `nCveMateria`, `nCveMaestro`, `nSituacion`, `sSalon`) VALUES
('23BA', 7, 9, 4, 1, '38'),
('23BB', 8, 9, 3, 1, '37'),
('49BA', 14, 8, 5, 1, '20'),
('49BB', 20, 8, 3, 1, '26'),
('49CA', 10, 4, 1, 1, '24'),
('49CB', 16, 4, 2, 1, '58'),
('51BA', 13, 7, 5, 1, '60'),
('51BB', 19, 7, 5, 1, '45'),
('69BA', 8, 2, 3, 1, 'L5'),
('69BB', 14, 2, 1, 1, 'L4'),
('71BA', 12, 6, 3, 1, 'L3'),
('71BB', 18, 6, 2, 1, '15'),
('77BA', 11, 5, 4, 1, '33'),
('77BB', 17, 5, 5, 1, 'L7'),
('79DA', 9, 3, 4, 1, 'C1'),
('79DB', 15, 3, 1, 1, 'C2'),
('79HA', 7, 1, 1, 1, '15'),
('79HB', 12, 1, 2, 1, 'L7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ListaGrupo`
--

CREATE TABLE `ListaGrupo` (
  `nCalifFinal` smallint(6) DEFAULT NULL,
  `sCveGrupo` char(5) NOT NULL,
  `nNumControl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Maestro`
--

CREATE TABLE `Maestro` (
  `nCveMaestro` int(11) NOT NULL,
  `sNombre` varchar(20) NOT NULL,
  `sApePat` varchar(20) NOT NULL,
  `sApeMat` varchar(20) DEFAULT NULL,
  `sTitulo` varchar(20) NOT NULL,
  `sMaestria` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Maestro`
--

INSERT INTO `Maestro` (`nCveMaestro`, `sNombre`, `sApePat`, `sApeMat`, `sTitulo`, `sMaestria`) VALUES
(1, 'Tim', 'Berners', 'Lee', 'Ingeniero', 'MCC'),
(2, 'Tom', 'DeMarco', NULL, 'Informático', NULL),
(3, 'Edward', 'Yourdon', NULL, 'Ingeniero', 'MCC'),
(4, 'Isaac', 'Newton', NULL, 'Físico-matemático', NULL),
(5, 'Alberto', 'Creus', 'Marcombo', 'Ing. Optoelectrónico', 'Electrónica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Materia`
--

CREATE TABLE `Materia` (
  `nCveMateria` int(11) NOT NULL,
  `sNombreMateria` varchar(20) NOT NULL,
  `nCreditos` smallint(6) NOT NULL,
  `nHT` smallint(6) NOT NULL,
  `nHP` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Materia`
--

INSERT INTO `Materia` (`nCveMateria`, `sNombreMateria`, `nCreditos`, `nHT`, `nHP`) VALUES
(1, 'Prog. en Web', 8, 2, 3),
(2, 'Prog. Básica Web', 8, 3, 3),
(3, 'Prog. Avanzada Web', 10, 3, 2),
(4, 'Frameworks', 8, 3, 2),
(5, 'Matemáticas I', 8, 3, 2),
(6, 'Intro a sist. info.', 6, 4, 0),
(7, 'Instrumentación', 8, 3, 2),
(8, 'Optoelectrónica', 10, 3, 2),
(9, 'Termodinámica', 7, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Reticula`
--

CREATE TABLE `Reticula` (
  `nCveCarrera` smallint(6) NOT NULL,
  `nCveMateria` int(11) NOT NULL,
  `nSemestre` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Reticula`
--

INSERT INTO `Reticula` (`nCveCarrera`, `nCveMateria`, `nSemestre`) VALUES
(1, 1, 1),
(1, 3, 1),
(1, 4, 2),
(1, 5, 3),
(2, 2, 1),
(2, 3, 2),
(2, 4, 2),
(2, 6, 4),
(3, 5, 3),
(3, 7, 5),
(3, 8, 6),
(4, 5, 3),
(4, 9, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `cve` char(10) NOT NULL,
  `sNombre` varchar(20) NOT NULL,
  `sApePat` varchar(20) NOT NULL,
  `sApeMat` varchar(20) DEFAULT NULL,
  `sContrasenia` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`cve`, `sNombre`, `sApePat`, `sApeMat`, `sContrasenia`) VALUES
('1', 'Clark', 'Kent', 'Villa Chica', '124'),
('11', 'Daniel', 'Larruso', NULL, ''),
('15', 'Rocky', 'Balboa', NULL, ''),
('4', 'Bruce', 'Wayne', 'DC', '126'),
('6', 'Juanito ', 'Farias', NULL, ''),
('7', 'Oliver', 'Quinn', NULL, ''),
('8', 'Lorenzo', 'Antonio', NULL, '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Alumno`
--
ALTER TABLE `Alumno`
  ADD PRIMARY KEY (`nNumControl`),
  ADD UNIQUE KEY `XPKAlumno` (`nNumControl`),
  ADD KEY `XIF1Alumno` (`nCveCarrera`),
  ADD KEY `XIF2Alumno` (`sCveUsuario`);

--
-- Indices de la tabla `Carrera`
--
ALTER TABLE `Carrera`
  ADD PRIMARY KEY (`nCveCarrera`),
  ADD UNIQUE KEY `XPKCarrera` (`nCveCarrera`);

--
-- Indices de la tabla `Grupo`
--
ALTER TABLE `Grupo`
  ADD PRIMARY KEY (`sCveGrupo`),
  ADD UNIQUE KEY `XPKGrupo` (`sCveGrupo`),
  ADD KEY `XIF1Grupo` (`nCveMateria`),
  ADD KEY `XIF2Grupo` (`nCveMaestro`);

--
-- Indices de la tabla `ListaGrupo`
--
ALTER TABLE `ListaGrupo`
  ADD PRIMARY KEY (`sCveGrupo`,`nNumControl`),
  ADD UNIQUE KEY `XPKListaGrupo` (`sCveGrupo`,`nNumControl`),
  ADD KEY `XIF1ListaGrupo` (`sCveGrupo`),
  ADD KEY `XIF2ListaGrupo` (`nNumControl`);

--
-- Indices de la tabla `Maestro`
--
ALTER TABLE `Maestro`
  ADD PRIMARY KEY (`nCveMaestro`),
  ADD UNIQUE KEY `XPKMaestro` (`nCveMaestro`);

--
-- Indices de la tabla `Materia`
--
ALTER TABLE `Materia`
  ADD PRIMARY KEY (`nCveMateria`),
  ADD UNIQUE KEY `XPKMateria` (`nCveMateria`);

--
-- Indices de la tabla `Reticula`
--
ALTER TABLE `Reticula`
  ADD PRIMARY KEY (`nCveCarrera`,`nCveMateria`),
  ADD UNIQUE KEY `XPKReticula` (`nCveCarrera`,`nCveMateria`),
  ADD KEY `XIF1Reticula` (`nCveCarrera`),
  ADD KEY `XIF2Reticula` (`nCveMateria`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`cve`),
  ADD UNIQUE KEY `XPKUsuario` (`cve`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
