-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-08-2022 a las 22:26:32
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
-- Base de datos: `mantenmiento_vehiculo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_productos`
--

CREATE TABLE `categoria_productos` (
  `id_categoria_productos` int(11) NOT NULL,
  `descripcion_categoria` int(11) NOT NULL,
  `esatdo_categoria` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidos_cliente` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `cedula_cliente` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `provincia_cliente` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `canton_cliente` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `distrito_cliente` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion_cliente` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `esatdo_cliente` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_produtos`
--

CREATE TABLE `detalle_produtos` (
  `id_detalle_producto` int(11) NOT NULL,
  `codigo_producto` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion_producto` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `precio_producto` float(18,2) NOT NULL,
  `cantidad_producto` float(18,2) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_mantenimiento` int(11) NOT NULL,
  `fecha_detalle` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_mantenimiento`
--

CREATE TABLE `factura_mantenimiento` (
  `id_factura` int(11) NOT NULL,
  `numero_de_factura` int(11) NOT NULL,
  `id_mantenimiento` int(11) NOT NULL,
  `fecha_factura` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `sub_total` float(18,2) NOT NULL,
  `total_factura` float(18,2) NOT NULL,
  `estado_factura` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `codigo_producto` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion_producto` varchar(300) COLLATE utf8_spanish2_ci NOT NULL,
  `unidad_medida` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `precio_compra` float NOT NULL,
  `precio_venta` float NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `cantidad_stock` float NOT NULL,
  `estado_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_mantenimiento`
--

CREATE TABLE `registro_mantenimiento` (
  `id_mantenimiento` int(11) NOT NULL,
  `fecha_mantenimiento` date NOT NULL DEFAULT current_timestamp(),
  `id_clinte` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_detalle_productos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id_vehiculo` int(11) NOT NULL,
  `placa_vehiculo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `modelo_vehiculo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `color_vehiculo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `clase_vehiculo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `marca_vehiculo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo_combustible` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `ultima_revision` timestamp NOT NULL DEFAULT current_timestamp(),
  `proxima_revision` date NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_productos`
--
ALTER TABLE `categoria_productos`
  ADD PRIMARY KEY (`id_categoria_productos`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `detalle_produtos`
--
ALTER TABLE `detalle_produtos`
  ADD PRIMARY KEY (`id_detalle_producto`);

--
-- Indices de la tabla `factura_mantenimiento`
--
ALTER TABLE `factura_mantenimiento`
  ADD PRIMARY KEY (`id_factura`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `registro_mantenimiento`
--
ALTER TABLE `registro_mantenimiento`
  ADD PRIMARY KEY (`id_mantenimiento`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id_vehiculo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_productos`
--
ALTER TABLE `categoria_productos`
  MODIFY `id_categoria_productos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_produtos`
--
ALTER TABLE `detalle_produtos`
  MODIFY `id_detalle_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura_mantenimiento`
--
ALTER TABLE `factura_mantenimiento`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro_mantenimiento`
--
ALTER TABLE `registro_mantenimiento`
  MODIFY `id_mantenimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
