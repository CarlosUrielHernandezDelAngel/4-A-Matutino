-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-04-2025 a las 09:02:44
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
-- Base de datos: `ia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicaciones`
--

CREATE TABLE `aplicaciones` (
  `id` int(11) NOT NULL,
  `aplicacion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aplicaciones`
--

INSERT INTO `aplicaciones` (`id`, `aplicacion`) VALUES
(1, 'Aisistente Virtual'),
(3, 'Análisis de Sentimiento'),
(6, 'Chatbots'),
(8, 'Detección de Fraude'),
(9, 'Medicina y Diagnóstico'),
(10, 'Optimización Industrial'),
(7, 'PLN (Procesamiento de Lenguaje Natural)'),
(4, 'Recomendadores'),
(2, 'Reconocimiento de Img/Video'),
(5, 'Vehículos Autónomos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inteligencias_artificiales`
--

CREATE TABLE `inteligencias_artificiales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `año_creacion` int(4) NOT NULL,
  `id_plataforma` int(11) NOT NULL,
  `id_modelo` int(11) NOT NULL,
  `id_lenguaje` int(11) NOT NULL,
  `id_interfaz` int(11) NOT NULL,
  `id_aplicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interfaces`
--

CREATE TABLE `interfaces` (
  `id` int(11) NOT NULL,
  `interfaz` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `interfaces`
--

INSERT INTO `interfaces` (`id`, `interfaz`) VALUES
(1, 'API (Interfaz de Programación de Aplicaciones)'),
(4, 'CLI (Interfaz de Línea de Comandos)'),
(5, 'GUI (Interfaz Gráfica de Usuario)'),
(2, 'RESTful APIs'),
(3, 'WebSockets');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lenguajes`
--

CREATE TABLE `lenguajes` (
  `id` int(11) NOT NULL,
  `lenguaje` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lenguajes`
--

INSERT INTO `lenguajes` (`id`, `lenguaje`) VALUES
(4, 'C++'),
(3, 'Java'),
(5, 'JavaScript'),
(6, 'Julia'),
(1, 'Python'),
(2, 'R'),
(7, 'SQL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos`
--

CREATE TABLE `modelos` (
  `id` int(11) NOT NULL,
  `modelo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modelos`
--

INSERT INTO `modelos` (`id`, `modelo`) VALUES
(3, 'Árboles de Decisión'),
(4, 'K-Vecinos Más Cercanos (KNN)'),
(2, 'Máquinas de Soporte Vectorial (SVM)'),
(7, 'Modelos de Lenguaje (Transformers)'),
(5, 'Modelos de Regresión'),
(6, 'Modelos Generativos (GANs)'),
(1, 'Redes Neuronales Artificiales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataformas`
--

CREATE TABLE `plataformas` (
  `id` int(11) NOT NULL,
  `plataforma` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plataformas`
--

INSERT INTO `plataformas` (`id`, `plataforma`) VALUES
(7, 'IBM Watson'),
(4, 'Keras'),
(6, 'Microsoft Azure AI'),
(5, 'OpenAI (incluyendo GPT)'),
(2, 'PyTorch'),
(3, 'Scikit-learn'),
(1, 'TensorFlow');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aplicaciones`
--
ALTER TABLE `aplicaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aplicacion` (`aplicacion`);

--
-- Indices de la tabla `inteligencias_artificiales`
--
ALTER TABLE `inteligencias_artificiales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_modelo` (`id_modelo`),
  ADD KEY `id_plataforma` (`id_plataforma`),
  ADD KEY `id_aplicacion` (`id_aplicacion`),
  ADD KEY `id_lenguaje` (`id_lenguaje`),
  ADD KEY `id_interfaz` (`id_interfaz`);

--
-- Indices de la tabla `interfaces`
--
ALTER TABLE `interfaces`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `interfaz` (`interfaz`);

--
-- Indices de la tabla `lenguajes`
--
ALTER TABLE `lenguajes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lenguaje` (`lenguaje`);

--
-- Indices de la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modelo` (`modelo`);

--
-- Indices de la tabla `plataformas`
--
ALTER TABLE `plataformas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plataforma` (`plataforma`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aplicaciones`
--
ALTER TABLE `aplicaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `inteligencias_artificiales`
--
ALTER TABLE `inteligencias_artificiales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `interfaces`
--
ALTER TABLE `interfaces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `lenguajes`
--
ALTER TABLE `lenguajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `plataformas`
--
ALTER TABLE `plataformas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inteligencias_artificiales`
--
ALTER TABLE `inteligencias_artificiales`
  ADD CONSTRAINT `inteligencias_artificiales_ibfk_1` FOREIGN KEY (`id_modelo`) REFERENCES `modelos` (`id`),
  ADD CONSTRAINT `inteligencias_artificiales_ibfk_2` FOREIGN KEY (`id_plataforma`) REFERENCES `plataformas` (`id`),
  ADD CONSTRAINT `inteligencias_artificiales_ibfk_3` FOREIGN KEY (`id_aplicacion`) REFERENCES `aplicaciones` (`id`),
  ADD CONSTRAINT `inteligencias_artificiales_ibfk_4` FOREIGN KEY (`id_lenguaje`) REFERENCES `lenguajes` (`id`),
  ADD CONSTRAINT `inteligencias_artificiales_ibfk_5` FOREIGN KEY (`id_interfaz`) REFERENCES `interfaces` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
