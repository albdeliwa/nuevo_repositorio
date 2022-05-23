-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2022 a las 14:03:18
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agenda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro`
--

CREATE TABLE `centro` (
  `id_centro` int(10) UNSIGNED NOT NULL,
  `nombre_centro` varchar(100) NOT NULL,
  `telefono_centro` int(9) NOT NULL,
  `direccion_centro` varchar(100) NOT NULL,
  `email_centro` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `centro`
--

INSERT INTO `centro` (`id_centro`, `nombre_centro`, `telefono_centro`, `direccion_centro`, `email_centro`) VALUES
(3, 'hospital', 666666666, 'malaga', 'hops@hotmail.com'),
(4, 'xanit', 444555666, 'benalmadena', 'xan@hotmail.com'),
(5, 'VIRGEN DEL ROCIO', 999888777, 'SEVILLA', 'vdr@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id_persona` int(10) UNSIGNED NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(256) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `dni` varchar(9) NOT NULL DEFAULT '99999999X',
  `n_referencia` varchar(9) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id_persona`, `usuario`, `clave`, `nombre`, `apellidos`, `dni`, `n_referencia`, `email`, `telefono`) VALUES
(43, 'edf', '123', 'EDF', 'EDF', 'A1234567F', '987654321', 'edf@hotmail.com', 666777888),
(44, 'asd', '123', 'ASD', 'ASD', '12345678B', '987654421', 'adfd@hotmail.com', 666777866);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `id_turno` int(10) UNSIGNED NOT NULL,
  `fecha_turno` date NOT NULL,
  `tipo_turno` enum('Mañana','Tarde','Noche') NOT NULL,
  `titular` int(10) UNSIGNED NOT NULL,
  `suplente` int(10) UNSIGNED DEFAULT NULL,
  `estado` enum('Pendiente','vendido','comprado') DEFAULT NULL,
  `id_persona` int(10) UNSIGNED DEFAULT NULL,
  `id_centro` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`id_turno`, `fecha_turno`, `tipo_turno`, `titular`, `suplente`, `estado`, `id_persona`, `id_centro`) VALUES
(22, '2022-05-02', 'Mañana', 43, 44, 'comprado', 43, 4),
(25, '2022-05-14', 'Mañana', 43, 0, 'Pendiente', 43, 5),
(26, '2022-05-13', 'Mañana', 44, 43, 'comprado', 44, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `centro`
--
ALTER TABLE `centro`
  ADD PRIMARY KEY (`id_centro`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id_turno`),
  ADD KEY `fk_idPersona` (`id_persona`),
  ADD KEY `fk2_idCentro` (`id_centro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `centro`
--
ALTER TABLE `centro`
  MODIFY `id_centro` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id_persona` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `id_turno` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
