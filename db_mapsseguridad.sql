-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-08-2020 a las 22:13:22
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_mapsseguridad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivos`
--

CREATE TABLE `dispositivos` (
  `Id` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `UUID` varchar(300) NOT NULL,
  `manufacture` varchar(300) NOT NULL,
  `model` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dispositivos`
--

INSERT INTO `dispositivos` (`Id`, `Fecha`, `UUID`, `manufacture`, `model`) VALUES
(1, '2020-07-27', '0983218301830183091803', 'Motorola XT1032 would return \"motorola\"', 'Motorola Droid'),
(2, '2020-08-04', 'uuid p', 'manu p', 'modelo p'),
(3, '2020-08-04', 'uuid p', 'manu p', 'modelo p'),
(4, '2020-08-05', 'uuid p', 'manu p', 'modelo p'),
(5, '2020-08-05', 'uuid p', 'manu p', 'modelo p'),
(6, '2020-08-05', 'uuid p', 'manu p', 'modelo p'),
(7, '2020-08-05', 'uuid p', 'manu p', 'modelo p'),
(8, '2020-08-05', '4427b735174cc8bf', 'samsung', 'SM-A207M');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posiciones`
--

CREATE TABLE `posiciones` (
  `Id_Dis` int(11) NOT NULL,
  `Latitud` varchar(20) NOT NULL,
  `Longitud` varchar(20) NOT NULL,
  `Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `posiciones`
--

INSERT INTO `posiciones` (`Id_Dis`, `Latitud`, `Longitud`, `Fecha`) VALUES
(1, '-1.3105168', '-78.510071', '2020-08-03 08:09:00'),
(1, '-1.3304075', '-78.523326', '2020-08-03 13:00:00'),
(1, '-1.2323', '-78.510071', '2020-08-02 09:13:17'),
(1, '-1.343', ' -78.52332', '2020-08-04 05:09:00'),
(7, '-1.98787', '-78.98989', '2020-08-05 10:50:11'),
(8, '-1.3100342', '-78.5111377', '2020-08-05 11:47:35'),
(8, '-1.3100716', '-78.5111508', '2020-08-05 11:48:36'),
(8, '-1.3100965', '-78.5111595', '2020-08-05 12:09:04'),
(8, '-1.3100729', '-78.511063', '2020-08-05 12:09:50'),
(8, '-1.3100849', '-78.5110383', '2020-08-05 12:10:39'),
(8, '-1.3100774', '-78.5111555', '2020-08-05 12:11:29'),
(8, '-1.3304075', ' -78.523326', '2020-08-05 08:00:00'),
(8, '-1.3100793', '-78.5111196', '2020-08-05 12:13:53'),
(8, '-1.3100737', '-78.5111537', '2020-08-05 12:16:06'),
(8, '-1.3100776', '-78.511157', '2020-08-05 12:21:44'),
(8, '-1.3100818', '-78.5111616', '2020-08-05 12:22:35'),
(8, '-1.3100796', '-78.5111503', '2020-08-05 12:30:48'),
(8, '-1.3100718', '-78.5111532', '2020-08-05 12:31:38'),
(8, '-1.3100819', '-78.5111585', '2020-08-05 12:44:59'),
(8, '-1.310069', '-78.5111428', '2020-08-05 13:04:38'),
(8, '-1.3100765', '-78.5111406', '2020-08-05 13:19:06'),
(8, '-1.3100759', '-78.5111588', '2020-08-05 13:19:57'),
(8, '-1.3100758', '-78.5111546', '2020-08-05 13:20:47'),
(8, '-1.3100774', '-78.5111556', '2020-08-05 13:21:37'),
(8, '-1.3100635', '-78.5111556', '2020-08-05 13:22:34'),
(8, '-1.310093', '-78.5111478', '2020-08-05 13:23:26');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `posiciones`
--
ALTER TABLE `posiciones`
  ADD KEY `FaraneKey` (`Id_Dis`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `posiciones`
--
ALTER TABLE `posiciones`
  ADD CONSTRAINT `FaraneKey` FOREIGN KEY (`Id_Dis`) REFERENCES `dispositivos` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
