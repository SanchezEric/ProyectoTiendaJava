-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-04-2016 a las 12:23:32
-- Versión del servidor: 5.6.26
-- Versión de PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_tiendajava`
--
CREATE DATABASE IF NOT EXISTS `bd_tiendajava` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `bd_tiendajava`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_administrador`
--
-- Creación: 11-04-2016 a las 09:58:26
--

DROP TABLE IF EXISTS `tbl_administrador`;
CREATE TABLE IF NOT EXISTS `tbl_administrador` (
  `id_admin` int(11) NOT NULL,
  `user_admin` varchar(15) COLLATE utf8_bin NOT NULL,
  `mail_admin` varchar(40) COLLATE utf8_bin NOT NULL,
  `pwd_admin` varchar(10) COLLATE utf8_bin NOT NULL,
  `desc_admin` varchar(60) COLLATE utf8_bin NOT NULL,
  `nom_admin` varchar(15) COLLATE utf8_bin NOT NULL,
  `apellido_admin` varchar(25) COLLATE utf8_bin NOT NULL,
  `activo_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELACIONES PARA LA TABLA `tbl_administrador`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cliente`
--
-- Creación: 11-04-2016 a las 10:04:25
--

DROP TABLE IF EXISTS `tbl_cliente`;
CREATE TABLE IF NOT EXISTS `tbl_cliente` (
  `id_cliente` int(11) NOT NULL,
  `nom_cliente` varchar(15) COLLATE utf8_bin NOT NULL,
  `apellido_cliente` varchar(25) COLLATE utf8_bin NOT NULL,
  `desc_cliente` varchar(50) COLLATE utf8_bin NOT NULL,
  `mail_cliente` varchar(40) COLLATE utf8_bin NOT NULL,
  `pwd_cliente` varchar(10) COLLATE utf8_bin NOT NULL,
  `nif_cliente` varchar(9) COLLATE utf8_bin NOT NULL,
  `cpostal_cliente` varchar(5) COLLATE utf8_bin NOT NULL,
  `direccion_cliente` varchar(50) COLLATE utf8_bin NOT NULL,
  `activo_cliente` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELACIONES PARA LA TABLA `tbl_cliente`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_factura`
--
-- Creación: 11-04-2016 a las 10:15:20
--

DROP TABLE IF EXISTS `tbl_factura`;
CREATE TABLE IF NOT EXISTS `tbl_factura` (
  `id_factura` int(11) NOT NULL,
  `fecha_factura` date NOT NULL,
  `total_factura` decimal(10,0) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELACIONES PARA LA TABLA `tbl_factura`:
--   `id_cliente`
--       `tbl_cliente` -> `id_cliente`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_lineafactura`
--
-- Creación: 11-04-2016 a las 10:18:28
--

DROP TABLE IF EXISTS `tbl_lineafactura`;
CREATE TABLE IF NOT EXISTS `tbl_lineafactura` (
  `id_lineaFactura` int(11) NOT NULL,
  `cantidad_lineafactura` int(11) NOT NULL,
  `total_lineafactura` decimal(10,0) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELACIONES PARA LA TABLA `tbl_lineafactura`:
--   `id_factura`
--       `tbl_factura` -> `id_factura`
--   `id_producto`
--       `tbl_producto` -> `id_producto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_producto`
--
-- Creación: 11-04-2016 a las 09:56:33
--

DROP TABLE IF EXISTS `tbl_producto`;
CREATE TABLE IF NOT EXISTS `tbl_producto` (
  `id_producto` int(11) NOT NULL,
  `nom_product` varchar(25) COLLATE utf8_bin NOT NULL,
  `desc_product` varchar(100) COLLATE utf8_bin NOT NULL,
  `stock_product` int(11) NOT NULL,
  `descuento_product` int(11) DEFAULT NULL,
  `precio_product` decimal(10,0) NOT NULL,
  `activo_product` tinyint(1) NOT NULL,
  `tipo_product` varchar(20) COLLATE utf8_bin NOT NULL,
  `img_product` varchar(25) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELACIONES PARA LA TABLA `tbl_producto`:
--

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_administrador`
--
ALTER TABLE `tbl_administrador`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `tbl_factura`
--
ALTER TABLE `tbl_factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `tbl_lineafactura`
--
ALTER TABLE `tbl_lineafactura`
  ADD PRIMARY KEY (`id_lineaFactura`),
  ADD KEY `id_factura` (`id_factura`),
  ADD KEY `id_factura_2` (`id_factura`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_administrador`
--
ALTER TABLE `tbl_administrador`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_factura`
--
ALTER TABLE `tbl_factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_lineafactura`
--
ALTER TABLE `tbl_lineafactura`
  MODIFY `id_lineaFactura` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_factura`
--
ALTER TABLE `tbl_factura`
  ADD CONSTRAINT `tbl_factura_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`);

--
-- Filtros para la tabla `tbl_lineafactura`
--
ALTER TABLE `tbl_lineafactura`
  ADD CONSTRAINT `tbl_lineafactura_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `tbl_factura` (`id_factura`),
  ADD CONSTRAINT `tbl_lineafactura_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tbl_producto` (`id_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;