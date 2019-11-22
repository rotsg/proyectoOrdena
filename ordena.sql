-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 22-11-2019 a las 10:49:52
-- Versión del servidor: 5.6.45-cll-lve
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ordena`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_cuentas`
--

CREATE TABLE `actividad_cuentas` (
  `id` int(255) NOT NULL,
  `id_usuario` int(255) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `tipo_actividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(255) NOT NULL,
  `categoria` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_propietario` int(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `id_propietario`, `status`) VALUES
(2, 'Bebidas', 1, 1),
(3, 'Postes', 1, 1),
(4, 'Platos fuertes', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(255) NOT NULL,
  `cliente` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenido_ordenes`
--

CREATE TABLE `contenido_ordenes` (
  `id` int(255) NOT NULL,
  `id_orden` int(255) NOT NULL,
  `id_producto` int(255) NOT NULL,
  `especificaciones` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `mesa` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `QR` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_propietario` int(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meseros`
--

CREATE TABLE `meseros` (
  `id` int(255) NOT NULL,
  `mesero` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_propietario` int(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `id` int(255) NOT NULL,
  `id_cliente` int(255) NOT NULL,
  `id_mesa` int(255) NOT NULL,
  `id_mesero` int(255) NOT NULL,
  `id_propietario` int(255) NOT NULL,
  `status` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `total` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetes`
--

CREATE TABLE `paquetes` (
  `id` int(11) NOT NULL,
  `paquete` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paquetes`
--

INSERT INTO `paquetes` (`id`, `paquete`, `descripcion`, `precio`) VALUES
(1, 'paquete 1', 'prueba', 100.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `producto` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio` float(10,2) NOT NULL,
  `id_categoria` int(255) NOT NULL,
  `id_propietario` int(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `producto`, `descripcion`, `precio`, `id_categoria`, `id_propietario`, `status`) VALUES
(3, 'Te de durazno cambio', 'prueba cambio', 20.00, 2, 1, 1),
(4, 'Te de canela cambio', 'prueba2 cambio', 18.00, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios`
--

CREATE TABLE `propietarios` (
  `id` int(255) NOT NULL,
  `propietario` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `restaurante` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_paquete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `propietarios`
--

INSERT INTO `propietarios` (`id`, `propietario`, `restaurante`, `email`, `password`, `id_paquete`) VALUES
(1, 'Roxana', 'Prueba', 'roxana', 'roxana', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad_cuentas`
--
ALTER TABLE `actividad_cuentas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_propietario` (`id_propietario`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contenido_ordenes`
--
ALTER TABLE `contenido_ordenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_orden` (`id_orden`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_propietario` (`id_propietario`);

--
-- Indices de la tabla `meseros`
--
ALTER TABLE `meseros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_propietario` (`id_propietario`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_mesa` (`id_mesa`),
  ADD KEY `id_mesero` (`id_mesero`),
  ADD KEY `id_propietario` (`id_propietario`);

--
-- Indices de la tabla `paquetes`
--
ALTER TABLE `paquetes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_propietario` (`id_propietario`);

--
-- Indices de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paquete` (`id_paquete`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad_cuentas`
--
ALTER TABLE `actividad_cuentas`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contenido_ordenes`
--
ALTER TABLE `contenido_ordenes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `meseros`
--
ALTER TABLE `meseros`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paquetes`
--
ALTER TABLE `paquetes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id`);

--
-- Filtros para la tabla `contenido_ordenes`
--
ALTER TABLE `contenido_ordenes`
  ADD CONSTRAINT `contenido_ordenes_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `ordenes` (`id`),
  ADD CONSTRAINT `contenido_ordenes_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD CONSTRAINT `mesas_ibfk_1` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id`);

--
-- Filtros para la tabla `meseros`
--
ALTER TABLE `meseros`
  ADD CONSTRAINT `meseros_ibfk_1` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id`);

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ordenes_ibfk_2` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id`),
  ADD CONSTRAINT `ordenes_ibfk_3` FOREIGN KEY (`id_mesero`) REFERENCES `meseros` (`id`),
  ADD CONSTRAINT `ordenes_ibfk_4` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id`);

--
-- Filtros para la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD CONSTRAINT `propietarios_ibfk_1` FOREIGN KEY (`id_paquete`) REFERENCES `paquetes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
