-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Xerado en: 16 de Mar de 2018 ás 09:14
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

--
-- A extraer os datos da táboa `comentario`
--

INSERT INTO `comentario` (`idcomentario`, `usuario_idusuario`, `producto_idproducto`, `texto`) VALUES
(2, 1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed bibendum sem sit amet dolor varius malesuada id sed mauris. Duis nec dolor est. Ut ultrices.'),
(3, 3, 1, 'felis at suscipit tempor, purus diam eleifend mi, consequat ullamcorper mi lacus id orci. Curabitur sagittis aliquam l'),
(4, 3, 1, 'Duis tempor, lectus at auctor consequat, felis est euismod nunc, eu facilisis est arcu a leo. Donec vulputate justo lacus, sit amet interdum nisi consequat eget. '),
(5, 1, 9, 'Duis tempor, lectus at auctor consequat, felis est euismod nunc, eu facilisis est arcu a leo. Donec vulputate justo lacus, sit amet interdum nisi consequat eget. ');

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

--
-- A extraer os datos da táboa `producto`
--

INSERT INTO `producto` (`idproducto`, `nome`, `descript`, `urlFoto`) VALUES
(1, 'Soia texturizada fina', 'Venta a granel de soia texturizada por kg', ''),
(2, 'Guaranito', 'Refresco feito a base de guaraná', ''),
(3, 'Chocolate', '90% cacao, de producción ecolóxica e comercio xusto', ''),
(4, 'Mazás a granel', 'Valor por kg', ''),
(5, 'Arroz redondo semi integral', 'Arroz redondo con denominación de orixe', ''),
(6, 'Cacao instant', 'Cacao ecolóxico de comercio xusto1', ''),
(7, 'Stevia', 'Stevia molida de orixe galego', ''),
(8, 'Soia texturizada grosa', 'Venta a granel de soia texturizada por kg', ''),
(9, 'Caixa de froita e verdura de temporada', 'Caixa elaborada semanalmente coas froitas e verduras de cercanías', ''),
(10, 'Leite ecolóxica', 'Leite galego de producción ecolóxica', ''),
(11, 'Leite de avea', 'Bebida de avea de producción ecolóxica', '');

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

--
-- A extraer os datos da táboa `tenda_producto`
--

INSERT INTO `tenda_producto` (`tenda_idtenda`, `producto_idproducto`, `prezo`) VALUES
(1, 1, 2.4),
(1, 2, 1),
(1, 3, 3),
(1, 6, 2.1),
(1, 8, 2.4),
(1, 9, 5),
(1, 10, 1.3),
(1, 11, 1.1),
(1, 12, 1),
(1, 13, 1),
(1, 14, 1),
(1, 15, 1),
(1, 16, 1),
(2, 2, 1.1),
(2, 6, 2.1),
(2, 8, 2.4),
(2, 9, 5),
(2, 10, 1.3),
(3, 6, 2.1),
(3, 10, 1.3),
(3, 11, 1.1),
(4, 1, 3.2),
(4, 4, 0.6),
(4, 7, 3.9),
(5, 1, 3.2),
(5, 4, 0.6),
(5, 6, 2.1),
(5, 7, 3.9),
(5, 17, 5),
(6, 1, 3.2),
(6, 4, 0.6),
(6, 6, 2.1),
(6, 7, 3.9);

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
-- A extraer os datos da táboa `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nick`, `contrasinal`, `nome`, `apelidos`) VALUES
(1, 'usrproba', 'usrproba', 'usuario', 'proba'),
(3, 'usr2', 'usr2', 'usuario2', 'segundo'),
(4, 'usr3', 'usr3', 'usuario3', 'terceiro');

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
  MODIFY `idcomentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tenda`
--
ALTER TABLE `tenda`
  MODIFY `idtenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
