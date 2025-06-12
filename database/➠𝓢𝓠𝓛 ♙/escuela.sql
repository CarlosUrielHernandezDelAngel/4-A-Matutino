-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-03-2025 a las 01:59:01
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL,
  `numero_control` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `id_edad` int(11) NOT NULL,
  `id_colonia` int(11) NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `correo` varchar(15) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_ingreso` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `numero_control`, `nombre`, `apellido_paterno`, `apellido_materno`, `id_edad`, `id_colonia`, `id_especialidad`, `id_genero`, `correo`, `telefono`, `fecha_ingreso`) VALUES
(1, '45', 'Jesus', 'Vargas', 'Lorenzo', 6, 3, 1, 1, 'Yeso@gmail.com', '89890', '2025-03-15'),
(2, '24', 'Carlos', 'Hernandez', 'Del Angel', 4, 3, 1, 1, 'YO@gmail.com', '24240', '2025-03-18'),
(3, '00', 'Xiomara', 'Martinez', 'Diaz', 2, 2, 5, 2, 'ella@gmail.com', '45340', '2025-03-19'),
(4, '23', 'Jose', 'Jose', 'Guerrero', 2, 3, 6, 1, 'Jose@gmail.com', '34567', '2025-03-19'),
(5, '34', 'Roberto', 'Hernandez', '', 5, 2, 1, 1, 'Nose@gmail.com', '1240', '2025-03-19'),
(6, '04', 'Daniel', 'Vazquez', 'Barrientos', 3, 13, 1, 1, 'Daniel@gmail.co', '04040', '2025-03-21'),
(9, '54', 'Yennelis', 'Howell', 'Monserrat', 4, 9, 8, 2, 'Yeny@gmail.com', '54690', '2025-03-21'),
(10, '68', 'Tamara', 'Gonzales', 'Diaz', 5, 6, 5, 2, 'Tamara@gmail.co', '89760', '2025-03-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colonias`
--

CREATE TABLE `colonias` (
  `id` int(11) NOT NULL,
  `nombre_colonia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `colonias`
--

INSERT INTO `colonias` (`id`, `nombre_colonia`) VALUES
(8, 'Bugambilias'),
(11, 'Campestre'),
(5, 'Esfuerzo'),
(6, 'Freznos'),
(3, 'Granjas'),
(1, 'Jarachina Norte'),
(2, 'Jarachina Sur'),
(10, 'Loma\r\nReal'),
(7, 'Progreso'),
(13, 'San Valentín'),
(9, 'Ventura'),
(12, 'Vista Alta'),
(4, 'Vista Hermosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edades`
--

CREATE TABLE `edades` (
  `id` int(11) NOT NULL,
  `edad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `edades`
--

INSERT INTO `edades` (`id`, `edad`) VALUES
(1, 14),
(2, 15),
(3, 16),
(4, 17),
(5, 18),
(6, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id` int(11) NOT NULL,
  `nombre_especialidad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id`, `nombre_especialidad`) VALUES
(4, 'Administracion De Recursos Humanos'),
(5, 'CiberSeguridad'),
(9, 'Comercio Internacional'),
(7, 'Construccion'),
(10, 'Hoteleria'),
(6, 'Logistica'),
(3, 'Mantenimiento De Computo'),
(2, 'Mantenimiento Industrial'),
(8, 'Mecatronica'),
(1, 'Programacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id` int(11) NOT NULL,
  `nombre_genero` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `nombre_genero`) VALUES
(1, 'Hombre'),
(2, 'Mujer'),
(3, 'Otro');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_control` (`numero_control`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `id_edad` (`id_edad`),
  ADD KEY `id_colonia` (`id_colonia`),
  ADD KEY `id_especialidad` (`id_especialidad`),
  ADD KEY `id_genero` (`id_genero`);

--
-- Indices de la tabla `colonias`
--
ALTER TABLE `colonias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_colonia` (`nombre_colonia`);

--
-- Indices de la tabla `edades`
--
ALTER TABLE `edades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `edad` (`edad`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_especialidad` (`nombre_especialidad`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_genero` (`nombre_genero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `colonias`
--
ALTER TABLE `colonias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `edades`
--
ALTER TABLE `edades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`id_edad`) REFERENCES `edades` (`id`),
  ADD CONSTRAINT `alumnos_ibfk_2` FOREIGN KEY (`id_colonia`) REFERENCES `colonias` (`id`),
  ADD CONSTRAINT `alumnos_ibfk_3` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id`),
  ADD CONSTRAINT `alumnos_ibfk_4` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
