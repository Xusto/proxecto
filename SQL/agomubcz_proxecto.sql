-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Xerado en: 15 de Mar de 2018 ás 02:06
-- Versión do servidor: 10.2.13-MariaDB
-- Versión do PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agomubcz_proxecto`
--

-- --------------------------------------------------------

--
-- Estrutura da táboa `comentario`
--

CREATE TABLE `comentario` (
  `idcomentario` int(11) NOT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  `producto_idproducto` int(11) NOT NULL,
  `texto` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da táboa `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `descript` text DEFAULT NULL,
  `urlFoto` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da táboa `tenda`
--

CREATE TABLE `tenda` (
  `idtenda` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `enderezo` varchar(45) DEFAULT NULL,
  `codpostal` int(11) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `lonxitude` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A extraer os datos da táboa `tenda`
--

INSERT INTO `tenda` (`idtenda`, `nome`, `enderezo`, `codpostal`, `latitude`, `lonxitude`) VALUES
(1, 'Bico de Grao', 'Ronda das Fontiñas, 226', 27002, '43.00493', '-7.54713'),
(2, 'Naiterra', 'Avd. A Coruña, 169', 27003, '43.02000', ' 	-7.56311'),
(3, 'Natura Terra', 'R. Poeta Curros Enríquez, 26', 27004, '43.02072', '-7.56440'),
(4, 'A despensa do avó Francisco', 'R. Mallorca', 27003, '43.01978', '-7.56372'),
(5, 'Vaglume CSCA', 'R. Nóreas, 5', 27001, '43.01089', '-7.55390'),
(6, 'Mercado da Terra', 'Mercado Municipal (R. Quiroga Ballesteros)', 27001, '43.01228', '-7.55851');

-- --------------------------------------------------------

--
-- Estrutura da táboa `tenda_producto`
--

CREATE TABLE `tenda_producto` (
  `tenda_idtenda` int(11) NOT NULL,
  `producto_idproducto` int(11) NOT NULL,
  `prezo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da táboa `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nick` varchar(45) NOT NULL,
  `contrasinal` varchar(16) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `apelidos` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`idcomentario`,`usuario_idusuario`,`producto_idproducto`),
  ADD KEY `fk_comentario_usuario_idx` (`usuario_idusuario`),
  ADD KEY `fk_comentario_producto1_idx` (`producto_idproducto`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`);

--
-- Indexes for table `tenda`
--
ALTER TABLE `tenda`
  ADD PRIMARY KEY (`idtenda`);

--
-- Indexes for table `tenda_producto`
--
ALTER TABLE `tenda_producto`
  ADD PRIMARY KEY (`tenda_idtenda`,`producto_idproducto`),
  ADD KEY `fk_tenda_has_producto_producto1_idx` (`producto_idproducto`),
  ADD KEY `fk_tenda_has_producto_tenda1_idx` (`tenda_idtenda`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `nick_UNIQUE` (`nick`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comentario`
--
ALTER TABLE `comentario`
  MODIFY `idcomentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenda`
--
ALTER TABLE `tenda`
  MODIFY `idtenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricións para os envorcados das táboas
--

--
-- Restricións para a táboa `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_comentario_producto1` FOREIGN KEY (`producto_idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comentario_usuario` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restricións para a táboa `tenda_producto`
--
ALTER TABLE `tenda_producto`
  ADD CONSTRAINT `fk_tenda_has_producto_producto1` FOREIGN KEY (`producto_idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tenda_has_producto_tenda1` FOREIGN KEY (`tenda_idtenda`) REFERENCES `tenda` (`idtenda`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
