CREATE DATABASE  IF NOT EXISTS `fseletro` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `fseletro`;
-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: fseletro
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `idproduto` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `preco` float(8,2) DEFAULT NULL,
  `precofinal` float(8,2) DEFAULT NULL,
  `imagem` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idproduto`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'refrigerador','Refrigerador Electrolux,474litros,Branco-110v',3540.00,3330.00,'RefrigeradorElectrolux.png'),(2,'Refrigerador','Brastemp Frost Free Inverse 573 litros cor Inox com Smart Bar',4520.00,4300.00,'RefrigeradorBrastemp.png'),(3,'refrigerador','Refrigerador Consul Frost Free,405litros,Inox com filro-110v',3410.00,2620.90,'RefrigeradorConsul.png'),(4,'fogao','Fogão Consul 5 bocas,Forno limpa fácil-Branco',1289.90,1159.90,'FogaoConsul.png'),(5,'fogao','Fogão Atlas 4 bocas-Preto com mesa de vidro',1100.90,899.90,'FogaoAtlas.png'),(6,'fogao','Fogão Brastemp 5 bocas com botões removíveis e aro proteto-Inox',1679.90,1379.90,'FogaoBrastemp.png'),(7,'microondas','Micro-ondas Electrolux,31litros-Branco',599.90,479.90,'MicroondasElectrolux.png'),(8,'microondas','Micro-ondas Philco com função Time,Inox Espelhado',659.90,499.90,'MicroondasPhilco.png'),(9,'lavalouca','Lava-louça Brastemp,Compacta 8 serviços-Branca',1799.99,1559.99,'LavaloucaBrastemp.png'),(10,'lavalouca','Lava-louça Electrolux,14 serviços-Inox',4849.90,4349.90,'LavaloucaElectrolux.png'),(11,'lavadora','Lavadora de Roupas Philco Inverter 12KG-Branca',3299.90,3099.90,'LavadoraPhilco.png'),(12,'lavadora','Lavadora de Roupas Brastemp 15kg-Titânio',2379.90,2284.90,'LavadoraBrastemp.png');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comentarios`
--

DROP TABLE IF EXISTS `tb_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `mensagem` varchar(300) NOT NULL,
  `data` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comentarios`
--

LOCK TABLES `tb_comentarios` WRITE;
/*!40000 ALTER TABLE `tb_comentarios` DISABLE KEYS */;
INSERT INTO `tb_comentarios` VALUES (1,'Caroline','','2020-11-03 20:29:04'),(2,'Caroline','teste','2020-11-03 20:29:32');
/*!40000 ALTER TABLE `tb_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedidos`
--

DROP TABLE IF EXISTS `tb_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pedidos` (
  `idpedido` int(11) NOT NULL AUTO_INCREMENT,
  `idproduto` int(11) DEFAULT NULL,
  `nome_cliente` varchar(50) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `nome_produto` varchar(200) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_unitario` float(8,2) NOT NULL,
  `valor_total` float(8,2) NOT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `FK_pedidos_produtos` (`idproduto`),
  CONSTRAINT `FK_pedidos_produtos` FOREIGN KEY (`idproduto`) REFERENCES `produtos` (`idproduto`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedidos`
--

LOCK TABLES `tb_pedidos` WRITE;
/*!40000 ALTER TABLE `tb_pedidos` DISABLE KEYS */;
INSERT INTO `tb_pedidos` VALUES (1,NULL,'Rosa','Rua A','21 99999999','Refrigerador Electrolux,474litros,Branco-110v',1,3330.00,3330.00),(2,NULL,'Mauro','Rua Ceará','21 7777777','Refrigerador Electrolux,474litros,Branco-110v',1,3330.00,3330.00),(3,NULL,'Pedro','Rua Japonês','21 8888888','Fogão Consul 5 bocas,Forno limpa fácil-Branco',1,1159.90,1159.90),(4,10,'Luciana','Rua Norte,20 Piabetá Magé-RJ','(21)1111-1111','Lavadora de Roupas Brastemp 15kg-Titânio',1,2379.90,2284.90),(5,NULL,'Rita','Rua leblon,150 Santa Cruz Duque de Caxias-RJ','(21)1111-1111','Lavadora de Roupas Philco Inverter 12KG-Branca',1,3299.90,3099.90),(6,NULL,'Luan Macedo','Av. Princesa Isabel','22 99999999','Brastemp Frost Free Inverse 573 litros cor Inox com Smart Bar',1,4520.00,4300.00),(7,NULL,'Márcia Pereira','Rua Era ,Santa Clara, São Francisco do Itabapuana-RJ','22 99999999','Micro-ondas Electrolux,31litros-Branco',1,479.90,479.90),(8,NULL,'Márcia Pereira','Rua Era ,Santa Clara, São Francisco do Itabapuana-RJ','22 99999999','Micro-ondas Electrolux,31litros-Branco',1,479.90,479.90),(9,NULL,'Márcia Pereira','Rua Era ,Santa Clara, São Francisco do Itabapuana-RJ','22 99999999','Micro-ondas Electrolux,31litros-Branco',1,479.90,479.90),(10,NULL,'Iana Santos','Rua Florida,Serrado,Campos dos Goytacazes-RJ','22 222222222','Refrigerador Electrolux,474litros,Branco-110v',1,3330.00,3330.00),(11,NULL,'Iana Santos','Rua Florida,Serrado,Campos dos Goytacazes-RJ','22 222222222','Refrigerador Electrolux,474litros,Branco-110v',1,3330.00,3330.00),(12,NULL,'Iana Santos','Rua Florida,Serrado,Campos dos Goytacazes-RJ','22 222222222','Refrigerador Electrolux,474litros,Branco-110v',1,3330.00,3330.00),(13,NULL,'Fernanda Cunha','Rua Santa Elisa,Piabetá,Magé-RJ','21333333333','Lavadora de Roupas Philco Inverter 12KG-Branca',1,3299.90,3299.90);
/*!40000 ALTER TABLE `tb_pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-05 12:09:44
