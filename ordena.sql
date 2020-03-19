-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 19, 2020 at 11:27 AM
-- Server version: 5.6.47-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ordena`
--

-- --------------------------------------------------------

--
-- Table structure for table `actividad_cuentas`
--

CREATE TABLE `actividad_cuentas` (
  `id` int(255) NOT NULL,
  `id_usuario` int(255) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `tipo_actividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` int(255) NOT NULL,
  `categoria` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_propietario` int(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `imagen` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `id_propietario`, `status`, `imagen`) VALUES
(2, 'Bebidas', 1, 1, 'bebidas.jpg'),
(3, 'Sopas y cremas', 1, 1, 'sopas.jpg'),
(5, 'Prueba', 1, 0, ''),
(6, 'Postres', 1, 1, 'postres.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` int(255) NOT NULL,
  `cliente` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_mesa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contenido_ordenes`
--

CREATE TABLE `contenido_ordenes` (
  `id` int(255) NOT NULL,
  `id_orden` int(255) NOT NULL,
  `id_producto` int(255) NOT NULL,
  `cantidad` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `mesa` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `QR` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_propietario` int(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mesas`
--

INSERT INTO `mesas` (`id`, `mesa`, `QR`, `id_propietario`, `status`) VALUES
(8, 'Mesa 6', 'Mesa 6.png', 1, 1),
(9, 'Mesa 7', 'Mesa 7.png', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `meseros`
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
-- Table structure for table `ordenes`
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
-- Table structure for table `paquetes`
--

CREATE TABLE `paquetes` (
  `id` int(11) NOT NULL,
  `paquete` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paquetes`
--

INSERT INTO `paquetes` (`id`, `paquete`, `descripcion`, `precio`) VALUES
(1, 'paquete 1', 'prueba', 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `producto` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio` float(10,2) NOT NULL,
  `id_categoria` int(255) NOT NULL,
  `id_propietario` int(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `imagen` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `producto`, `descripcion`, `precio`, `id_categoria`, `id_propietario`, `status`, `imagen`) VALUES
(1, 'Margarita', 'Bebida prueba para aplicación', 50.00, 2, 1, 1, 'margarita.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `propietarios`
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
-- Dumping data for table `propietarios`
--

INSERT INTO `propietarios` (`id`, `propietario`, `restaurante`, `email`, `password`, `id_paquete`) VALUES
(1, 'Roxana', 'Super Alitas', 'roxana', 'roxana', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actividad_cuentas`
--
ALTER TABLE `actividad_cuentas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_propietario` (`id_propietario`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contenido_ordenes`
--
ALTER TABLE `contenido_ordenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_orden` (`id_orden`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indexes for table `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_propietario` (`id_propietario`);

--
-- Indexes for table `meseros`
--
ALTER TABLE `meseros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_propietario` (`id_propietario`);

--
-- Indexes for table `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_mesa` (`id_mesa`),
  ADD KEY `id_mesero` (`id_mesero`),
  ADD KEY `id_propietario` (`id_propietario`);

--
-- Indexes for table `paquetes`
--
ALTER TABLE `paquetes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_propietario` (`id_propietario`);

--
-- Indexes for table `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paquete` (`id_paquete`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actividad_cuentas`
--
ALTER TABLE `actividad_cuentas`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `contenido_ordenes`
--
ALTER TABLE `contenido_ordenes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `meseros`
--
ALTER TABLE `meseros`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paquetes`
--
ALTER TABLE `paquetes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id`);

--
-- Constraints for table `contenido_ordenes`
--
ALTER TABLE `contenido_ordenes`
  ADD CONSTRAINT `contenido_ordenes_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `ordenes` (`id`),
  ADD CONSTRAINT `contenido_ordenes_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Constraints for table `mesas`
--
ALTER TABLE `mesas`
  ADD CONSTRAINT `mesas_ibfk_1` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id`);

--
-- Constraints for table `meseros`
--
ALTER TABLE `meseros`
  ADD CONSTRAINT `meseros_ibfk_1` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id`);

--
-- Constraints for table `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ordenes_ibfk_2` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id`),
  ADD CONSTRAINT `ordenes_ibfk_3` FOREIGN KEY (`id_mesero`) REFERENCES `meseros` (`id`),
  ADD CONSTRAINT `ordenes_ibfk_4` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id`);

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id`);

--
-- Constraints for table `propietarios`
--
ALTER TABLE `propietarios`
  ADD CONSTRAINT `propietarios_ibfk_1` FOREIGN KEY (`id_paquete`) REFERENCES `paquetes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
