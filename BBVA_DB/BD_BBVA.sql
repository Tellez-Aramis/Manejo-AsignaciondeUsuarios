CREATE DATABASE  IF NOT EXISTS `bd_datos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_datos`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_datos
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `beneficiarios`
--

DROP TABLE IF EXISTS `beneficiarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficiarios` (
  `AÃ±oContrato` int NOT NULL,
  `Siglas` varchar(3) NOT NULL,
  `FechaNacimiento` varchar(10) NOT NULL,
  `DiferenciadorContrato` char(1) NOT NULL,
  `Telefono` bigint DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `ApellidoP` varchar(30) DEFAULT NULL,
  `ApellidoM` varchar(30) DEFAULT NULL,
  `Parentesco` varchar(20) DEFAULT NULL,
  `FechaNacimientoBeneficiario` varchar(10) DEFAULT NULL,
  `CURP` varchar(4) DEFAULT NULL,
  `CURP_FECHA` varchar(10) DEFAULT NULL,
  `CURP_SEXO` char(1) DEFAULT NULL,
  `CURP_ESTADO` varchar(2) DEFAULT NULL,
  `CURP_ConsoHomo` varchar(15) DEFAULT NULL,
  `Domicilio_Calle` varchar(50) DEFAULT NULL,
  `Domicilio_Numero` varchar(105) DEFAULT NULL,
  `Domicilio_Col` varchar(50) DEFAULT NULL,
  `Domicilio_Ciudad` varchar(50) DEFAULT NULL,
  `Domicilio_Estado` varchar(50) DEFAULT NULL,
  `Correo_Nicname` varchar(20) DEFAULT NULL,
  `Correo_Direccion` varchar(105) DEFAULT NULL,
  PRIMARY KEY (`AÃ±oContrato`,`Siglas`,`FechaNacimiento`,`DiferenciadorContrato`),
  CONSTRAINT `beneficiarios_ibfk_1` FOREIGN KEY (`AÃ±oContrato`, `Siglas`, `FechaNacimiento`, `DiferenciadorContrato`) REFERENCES `contratos` (`AÃ±oContrato`, `Siglas`, `FechaNacimiento`, `DiferenciadorContrato`),
  CONSTRAINT `Check_Sexo` CHECK (((`CURP_SEXO` is null) or (`CURP_SEXO` in (_utf8mb4'M',_utf8mb4'H')))),
  CONSTRAINT `Fechass` CHECK ((regexp_like(`FechaNacimiento`,_utf8mb4'^[0-9]{4}/[0-9]{2}/[0-9]{2}$') and (str_to_date(`FechaNacimiento`,_utf8mb4'%Y/%m/%d') is not null))),
  CONSTRAINT `Fechass2` CHECK (((`FechaNacimientoBeneficiario` is null) or (regexp_like(`FechaNacimientoBeneficiario`,_utf8mb4'^[0-9]{2}/[0-9]{2}/[0-9]{4}$') and (str_to_date(`FechaNacimientoBeneficiario`,_utf8mb4'%d/%m/%Y') is not null)))),
  CONSTRAINT `Fechass3` CHECK (((`CURP_FECHA` is null) or (regexp_like(`CURP_FECHA`,_utf8mb4'^[0-9]{2}/[0-9]{2}/[0-9]{2}$') and (str_to_date(`CURP_FECHA`,_utf8mb4'%d/%m/%y') is not null))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiarios`
--

LOCK TABLES `beneficiarios` WRITE;
/*!40000 ALTER TABLE `beneficiarios` DISABLE KEYS */;
INSERT INTO `beneficiarios` VALUES (2007,'LPJ','1975/04/10','A',3398563214,'Maria','Perez','Hernandez','Madre','29/10/1955','PEHM','29/10/55','M','JC','RRC07','Patria','305',NULL,'Prados Providencia','Guadalajara','Jalisco','Mariperez@gmail.com'),(2008,'RSA','1990/12/25','A',5521478963,'Carlos','Ramirez','Sanchez','Hermano','26/03/1975','RASC','26/03/75','H','DF','MNL05','Campeche','98',NULL,'Condesa','Ciudad de MÃ©xico','CDMX','carlosRS@gmail.com'),(2008,'RSA','1990/12/25','B',5578965412,'Laura','SÃ¡nchez','GÃ³mez','Madre','13/08/1962','SAGL','13/08/62','M','DF','RRR03','Campeche','98',NULL,'Condesa','Ciudad de MÃ©xico','CDMX','Laura@gmail.com'),(2009,'RMG','1983/05/22','A',8145670923,'Mariana','Ramirez','Torres','Esposa','30/11/1985','GOTM','30/11/85','M','NL','PSL04','Padre Mier','310',NULL,'Centro','Monterrey','Nuevo LeÃ³n','mariana.gomez@gmail.com'),(2009,'RMG','1983/05/22','B',8111223344,'Ricardo','GÃ³mez','Torres','Hijo','14/07/2000','GTR0','14/07/00','H','NL','NRD04','Padre Mier','310',NULL,'Centro','Monterrey','Nuevo LeÃ³n','ricardo.jr@email.com'),(2009,'RMG','1983/05/22','C',8122334455,'Juan Manuel','GÃ³mez','GarcÃ­a','Padre','18/01/1955','GGJM','18/01/55','H','NL','NRN05','Allende','150',NULL,'Centro','Monterrey','Nuevo LeÃ³n','juan.gomez@email.com'),(2010,'DRM','1988/05/30','A',8154781269,'Ricardo','Diaz','Soto','Padre','18/04/1967','DISR','18/04/67','H','NL','ZRCKP2','LÃ¡zaro CÃ¡rdenas','730',NULL,'Residencial San AgustÃ­n','Monterrey','Nuevo LeÃ³n','SotoDiaz@gmail.com'),(2010,'DRM','1988/05/30','B',8196321457,'Diego','DÃ­az','Ruiz','Hermano','07/07/1995','DIRD','07/07/95','H','NL','ZRG05','LÃ¡zaro CÃ¡rdenas','730',NULL,'Residencial San AgustÃ­n','Monterrey','Nuevo LeÃ³n','diego.diaz@gmail.com'),(2010,'DRM','1988/05/30','C',8123456789,'Laura','Ruiz','GonzÃ¡lez','Madre','22/08/1978','RUGL','22/08/78','M','NL','ZNR02','LÃ¡zaro CÃ¡rdenas','730',NULL,'Residencial San AgustÃ­n','Monterrey','Nuevo LeÃ³n','laura.ruiz@mail.com'),(2011,'CHH','1986/09/12','A',5532145687,'Daniel','Cruz','HernÃ¡ndez','Hijo','25/05/2003','CUHD','25/05/03','H','DF','RRL01','Xola','159',NULL,'Ã�lamos','Ciudad de MÃ©xico','CDMX','danielcruz@gmail.com'),(2011,'CHH','1986/09/12','B',5590909090,'Ana SofÃ­a','Cruz','HernÃ¡ndez','Hija','05/04/2005','CHRA','05/04/05','M','DF','NSN02','Xola','159',NULL,'Ã�lamos','Ciudad de MÃ©xico','CDMX','ana.cruz@email.com'),(2012,'MGL','1982/03/15','A',5523698741,'SofÃ­a','Martinez','Ramirez','Hija','14/02/2008','MARS','08/02/14','M','DF','RZF09','Donceles','150',NULL,'Centro HistÃ³rico','Ciudad de MÃ©xico','CDMX','Sofim@gmail.com'),(2012,'MGL','1982/03/15','B',5547896521,'Rodrigo','Martinez','Perez','Padre','17/06/1950','MAPR','17/06/50','H','DF','RRD08','Donceles','150',NULL,'Centro HistÃ³rico','Ciudad de MÃ©xico','CDMX','Rodrigo@gmail.com'),(2012,'MGL','1982/03/15','C',5532587412,'Elena','GonzÃ¡lez','LÃ³pez','Madre','05/09/1952','GOLE','05/09/52','M','DF','RRL02','Donceles','150',NULL,'Centro HistÃ³rico','Ciudad de MÃ©xico','CDMX','elena@gmail.com'),(2013,'MCV','1995/09/07','A',3378549231,'Fernanda','Morales','Cabrera','Hermana','19/01/1992','MOCF','19/01/92','M','JC','NRL07','JuÃ¡rez','456',NULL,'Americana','Guadalajara','Jalisco','fernandamc@gmail.com'),(2014,'RML','1993/11/18','A',7223014579,'Andrea','Reyes','Mendoza','Hermana','10/08/1990','REMA','10/08/90','M','DF','NRN02','Benito JuÃ¡rez','45',NULL,'Centro','Toluca','Estado de MÃ©xico','andrea.reyes@gmail.com'),(2014,'RML','1993/11/18','B',5587654321,'Teresa','Mendoza','Rios','Madre','12/06/1965','MERT','12/06/65','M','DF','RRS08','Morelos','120',NULL,'Centro','Toluca','Estado de MÃ©xico','teresa@email.com'),(2017,'PRX','2004/04/04','A',3329994411,'MarÃ­a Elena','RoldÃ¡n','DÃ­az','Hermana','18/07/2000','RODM','18/07/00','M','JC','LRN03','Av. Patria','765',NULL,'Jardines Universidad','Zapopan','Jalisco','maria@gmail.com'),(2017,'PRX','2004/04/04','B',3337778899,'LucÃ­a','Palacios','Medina','Abuela','03/02/1955','PAML','03/02/55','M','JC','LMC02','Tulipanes','45',NULL,'Ciudad del Sol','Zapopan','Jalisco','lucia.palacios55@hotmail.com'),(2018,'RGV','2002/10/12','A',8166778844,'Carolina','Garcia','LÃ³pez','TÃ­a','22/11/1980','GALC','22/11/80','M','NL','RPR06','Fresno','58',NULL,'Cumbres 4to sector','Monterrey','Nuevo LeÃ³n','carolina.G@yahoo.com'),(2018,'RGV','2002/10/12','B',8151117766,'JosÃ© Miguel','Ramirez','Perez','Padre','09/01/1973','RAPJ','09/01/73','H','NL','RZS04','Sauce','290',NULL,'Cumbres Elite','Monterrey','Nuevo LeÃ³n','jose.ramirez73@gmail.com'),(2019,'ACD','2001/05/01','A',8133442211,'Laura','Cano','Torres','Madre','15/03/1976','CATL','15/03/76','M','NL','LRR03','Calle Magnolia','134',NULL,'Mitras Centro','Monterrey','Nuevo LeÃ³n','laura.c@gmail.com'),(2019,'BRA','1988/05/04','A',3341268894,'Luis Alberto','Betancourt','Torres','Padre','23/11/1965','BETL','23/11/65','H','JC','TRS01','Acueducto','1021',NULL,'Jardines del Country','Guadalajara','Jalisco','luis.betancourt65@hotmail.com'),(2019,'BRA','1988/05/04','B',3336627965,'Fabricio','Martinez','MartÃ­nez','Esposo','14/12/1987','MAMF','14/12/87','H','DF','RRB08','Ontario','256',NULL,'Providencia 1Âª SecciÃ³n','Guadalajara','Jalisco','fmartinez@hotmail.com'),(2020,'JHR','2003/11/28','A',3372113344,'MartÃ­n','Jimenez','Soto','Hermano','05/06/1999','JISM','05/06/99','H','JC','LRT09','Pedro Moreno','1210',NULL,'Americana','Guadalajara','Jalisco','martin.jimenez99@gmail.com'),(2020,'JHR','2003/11/28','B',3362221133,'Teresa','Huerta','Medina','Madre','27/05/1974','HUTT','27/05/74','M','JC','LDR01','Pedro Moreno','1210',NULL,'Americana','Guadalajara','Jalisco','teresa.huerta74@yahoo.com'),(2021,'CVE','1992/03/17','A',5536812045,'MarÃ­a Guadalupe','Ventura','Herrera','Madre','10/05/1968','VEHM','10/05/68','M','DF','RRR07','Insurgentes Norte','725',NULL,'Lindavista','Gustavo A. Madero','CDMX','maria.ventura68@gmail.com'),(2023,'FMM','2005/07/08','A',5578904563,'Carlos','Fernandez','Rojas','Padre','15/11/1978','FERO','15/11/78','H','DF','JSR05','Av de las Minas','10',NULL,'Xalpa','Iztapalapa','CDMX','cfer1978@gmail.com'),(2023,'FMM','2005/07/08','B',5571206963,'Estefania','Hernandez','Maya','Madre','05/10/1980','HEME','05/10/80','M','DF','JXR15','Av de las Minas','10',NULL,'Xalpa','Iztapalapa','CDMX','Maya78@gmail.com'),(2023,'FMM','2005/07/08','C',5545678901,'Ana SofÃ­a','Fernandez','Maya','Hermana','15/09/2007','FEAA','15/09/07','M','DF','RNS05','Av de las Minas','10',NULL,'Xalpa','Iztapalapa','CDMX','ana.fernandez@gmail.com'),(2023,'NLZ','1993/06/15','A',8136751240,'Diego Armando','Loyola','Vargas','Hermano','30/09/1995','LOVD','30/09/95','H','NL','VRG06','Lincoln','345',NULL,'Cumbres 4Âº Sector','Monterrey','Nuevo LeÃ³n','diego.loy@gmail.com'),(2023,'NLZ','1993/06/15','B',8128593704,'Sofia','Navarrete','Loyola','Hermana','12/08/2004','NALS','12/08/04','M','DF','VYFA0','Lincoln','345',NULL,'Cumbres 4Âº Sector','Monterrey','Nuevo LeÃ³n','sofindgr@gmail.com'),(2023,'SVD','2005/08/24','A',5567891234,'Laura','Ramirez','Vilchis','Madre','22/07/1987','RAVL','22/07/85','M','DF','LLR09','Carranza','4',NULL,'Progresista','Iztapalapa','CDMX','laurasv@outlook.com'),(2023,'SVD','2005/08/24','B',5545241234,'Oscar','Salgado','Torres','Padre','12/04/1985','SATO','12/04/85','H','DF','LLR12','Carranza','4',NULL,'Progresista','Iztapalapa','CDMX','Oscar@outlook.com'),(2024,'ACE','1991/07/22','A',5547293168,'Sandra Beatriz','Cornejo','Morales','TÃ­a','07/08/1974','COMS','07/08/74','M','DF','MRL04','Campeche','110',NULL,'HipÃ³dromo','CuauhtÃ©moc','CDMX','sandra.c@outlook.com'),(2024,'MRE','2005/03/16','A',5589012345,'Ana','Romo','Hernandez','Madre','10/02/1989','ROHA','10/02/89','M','DF','MRN03','JosÃ© MarÃ­a Pino SuÃ¡rez','S/N',NULL,'Centro HistÃ³rico','CuauhtÃ©moc','CDMX','anaromo@yahoo.com'),(2024,'MRE','2005/03/16','B',5589012345,'Ernesto','Mendoza','Martinez','Padre','11/11/1983','MEME','11/11/83','H','DF','MRN08','JosÃ© MarÃ­a Pino SuÃ¡rez','S/N',NULL,'Centro HistÃ³rico','CuauhtÃ©moc','CDMX','Mendz066@yahoo.com'),(2025,'BMC','2005/06/04','A',5590123456,'Ricardo','Bernal','DÃ­az','Padre','05/12/1979','BEDR','05/12/79','H','DF','RZC08','Felipe Angeles','174',NULL,'Francisco Villa','Iztapalapa','CDMX','ricbernal@hotmail.com'),(2025,'BMC','2005/06/04','B',5590123456,'Margarita','Gatica','Martinez','Madre','25/12/1985','MAGM','25/12/85','M','DF','RZC07','Felipe Angeles','174',NULL,'Francisco Villa','Iztapalapa','CDMX','margarita@hotmail.com');
/*!40000 ALTER TABLE `beneficiarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora_clientes`
--

DROP TABLE IF EXISTS `bitacora_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_clientes` (
  `Cve` int NOT NULL AUTO_INCREMENT,
  `Operacion` enum('INSERT','UPDATE','DELETE') DEFAULT NULL,
  `IP_Equipo` varchar(100) DEFAULT NULL,
  `Usuario` varchar(100) DEFAULT NULL,
  `FechaHora_operac` datetime DEFAULT NULL,
  `NumeroCliente_Ant` bigint DEFAULT NULL,
  `Nombre_Ant` varchar(50) DEFAULT NULL,
  `ApellidoP_Ant` varchar(30) DEFAULT NULL,
  `Vigente_Ant` varchar(2) DEFAULT NULL,
  `Correo_Ant` varchar(100) DEFAULT NULL,
  `NumeroCliente_New` bigint DEFAULT NULL,
  `Nombre_New` varchar(50) DEFAULT NULL,
  `ApellidoP_New` varchar(30) DEFAULT NULL,
  `Vigente_New` varchar(2) DEFAULT NULL,
  `Correo_New` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_clientes`
--

LOCK TABLES `bitacora_clientes` WRITE;
/*!40000 ALTER TABLE `bitacora_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora_productos`
--

DROP TABLE IF EXISTS `bitacora_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_productos` (
  `Cve` int NOT NULL AUTO_INCREMENT,
  `Operacion` enum('INSERT','UPDATE','DELETE') DEFAULT NULL,
  `IP_Equipo` varchar(100) DEFAULT NULL,
  `Usuario` varchar(100) DEFAULT NULL,
  `FechaHora_operac` datetime DEFAULT NULL,
  `IDProducto_Ant` varchar(10) DEFAULT NULL,
  `NombreProducto_Ant` varchar(50) DEFAULT NULL,
  `IDProducto_New` varchar(10) DEFAULT NULL,
  `NombreProducto_New` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cve`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_productos`
--

LOCK TABLES `bitacora_productos` WRITE;
/*!40000 ALTER TABLE `bitacora_productos` DISABLE KEYS */;
INSERT INTO `bitacora_productos` VALUES (1,'UPDATE','Leack','root@localhost','2025-11-04 00:22:49','PROD-003','CrÃ©ditos y PrÃ©stamo','PROD-003','Créditos y Prestamos'),(2,'DELETE','Leack','root@localhost','2025-11-04 00:27:31','PROD-008','Tarjeta de dÃ©bito',NULL,NULL),(3,'INSERT','Leack','root@localhost','2025-11-04 00:27:42',NULL,NULL,'PROD-008','Tarjeta de Débito'),(4,'INSERT','Leack','root@localhost','2025-11-04 00:59:23',NULL,NULL,'PROD-010','Fondo InversiÂ¢n Global'),(5,'INSERT','Leack','root@localhost','2025-11-04 00:59:23',NULL,NULL,'PROD-012','Cuenta Empresarial Pro'),(6,'INSERT','Leack','root@localhost','2025-11-04 00:59:23',NULL,NULL,'PROD-013','Crâ€šdito Hipotecario Flex'),(7,'INSERT','Leack','root@localhost','2025-11-04 00:59:23',NULL,NULL,'PROD-014','Tarjeta Crâ€šdito Oro'),(8,'INSERT','Leack','root@localhost','2025-11-04 00:59:23',NULL,NULL,'PROD-015','Plan Pensiones Plus'),(9,'DELETE','Leack','root@localhost','2025-11-04 08:11:02','PROD-010','Fondo InversiÂ¢n Global',NULL,NULL),(10,'DELETE','Leack','root@localhost','2025-11-04 08:11:02','PROD-012','Cuenta Empresarial Pro',NULL,NULL),(11,'DELETE','Leack','root@localhost','2025-11-04 08:11:02','PROD-013','Crâ€šdito Hipotecario Flex',NULL,NULL),(12,'DELETE','Leack','root@localhost','2025-11-04 08:11:02','PROD-014','Tarjeta Crâ€šdito Oro',NULL,NULL),(13,'DELETE','Leack','root@localhost','2025-11-04 08:11:02','PROD-015','Plan Pensiones Plus',NULL,NULL),(14,'INSERT','Leack','Aramis@MAC-A04CFC','2025-11-04 08:17:20',NULL,NULL,'PROD-000','TARJETA CREDITO'),(15,'INSERT','Leack','root@localhost','2025-11-04 08:55:02',NULL,NULL,'PROD-111','Tarjeta'),(16,'DELETE','Leack','root@localhost','2025-11-04 09:00:19','PROD-111','Tarjeta',NULL,NULL),(17,'INSERT','Leack','root@localhost','2025-11-11 07:31:23',NULL,NULL,'PROD-010','Fondo Inversi¢n Global'),(18,'INSERT','Leack','root@localhost','2025-11-11 07:31:23',NULL,NULL,'PROD-012','Cuenta Empresarial Pro'),(19,'INSERT','Leack','root@localhost','2025-11-11 07:31:23',NULL,NULL,'PROD-013','Credito Hipotecario Flex'),(20,'INSERT','Leack','root@localhost','2025-11-11 07:31:23',NULL,NULL,'PROD-014','Tarjeta Credito Oro'),(21,'INSERT','Leack','root@localhost','2025-11-11 07:31:23',NULL,NULL,'PROD-015','Plan Pensiones Plus'),(22,'DELETE','Leack','root@localhost','2025-11-11 07:35:42','PROD-010','Fondo Inversi¢n Global',NULL,NULL),(23,'DELETE','Leack','root@localhost','2025-11-11 07:35:42','PROD-012','Cuenta Empresarial Pro',NULL,NULL),(24,'DELETE','Leack','root@localhost','2025-11-11 07:35:42','PROD-013','Credito Hipotecario Flex',NULL,NULL),(25,'DELETE','Leack','root@localhost','2025-11-11 07:35:42','PROD-014','Tarjeta Credito Oro',NULL,NULL),(26,'DELETE','Leack','root@localhost','2025-11-11 07:35:42','PROD-015','Plan Pensiones Plus',NULL,NULL),(27,'UPDATE','Leack','root@localhost','2025-11-11 08:37:45','PROD-005','Seguros','PROD-005','Seguros SNR'),(28,'INSERT','Leack','susana@MAC-A04CFC','2025-11-11 08:40:06',NULL,NULL,'PROD-009','BECA'),(29,'DELETE','Leack','susana@MAC-A04CFC','2025-11-11 08:48:47','PROD-009','BECA',NULL,NULL),(30,'INSERT','Leack','Aramis@10.216.91.61','2025-11-25 08:08:22',NULL,NULL,'PROD-010','Fondo Inversi¢n Global'),(31,'INSERT','Leack','Aramis@10.216.91.61','2025-11-25 08:08:22',NULL,NULL,'PROD-012','Cuenta Empresarial Pro'),(32,'INSERT','Leack','Aramis@10.216.91.61','2025-11-25 08:08:22',NULL,NULL,'PROD-013','Credito Hipotecario Flex'),(33,'INSERT','Leack','Aramis@10.216.91.61','2025-11-25 08:08:22',NULL,NULL,'PROD-014','Tarjeta Credito Oro'),(34,'INSERT','Leack','Aramis@10.216.91.61','2025-11-25 08:08:22',NULL,NULL,'PROD-015','Plan Pensiones Plus'),(35,'INSERT','Leack','root@localhost','2025-12-02 07:54:38',NULL,NULL,'PROD-016','Purbea'),(36,'DELETE','Leack','root@localhost','2025-12-02 07:55:38','PROD-016','Purbea',NULL,NULL);
/*!40000 ALTER TABLE `bitacora_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carga_bruta_productos`
--

DROP TABLE IF EXISTS `carga_bruta_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carga_bruta_productos` (
  `IDProducto` varchar(10) DEFAULT NULL,
  `NombreProducto` varchar(50) DEFAULT NULL,
  `Descripcion` text,
  `TipoProducto` varchar(20) DEFAULT NULL,
  `Estado` varchar(10) DEFAULT NULL,
  `FechaLanzamiento` date DEFAULT NULL,
  `estatus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carga_bruta_productos`
--

LOCK TABLES `carga_bruta_productos` WRITE;
/*!40000 ALTER TABLE `carga_bruta_productos` DISABLE KEYS */;
INSERT INTO `carga_bruta_productos` VALUES ('PROD-009','Tarjeta Dâ€šbito Premium','Tarjeta con beneficios exclusivos','Crâ€šdito','Activo','2025-01-25','no cargado - Duplicado en archivo'),('PROD-009','Cuenta Ahorro Plus','Cuenta con rendimientos superiores','Ahorro','Activo','2025-02-24','no cargado - Duplicado en archivo'),(NULL,'Prâ€šstamo Personal Express','Prâ€šstamo rÂ pido sin garantÂ¡a','Crâ€šdito','Activo','2025-03-04','pendiente'),('PROD-010','Fondo InversiÂ¢n Global','InversiÂ¢n diversificada internacional','InversiÂ¢n','Activo','2019-04-01','cargado'),('PROD-011A','Seguro Vida Completo','Cobertura completa de vida','Seguro','Activo','2023-05-14','cargado'),('PROD-012','Cuenta Empresarial Pro','Cuenta para negocios con beneficios','Ahorro','Activo','2024-06-23','cargado'),('PROD-013','Crâ€šdito Hipotecario Flex','Crâ€šdito flexible para vivienda','Crâ€šdito','Activo','2018-07-08','cargado'),('PROD-014','Tarjeta Crâ€šdito Oro','Tarjeta premium con millas','Crâ€šdito','Activo','2025-08-02','cargado'),('PROD-015','Plan Pensiones Plus','Plan de retiro con aportaciones','InversiÂ¢n','Activo','2021-09-15','cargado'),('PROD-001','Producto Duplicado','Este ya existe en la BD','Crâ€šdito','Activo','2020-10-02','no cargado - Ya existe en BD'),('PROD-009','Tarjeta Debito Premium','Tarjeta con beneficios exclusivos','Credito','Activo','2025-01-25',NULL),('PROD-009','Cuenta Ahorro Plus','Cuenta con rendimientos superiores','Ahorro','Activo','2025-02-24',NULL),(NULL,'Prestamo Personal Express','Prestamo rapido sin garantia','Credito','Activo','2025-03-01',NULL),('PROD-010','Fondo Inversi¢n Global','Inversion diversificada internacional','Inversion','Activo','2019-04-01',NULL),('PROD-011A','Seguro Vida Completo','Cobertura completa de vida','Seguro','Activo','2023-05-14',NULL),('PROD-012','Cuenta Empresarial Pro','Cuenta para negocios con beneficios','Ahorro','Activo','2018-06-08',NULL),('PROD-013','Credito Hipotecario Flex','Credito flexible para vivienda','Credito','Activo','2025-07-07',NULL),('PROD-014','Tarjeta Credito Oro','Tarjeta premium con millas','Credito','Activo','2018-08-02',NULL),('PROD-015','Plan Pensiones Plus','Plan de retiro con aportaciones','Inversion','Activo','2021-03-15',NULL),('PROD-001','Producto Duplicado','Este ya existe en la BD','Credito','Activo','2020-10-02',NULL);
/*!40000 ALTER TABLE `carga_bruta_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `NumeroCliente` bigint NOT NULL,
  `AÃ±oContrato` int DEFAULT NULL,
  `Siglas` varchar(3) DEFAULT NULL,
  `FechaNacimiento` varchar(10) DEFAULT NULL,
  `DiferenciadorContrato` char(1) NOT NULL,
  `IDSucursal` varchar(4) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `ApellidoP` varchar(30) DEFAULT NULL,
  `ApellidoM` varchar(30) DEFAULT NULL,
  `RFC_NOMBRE` varchar(4) DEFAULT NULL,
  `RFC_FECHA` varchar(10) DEFAULT NULL,
  `RFC_HOMOCLAVE` varchar(2) DEFAULT NULL,
  `RFC_DigVerificador` varchar(1) DEFAULT NULL,
  `Nacionalidad` varchar(20) DEFAULT NULL,
  `TipoIdentificacion` varchar(20) DEFAULT NULL,
  `CURP` varchar(5) DEFAULT NULL,
  `CURP_FECHA` varchar(10) DEFAULT NULL,
  `CURP_SEXO` char(1) DEFAULT NULL,
  `CURP_ESTADO` varchar(2) DEFAULT NULL,
  `CURP_ConsoHomo` varchar(5) DEFAULT NULL,
  `EstadoCivil` varchar(15) DEFAULT NULL,
  `PaisNacimiento` varchar(20) DEFAULT NULL,
  `EstadoNacimiento` varchar(30) DEFAULT NULL,
  `Genero` varchar(10) DEFAULT NULL,
  `CodigoPostal` varchar(10) DEFAULT NULL,
  `Domicilio_Calle` varchar(50) DEFAULT NULL,
  `Domicilio_Numero` varchar(10) DEFAULT NULL,
  `Domicilio_Col` varchar(50) DEFAULT NULL,
  `Domicilio_Ciudad` varchar(50) DEFAULT NULL,
  `Domicilio_Estado` varchar(50) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `PaisResidencia` varchar(20) DEFAULT NULL,
  `Ocupacion` varchar(50) DEFAULT NULL,
  `Vigente` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`NumeroCliente`,`DiferenciadorContrato`),
  KEY `AÃ±oContrato` (`AÃ±oContrato`,`Siglas`,`FechaNacimiento`,`DiferenciadorContrato`),
  KEY `IDSucursal` (`IDSucursal`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`AÃ±oContrato`, `Siglas`, `FechaNacimiento`, `DiferenciadorContrato`) REFERENCES `contratos` (`AÃ±oContrato`, `Siglas`, `FechaNacimiento`, `DiferenciadorContrato`),
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`IDSucursal`) REFERENCES `sucursales` (`IDSucursal`),
  CONSTRAINT `booleano` CHECK ((`Vigente` in (_utf8mb4'Si',_utf8mb4'No'))),
  CONSTRAINT `Check_Sexo1` CHECK (((`CURP_SEXO` is null) or (`CURP_SEXO` in (_utf8mb4'M',_utf8mb4'H')))),
  CONSTRAINT `Fecha3` CHECK (((`RFC_FECHA` is null) or (regexp_like(`RFC_FECHA`,_utf8mb4'^[0-9]{2}/[0-9]{2}/[0-9]{2}$') and (str_to_date(`RFC_FECHA`,_utf8mb4'%Y/%m/%d') is not null))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (2152252698,2019,'ACD','2001/05/01','A','S005','Daniela','Arellano','Cano','AECD','01/05/01','H1','2','Mexicana','INE','AECD','01/05/01','M','NL','LRN01','Soltero(a)','MÃ©xico','Nuevo LeÃ³n','Femenino','64460','Calle Magnolia','134','Mitras Centro','Monterrey','Nuevo LeÃ³n','81 2345 6789','daniela.arellano01@gmail.com','MÃ©xico','Enfermera','No'),(3214569870,2024,'MRE','2005/03/16','A','S002','Emma Libier','Mendoza','Romo','MERE','05/03/16','GP','V','Mexicana','Pasaporte','MERE','05/03/16','M','DF','NMMA0','Soltero(a)','MÃ©xico','CDMX','Femenino','06090','JosÃ© MarÃ­a Pino SuÃ¡rez','S/N','Centro HistÃ³rico','CuauhtÃ©moc','CDMX','5514705896','Emmamendoza@gmail.com','MÃ©xico','MÃ©dico','Si'),(3214569870,2024,'MRE','2005/03/16','B','S002','Emma Libier','Mendoza','Romo','MERE','05/03/16','GP','V','Mexicana','Pasaporte','MERE','05/03/16','M','DF','NMMA0','Soltero(a)','MÃ©xico','CDMX','Femenino','06090','JosÃ© MarÃ­a Pino SuÃ¡rez','S/N','Centro HistÃ³rico','CuauhtÃ©moc','CDMX','5514705896','Emmamendoza@gmail.com','MÃ©xico','MÃ©dico','Si'),(3624850149,2018,'RGV','2002/10/12','A','S005','Valeria','Ramirez','Garcia','RAGV','02/10/12','H5','6','Mexicana','Licencia','RAGV','02/10/12','M','NL','RCL03','Soltero(a)','MÃ©xico','Nuevo LeÃ³n','Femenino','64349','Sauce','290','Cumbres Elite','Monterrey','Nuevo LeÃ³n','818765 4321','valeria.ramirez02@gmail.com','MÃ©xico','Licenciatura en PsicologÃ­a','No'),(3624850149,2018,'RGV','2002/10/12','B','S005','Valeria','Ramirez','Garcia','RAGV','02/10/12','H5','6','Mexicana','Licencia','RAGV','02/10/12','M','NL','RCL03','Soltero(a)','MÃ©xico','Nuevo LeÃ³n','Femenino','64349','Sauce','290','Cumbres Elite','Monterrey','Nuevo LeÃ³n','818765 4321','valeria.ramirez02@gmail.com','MÃ©xico','Licenciatura en PsicologÃ­a','No'),(4629569103,2021,'CVE','1992/03/17','A','S001','EliÃ¡n DamiÃ¡n','Carrasco','Ventura','CAVE','92/03/17','H3','4','Mexicana','Licencia','CAVE','92/03/17','H','DF','RNLA3','Soltero(a)','MÃ©xico','CDMX','Masculino','6400','Fresno','134','Santa MarÃ­a la Ribera','Ciudad de MÃ©xico','CDMX','5541237689','elian.carrasco92@gmail.com','MÃ©xico','Analista de CrÃ©ditos','Si'),(4879653210,2023,'FMM','2005/07/08','A','S003','Mariana','Fernandez','Maya','FEMM','05/07/08','YR','A','Mexicana','INE','FEMM','05/07/08','M','DF','RYRA5','Soltero(a)','MÃ©xico','CDMX','Femenino','09640','Av de las Minas','10','Xalpa','Iztapalapa','CDMX','5613704320','MayFer@hotmail.com','MÃ©xico','Gerente de RH','Si'),(4879653210,2023,'FMM','2005/07/08','B','S001','Mariana','Fernandez','Maya','FEMM','05/07/08','YR','A','Mexicana','INE','FEMM','05/07/08','M','DF','RYRA5','Soltero(a)','MÃ©xico','CDMX','Femenino','09640','Av de las Minas','10','Xalpa','Iztapalapa','CDMX','5613704320','MayFer@hotmail.com','MÃ©xico','Gerente de RH','Si'),(4879653210,2023,'FMM','2005/07/08','C','S003','Mariana','Fernandez','Maya','FEMM','05/07/08','YR','A','Mexicana','INE','FEMM','05/07/08','M','DF','RYRA5','Soltero(a)','MÃ©xico','CDMX','Femenino','09640','Av de las Minas','10','Xalpa','Iztapalapa','CDMX','5613704320','MayFer@hotmail.com','MÃ©xico','Gerente de RH','Si'),(5465322198,2010,'DRM','19880530','A','S004','MarÃ­a Fernanda','DÃ­az','Ruiz','DIFR','88/05/30','MJ','C','Mexicana','Pasaporte','DIFR','88/05/30','M','JC','ZPL04','Soltero(a)','MÃ©xico','Jalisco','Femenino','66260','LÃ¡zaro CÃ¡rdenas','730','Residencial San AgustÃ­n','Monterrey','Nuevo LeÃ³n','8174123698','maria.diaz@gmail.com','MÃ©xico','DiseÃ±ador GrÃ¡fico','No'),(5465322198,2010,'DRM','1988/05/30','B','S004','MarÃ­a Fernanda','DÃ­az','Ruiz','DIFR','88/05/30','MJ','C','Mexicana','Pasaporte','DIFR','88/05/30','M','JC','ZPL04','Soltero(a)','MÃ©xico','Jalisco','Femenino','66260','LÃ¡zaro CÃ¡rdenas','730','Residencial San AgustÃ­n','Monterrey','Nuevo LeÃ³n','8274123698','maria.diaz@gmail.com','MÃ©xico','DiseÃ±ador GrÃ¡fico','No'),(5465322198,2010,'DRM','1988/05/30','C','S004','MarÃ­a Fernanda','DÃ­az','Ruiz','DIFR','88/05/30','MJ','C','Mexicana','Pasaporte','DIFR','88/05/30','M','JC','ZPL04','Soltero(a)','MÃ©xico','Jalisco','Femenino','66260','LÃ¡zaro CÃ¡rdenas','730','Residencial San AgustÃ­n','Monterrey','Nuevo LeÃ³n','8374123698','maria.diaz@gmail.com','MÃ©xico','DiseÃ±ador GrÃ¡fico','No'),(6325418790,2023,'SVD','2005/08/24','A','S001','Daniel GadÃ­','Salgado','Vilchis','SAVD','05/08/24','LN','A','Mexicana','INE','SAVD','05/08/24','H','DF','LLNA7','Soltero(a)','MÃ©xico','CDMX','Masculino','09240','Carranza','5','Progresista','Iztapalapa','CDMX','5619130530','gaditosal@gmail.com','MÃ©xico','Estudiante','Si'),(6325418790,2023,'SVD','2005/08/24','B','S002','Daniel GadÃ­','Salgado','Vilchis','SAVD','05/08/24','LN','A','Mexicana','INE','SAVD','05/08/24','H','DF','LLNA7','Soltero(a)','MÃ©xico','CDMX','Masculino','09240','Carranza','5','Progresista','Iztapalapa','CDMX','5619130530','gaditosal@gmail.com','MÃ©xico','Estudiante','Si'),(6592592913,2023,'NLZ','1993/06/15','A','S005','Zyanya Itzel','Navarrete','Loyola','NALZ','93/06/15','7M','6','Mexicana','INE','NALZ','93/06/15','M','NL','VYY02','Casado(a)','MÃ©xico','Nuevo LeÃ³n','Femenino','64110','Loma Alta','456','Valle de las Palmas','Monterrey','Nuevo LeÃ³n','8126375405','zyanya.navarrete93@hotmail.com','MÃ©xico','Especialista en PrevenciÃ³n de Fraudes','No'),(6592592913,2023,'NLZ','1993/06/15','B','S005','Zyanya Itzel','Navarrete','Loyola','NALZ','93/06/15','7M','6','Mexicana','INE','NALZ','93/06/15','M','NL','VYY02','Casado(a)','MÃ©xico','Nuevo LeÃ³n','Femenino','64110','Loma Alta','456','Valle de las Palmas','Monterrey','Nuevo LeÃ³n','8126375406','zyanya.navarrete93@hotmail.com','MÃ©xico','Especialista en PrevenciÃ³n de Fraudes','No'),(6829475919,2019,'BRA','1988/05/04','A','S002','Aldara Samira','Betancourt','RoldÃ¡n','BERA','88/05/04','2T','1','Mexicana','Pasaporte','BERA','88/05/04','M','JC','NLN08','Casado(a)','MÃ©xico','Jalisco','Femenino','44630','Ontario','256','Providencia 1Âª SecciÃ³n','Guadalajara','Jalisco','3329561482','aldara.betancourt88@yahoo.com','MÃ©xico','Ejecutiva de AtenciÃ³n a Clientes','No'),(6829475919,2019,'BRA','1988/05/04','B','S003','Aldara Samira','Betancourt','RoldÃ¡n','BERA','88/05/04','2T','1','Mexicana','Licencia','BERA','88/05/04','M','JC','NLN08','Casado(a)','MÃ©xico','Jalisco','Femenino','44630','Ontario','256','Providencia 1Âª SecciÃ³n','Guadalajara','Jalisco','3329561482','aldara.betancourt88@yahoo.com','MÃ©xico','Ejecutiva de AtenciÃ³n a Clientes','No'),(7456203188,2008,'RSA','1990/12/25','A','S004','Ana Karen','RamÃ­rez','SÃ¡nchez','RASJ','90/12/25','MJ','C','Mexicana','Pasaporte','RASJ','90/12/25','M','JC','MLN02','Casado(a)','MÃ©xico','Jalisco','Femenino','06140','Campeche','98','Condesa','Ciudad de MÃ©xico','CDMX','5578963621','ana.ramirez@gmail.com','MÃ©xico','MÃ©dico','No'),(7456203188,2008,'RSA','1990/12/25','B','S004','Ana Karen','RamÃ­rez','SÃ¡nchez','RASJ','90/12/25','MJ','C','Mexicana','Pasaporte','RASJ','90/12/25','M','JC','MLN02','Casado(a)','MÃ©xico','Jalisco','Femenino','06141','Campeche','98','Condesa','Ciudad de MÃ©xico','CDMX','5678963621','ana.ramirez@gmail.com','MÃ©xico','MÃ©dico','No'),(7630198475,2013,'MCV','1995/09/07','A','S005','Valeria Carolina','Morales','Cabrera','MOVC','95/09/07','MN','L','Mexicana','Pasaporte','MOVC','95/09/07','M','NL','PRN06','Soltero(a)','MÃ©xico','Nuevo LeÃ³n','Femenino','44100','JuÃ¡rez','456','Americana','Guadalajara','Jalisco','3398274519','valeria.morales@gmail.com','MÃ©xico','Arquitecta','No'),(7630198475,2013,'MCV','1995/09/07','B','S005','Valeria Carolina','Morales','Cabrera','MOVC','95/09/07','MN','L','Mexicana','Pasaporte','MOVC','95/09/07','M','NL','PRN06','Soltero(a)','MÃ©xico','Nuevo LeÃ³n','Femenino','44100','JuÃ¡rez','456','Americana','Guadalajara','Jalisco','3498274519','valeria.morales@gmail.com','MÃ©xico','Arquitecta','No'),(7630198475,2013,'MCV','1995/09/07','C','S005','Valeria Carolina','Morales','Cabrera','MOVC','95/09/07','MN','L','Mexicana','Pasaporte','MOVC','95/09/07','M','NL','PRN06','Soltero(a)','MÃ©xico','Nuevo LeÃ³n','Femenino','44100','JuÃ¡rez','456','Americana','Guadalajara','Jalisco','3598274519','valeria.morales@gmail.com','MÃ©xico','Arquitecta','No'),(7836001495,2020,'JHR','2003/11/28','A','S004','Rodrigo Carlos','Jimenez','Huerta','JIHR','03/11/28','M7','8','Mexicana','Pasaporte','JIHR','03/11/28','H','JC','MRD04','Soltero(a)','MÃ©xico','Jalisco','Masculino','44160','Pedro Moreno','1210','Americana','Guadalajara','Jalisco','3399881122','rodrigo.jimenez03@yahoo.com','MÃ©xico','TÃ©cnico en MecatrÃ³nica','No'),(7836001495,2020,'JHR','2003/11/28','B','S004','Rodrigo Carlos','Jimenez','Huerta','JIHR','03/11/28','M7','8','Mexicana','Pasaporte','JIHR','03/11/28','H','JC','MRD04','Soltero(a)','MÃ©xico','Jalisco','Masculino','44160','Pedro Moreno','1210','Americana','Guadalajara','Jalisco','3399881122','rodrigo.jimenez03@yahoo.com','MÃ©xico','TÃ©cnico en MecatrÃ³nica','No'),(7890123456,2025,'BMC','2005/06/04','A','S003','Cesar David','Bernal','Martinez','BEMC','05/06/04','9J','6','Mexicana','Licencia','BEMC','05/06/04','H','DF','RRSA9','Soltero(a)','MÃ©xico','CDMX','Masculino','09720','Felipe angeles','174','Francisco Villa','Iztapalapa','CDMX','5511571470','Verdaber@hotmail.com','MÃ©xico','Analista de datos','Si'),(7890123456,2025,'BMC','2005/06/04','B','S002','Cesar David','Bernal','Martinez','BEMC','05/06/04','9J','6','Mexicana','Licencia','BEMC','05/06/04','H','DF','RRSA9','Soltero(a)','MÃ©xico','CDMX','Masculino','09720','Felipe angeles','174','Francisco Villa','Iztapalapa','CDMX','5511571470','Verdaber@hotmail.com','MÃ©xico','Analista de datos','Si'),(8024675405,2024,'ACE','1991/07/22','A','S001','Dorian Emiliano','AlcÃ¡ntara','Cornejo','AECD','91/07/22','P8','9','Mexicana','INE','AECD','91/07/22','H','DF','LRR07','Soltero(a)','MÃ©xico','CDMX','Masculino','6700','Orizaba','85','Roma Norte','Ciudad de MÃ©xico','CDMX','5537849021','dorian.alcantara91@outlook.com','MÃ©xico','Auditor Financiero','Si'),(8569321456,2012,'MGL','1982/03/15','A','S001','Luis Alberto','MartÃ­nez','GonzÃ¡lez','MGL','82/03/15','HD','F','Mexicana','INE','MGL','82/03/15','H','DF','RNR01','Soltero(a)','MÃ©xico','CDMX','Masculino','06010','Donceles','150','Centro HistÃ³rico','Ciudad de MÃ©xico','CDMX','5554328796','luis.martinez@gmail.com','MÃ©xico','Ingeniero en sistemas','Si'),(8569321456,2012,'MGL','1982/03/15','B','S003','Luis Alberto','MartÃ­nez','GonzÃ¡lez','MGL','82/03/15','HD','F','Mexicana','INE','MGL','82/03/15','H','DF','RNR01','Soltero(a)','MÃ©xico','CDMX','Masculino','06011','Donceles','150','Centro HistÃ³rico','Ciudad de MÃ©xico','CDMX','5654328796','luis.martinez@gmail.com','MÃ©xico','Ingeniero en sistemas','Si'),(8569321456,2012,'MGL','1982/03/15','C','S001','Luis Alberto','MartÃ­nez','GonzÃ¡lez','MGL','82/03/15','HD','F','Mexicana','INE','MGL','82/03/15','H','DF','RNR01','Soltero(a)','MÃ©xico','CDMX','Masculino','06012','Donceles','150','Centro HistÃ³rico','Ciudad de MÃ©xico','CDMX','5754328796','luis.martinez@gmail.com','MÃ©xico','Ingeniero en sistemas','Si'),(8796312045,2011,'CHH','1986/09/12','A','S002','HÃ©ctor Guillermo','Cruz','HernÃ¡ndez','CUHH','86/09/12','HD','F','Mexicana','INE','CUHH','86/09/12','H','DF','LRT05','Casado(a)','MÃ©xico','CDMX','Masculino','3020','Xola','159','Ã�lamos','Ciudad de MÃ©xico','CDMX','5545678901','hector.cruz@gmail.com','MÃ©xico','Contador PÃºblico','Si'),(8926041739,2014,'RML','1993/11/18','A','S001','Laura Patricia','Reyes','Mendoza','REML','93/11/18','MD','F','Mexicana','INE','REML','93/11/18','M','DF','NSL08','Soltero(a)','MÃ©xico','CDMX','Femenino','50120','Benito JuÃ¡rez','45','Centro','Toluca','Estado de MÃ©xico','5540502308','laura.reyes@gmail.com','MÃ©xico','Analista Financiera','Si'),(8926041739,2014,'RML','1993/11/18','B','S002','Laura Patricia','Reyes','Mendoza','REML','93/11/18','MD','F','Mexicana','INE','REML','93/11/18','M','DF','NSL08','Soltero(a)','MÃ©xico','CDMX','Femenino','50120','Benito JuÃ¡rez','45','Centro','Toluca','Estado de MÃ©xico','5540502308','laura.reyes@gmail.com','MÃ©xico','Analista Financiera','Si'),(9347512083,2009,'RMG','1983/05/22','A','S003','Ricardo Manuel','GÃ³mez','Torres','GOTR','83/05/22','HD','F','Mexicana','INE','GOTR','83/05/22','H','DF','JNM07','Casado(a)','MÃ©xico','CDMX','Masculino','64000','Padre Mier','310','Centro','Monterrey','Nuevo LeÃ³n','8187456309','ricardo.gomez@gmail.com','MÃ©xico','Ingeniero Civil','Si'),(9347512083,2009,'RMG','1983/05/22','B','S005','Ricardo Manuel','GÃ³mez','Torres','GOTR','83/05/22','HD','F','Mexicana','INE','GOTR','83/05/22','H','DF','JNM07','Casado(a)','MÃ©xico','Nuevo LeÃ³n','Masculino','64000','Padre Mier','310','Centro','Monterrey','Nuevo LeÃ³n','8287456309','ricardo.gomez@gmail.com','MÃ©xico','Ingeniero Civil','No'),(9347512083,2009,'RMG','1983/05/22','C','S005','Ricardo Manuel','GÃ³mez','Torres','GOTR','83/05/22','HD','F','Mexicana','INE','GOTR','83/05/22','H','DF','JNM07','Casado(a)','MÃ©xico','Nuevo LeÃ³n','Masculino','64000','Padre Mier','310','Centro','Monterrey','Nuevo LeÃ³n','8387456309','ricardo.gomez@gmail.com','MÃ©xico','Ingeniero Civil','No'),(9635124875,2017,'PRX','2004/04/04','A','S004','Xannia Xarely','Palacios','RoldÃ¡n','PARX','04/04/04','H3','4','Mexicana','Licencia','PARX','04/04/04','M','JC','LLD02','Soltero(a)','MÃ©xico','Jalisco','Femenino','45110','Av. Patria','765','Jardines Universidad','Zapopan','Jalisco','339123 4567','xannia.palacios04@hotmail.com','MÃ©xico','Profesora','No'),(9635124875,2017,'PRX','2004/04/4','B','S004','Xannia Xarely','Palacios','RoldÃ¡n','PARX','04/04/04','H3','4','Mexicana','Licencia','PARX','04/04/04','M','JC','LLD02','Soltero(a)','MÃ©xico','Jalisco','Femenino','45110','Av. Patria','765','Jardines Universidad','Zapopan','Jalisco','339123 4567','xannia.palacios04@hotmail.com','MÃ©xico','Profesora','No'),(9685743212,2007,'LPJ','1975/04/10','A','S002','Jorge Eduardo','LÃ³pez','PÃ©rez','LOPE','75/04/10','HD','F','Mexicana','INE','LOPE','75/04/10','H','DF','RZS03','Casado(a)','MÃ©xico','CDMX','Masculino','44670','Patria','305','Prados Providencia','Guadalajara','Jalisco','3359874152','jorge.lopez@gmail.com','MÃ©xico','Abogado','Si');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratos`
--

DROP TABLE IF EXISTS `contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratos` (
  `AÃ±oContrato` int NOT NULL,
  `Siglas` varchar(3) NOT NULL,
  `FechaNacimiento` varchar(10) NOT NULL,
  `DiferenciadorContrato` char(1) NOT NULL,
  `IDProducto` varchar(10) DEFAULT NULL,
  `TipoTasa` varchar(10) DEFAULT NULL,
  `Moneda` varchar(3) DEFAULT NULL,
  `TasaInteres` decimal(3,2) DEFAULT NULL,
  `FechaInicioPago` int DEFAULT NULL,
  `FechaLimitePago` int DEFAULT NULL,
  `Comisiones` float DEFAULT NULL,
  `Plazo` int DEFAULT NULL,
  `FechaInicioContrato` varchar(10) DEFAULT NULL,
  `FechaFinContrato` varchar(10) DEFAULT NULL,
  `Cancelado` varchar(15) DEFAULT NULL,
  `SucursalGen` varchar(4) NOT NULL,
  PRIMARY KEY (`AÃ±oContrato`,`Siglas`,`FechaNacimiento`,`DiferenciadorContrato`),
  KEY `IDProducto` (`IDProducto`),
  KEY `SucursalGen` (`SucursalGen`),
  CONSTRAINT `contratos_ibfk_1` FOREIGN KEY (`IDProducto`) REFERENCES `productos` (`IDProducto`),
  CONSTRAINT `contratos_ibfk_2` FOREIGN KEY (`SucursalGen`) REFERENCES `sucursales` (`IDSucursal`),
  CONSTRAINT `Check_cancel` CHECK (((`Cancelado` is null) or (`Cancelado` in (_utf8mb4'No aplica',_utf8mb4'Si aplica',_utf8mb4'no aplica',_utf8mb4'si aplica')))),
  CONSTRAINT `Check_TASA` CHECK (((`TipoTasa` is null) or (lower(`TipoTasa`) in (_utf8mb4'fija',_utf8mb4'variable')))),
  CONSTRAINT `Diferenciador` CHECK ((`DiferenciadorContrato` in (_utf8mb4'A',_utf8mb4'B',_utf8mb4'C'))),
  CONSTRAINT `Fechas2` CHECK (((`FechaInicioContrato` is null) or (regexp_like(`FechaInicioContrato`,_utf8mb4'^[0-9]{4}/[0-9]{2}/[0-9]{2}$') and (str_to_date(`FechaInicioContrato`,_utf8mb4'%Y/%m/%d') is not null)) or (regexp_like(`FechaInicioContrato`,_utf8mb4'^[0-9]{2}/[0-9]{2}/[0-9]{4}$') and (str_to_date(`FechaInicioContrato`,_utf8mb4'%d/%m/%Y') is not null)))),
  CONSTRAINT `Fechas3` CHECK (((`FechaFinContrato` is null) or (regexp_like(`FechaFinContrato`,_utf8mb4'^[0-9]{4}/[0-9]{2}/[0-9]{2}$') and (str_to_date(`FechaFinContrato`,_utf8mb4'%Y/%m/%d') is not null)) or (regexp_like(`FechaFinContrato`,_utf8mb4'^[0-9]{2}/[0-9]{2}/[0-9]{4}$') and (str_to_date(`FechaFinContrato`,_utf8mb4'%d/%m/%Y') is not null)))),
  CONSTRAINT `PRODUC` CHECK ((`IDProducto` like _utf8mb4'PROD-%')),
  CONSTRAINT `TipoMoneda` CHECK (((`Moneda` is null) or (upper(`Moneda`) in (_utf8mb4'USD',_utf8mb4'MXN',_utf8mb4'EUR'))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos`
--

LOCK TABLES `contratos` WRITE;
/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;
INSERT INTO `contratos` VALUES (2007,'LPJ','1975/04/10','A','PROD-003','Variable','MXN',0.35,11,18,0,7,'2016/09/12','2017/04/11','No aplica','S005'),(2008,'RSA','1990/12/25','A','PROD-001','Fija','EUR',0.80,29,5,800,12,'2016/06/15','2017/06/14','Si aplica','S001'),(2008,'RSA','1990/12/25','B','PROD-002','Variable','MXN',0.50,16,23,1000,4,'2018/01/20','2018/05/19','No aplica','S001'),(2009,'RMG','1983/05/22','A','PROD-001','Fija','USD',0.20,11,18,1000,5,'2019/08/05','2020/01/04','No aplica','S004'),(2009,'RMG','1983/05/22','B','PROD-002','Fija','MXN',0.20,6,13,400,6,'2018/04/25','2018/10/24','Si aplica','S002'),(2009,'RMG','1983/05/22','C','PROD-005','Fija','MXN',0.20,1,8,0,3,'2020/11/10','2021/02/09','Si aplica','S003'),(2010,'DRM','1988/05/30','A','PROD-001','Fija','EUR',0.40,8,15,400,18,'2024/03/01','2025/08/31','No aplica','S003'),(2010,'DRM','1988/05/30','B','PROD-002','Fija','MXN',0.19,31,7,0,24,'2022/10/15','2024/10/14','Si aplica','S001'),(2010,'DRM','1988/05/30','C','PROD-004','Fija','EUR',0.23,2,9,200,15,'2023/09/05','2024/12/04','No aplica','S003'),(2011,'CHH','1986/09/12','A','PROD-001','Variable','USD',0.20,19,26,0,9,'2018/05/20','2019/02/19','No aplica','S004'),(2012,'MGL','1982/03/15','A','PROD-001','Fija','USD',0.20,13,20,800,5,'2017/08/10','2018/02/09','No aplica','S001'),(2012,'MGL','1982/03/15','B','PROD-003','Variable','MXN',0.15,20,27,0,9,'2023/11/20','2024/08/19','Si aplica','S001'),(2012,'MGL','1982/03/15','C','PROD-006','Fija','MXN',0.30,22,29,0,3,'2019/11/05','2020/02/04','Si aplica','S004'),(2013,'MCV','1995/09/07','A','PROD-001','Fija','USD',0.40,20,27,0,4,'2021/01/10','2021/05/09','No aplica','S003'),(2013,'MCV','1995/09/07','B','PROD-002','Variable','EUR',0.80,28,4,1000,12,'2018/11/01','2019/10/31','No aplica','S001'),(2013,'MCV','1995/09/07','C','PROD-004','Variable','MXN',0.16,13,20,400,7,'2020/02/15','2020/09/14','Si aplica','S004'),(2014,'RML','1993/11/18','A','PROD-001','Fija','MXN',0.16,14,21,0,6,'2019/03/12','2019/09/11','No aplica','S002'),(2014,'RML','1993/11/18','B','PROD-002','Fija','MXN',0.20,10,17,0,3,'2020/07/01','2020/09/30','Si aplica','S001'),(2017,'PRX','2004/04/04','A','PROD-002','Fija','MXN',0.29,14,21,300,5,'2021/10/20','2026/10/21','No aplica','S002'),(2017,'PRX','2004/04/04','B','PROD-004','Variable','USD',0.18,24,31,0,4,'2023/04/05','2027/04/05','Si aplica','S001'),(2018,'RGV','2002/10/12','A','PROD-003','Fija','MXN',0.21,9,16,400,2,'2023/12/09','2025/12/09','Si aplica','S004'),(2018,'RGV','2002/10/12','B','PROD-004','Variable','USD',0.25,15,22,900,6,'2025/02/15','2031/02/15','Si aplica','S005'),(2019,'ACD','2001/05/01','A','PROD-001','Variable','MXN',0.13,2,9,0,2,'2022/07/28','2024/07/28','No aplica','S001'),(2019,'BRA','1988/05/04','A','PROD-005','Fija','USD',0.20,15,22,1000,3,'2020/01/14','2023/01/14','No aplica','S003'),(2019,'BRA','1988/05/04','B','PROD-004','Variable','USD',0.18,14,23,0,7,'2021/12/28','2028/12/28','No aplica','S003'),(2020,'JHR','2003/11/28','A','PROD-002','Fija','MXN',0.17,12,19,0,4,'2022/06/26','2026/06/26','No aplica','S001'),(2020,'JHR','2003/11/28','B','PROD-003','Variable','USD',0.28,4,11,1200,3,'2021/11/29','2024/11/29','No aplica','S001'),(2021,'CVE','1992/03/17','A','PROD-002','Fija','MXN',0.16,13,20,0,5,'2023/05/23','2028/05/23','No aplica','S003'),(2023,'FMM','2005/07/08','A','PROD-001','Fija','EUR',0.35,9,16,0,3,'2023/09/10','2026/09/10','No aplica','S001'),(2023,'FMM','2005/07/08','B','PROD-002','Variable','MXN',0.17,14,21,300,7,'2024/11/22','2031/11/22','No aplica','S001'),(2023,'FMM','2005/07/08','C','PROD-005','Fija','USD',0.25,20,27,1200,2,'2025/01/05','2027/01/05','Si aplica','S002'),(2023,'NLZ','1993/06/15','A','PROD-005','Fija','USD',0.24,20,27,0,2,'2025/01/23','2027/01/23','No aplica','S003'),(2023,'NLZ','1993/06/15','B','PROD-006','Fija','USD',0.24,20,27,400,3,'2025/01/24','2027/01/24','No aplica','S004'),(2023,'SVD','2005/08/24','A','PROD-003','Fija','MXN',0.18,12,19,0,4,'2023/06/15','2027/06/15','No aplica','S002'),(2023,'SVD','2005/08/24','B','PROD-004','Variable','USD',0.22,18,25,800,5,'2024/03/01','2029/03/01','Si aplica','S004'),(2024,'ACE','1991/07/22','A','PROD-001','Variable','MXN',0.19,10,17,400,6,'2024/08/20','2030/08/20','No aplica','S003'),(2024,'MRE','2005/03/16','A','PROD-003','Variable','MXN',0.19,11,18,0,6,'2024/07/30','2030/07/30','No aplica','S001'),(2024,'MRE','2005/03/16','B','PROD-004','Fija','USD',0.21,16,23,500,4,'2025/02/12','2029/02/12','Si aplica','S001'),(2025,'BMC','2005/06/04','A','PROD-001','Fija','MXN',0.16,13,20,0,5,'2025/04/18','2030/04/18','No aplica','S001'),(2025,'BMC','2005/06/04','B','PROD-002','Variable','USD',0.23,17,24,900,3,'2024/12/07','2027/12/07','No aplica','S004');
/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `Nomina` varchar(10) NOT NULL,
  `NombreSucursal` varchar(50) DEFAULT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `ApellidoP` varchar(30) DEFAULT NULL,
  `ApellidoM` varchar(30) DEFAULT NULL,
  `Cargo` varchar(30) DEFAULT NULL,
  `Telefono` bigint NOT NULL,
  PRIMARY KEY (`Telefono`),
  UNIQUE KEY `Telefono` (`Telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('GRM2004','Sucursal Guadalajara Andares','Mariana','Vargas','Herrera','Gerente',3312345678),('BNQ4002','Sucursal Guadalajara Andares','Isabella','Herrera','JimÃ©nez','Banquero',3323456789),('BNQ4003','Sucursal Guadalajara Andares','Emiliano','Mendoza','Vargas','Banquero',3334567890),('BNQ4001','Sucursal Guadalajara Andares','Miguel Ã�ngel','DomÃ­nguez','Soto','Banquero',3387654321),('BNQ1001','Sucursal Reforma Centro','Laura SofÃ­a','MÃ¡rquez','RamÃ­rez','Banquero',5512345678),('BNQ3003','Sucursal Santa Fe Corporativo','Leonardo','DÃ­az','Romero','Banquero',5513572468),('BNQ1002','Sucursal Reforma Centro','Miguel','Herrera','JimÃ©nez','Banquero',5523456789),('BNQ1003','Sucursal Reforma Centro','MarÃ­a','LÃ³pez','MartÃ­nez','Banquero',5534567890),('GRM2001','Sucursal Reforma Centro','Roberto','Martinez','GonzÃ¡lez','Gerente',5542567890),('GRM2002','Sucursal Insurgentes Norte','Alicia','RamÃ­rez','LÃ³pez','Gerente',5545678901),('BNQ2001','Sucursal Insurgentes Norte','JosÃ© Antonio','Herrera','LÃ³pez','Banquero',5556789012),('BNQ2002','Sucursal Insurgentes Norte','Luis','RamÃ­rez','Cruz','Banquero',5567890123),('BNQ2003','Sucursal Insurgentes Norte','SofÃ­a','DÃ­az','Romero','Banquero',5578901234),('GRM2003','Sucursal Santa Fe Corporativo','Fernando','Soto','Delgado','Gerente',5589012345),('BNQ3001','Sucursal Santa Fe Corporativo','Camila Fernanda','Rivas','GonzÃ¡lez','Banquero',5590123468),('BNQ3002','Sucursal Santa Fe Corporativo','Valentina','GonzÃ¡lez','PÃ©rez','Banquero',5591234567),('GRM2005','Sucursal Monterrey Valle Oriente','Javier','DomÃ­nguez','Castro','Gerente',8112345678),('BNQ5001','Sucursal Monterrey Valle Oriente','Ana LucÃ­a','JimÃ©nez','PÃ©rez','Banquero',8123456789),('BNQ5002','Sucursal Monterrey Valle Oriente','SebastiÃ¡n','Morales','Torres','Banquero',8134567890),('BNQ5003','Sucursal Monterrey Valle Oriente','Gabriela','RamÃ­rez','Cruz','Banquero',8145678901);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `eval`
--

DROP TABLE IF EXISTS `eval`;
/*!50001 DROP VIEW IF EXISTS `eval`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `eval` AS SELECT 
 1 AS `IDProducto`,
 1 AS `NombreProducto`,
 1 AS `Descripcion`,
 1 AS `TipoProducto`,
 1 AS `Estado`,
 1 AS `FechaLanzamiento`,
 1 AS `x`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `IDProducto` varchar(10) NOT NULL,
  `NombreProducto` varchar(50) DEFAULT NULL,
  `Descripcion` text,
  `TipoProducto` varchar(20) DEFAULT NULL,
  `Estado` varchar(10) DEFAULT NULL,
  `FechaLanzamiento` date DEFAULT NULL,
  PRIMARY KEY (`IDProducto`),
  CONSTRAINT `Fech` CHECK ((regexp_like(`FechaLanzamiento`,_utf8mb4'^[0-9]{4}-[0-9]{2}-[0-9]{2}$') and (str_to_date(`FechaLanzamiento`,_utf8mb4'%Y-%m-%d') is not null))),
  CONSTRAINT `PROD` CHECK ((`IDProducto` like _utf8mb4'PROD-%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('PROD-001','Cuentas Bancarias','Servicios relacionados con cuentas','Ahorro','Activo','2023-01-15'),('PROD-002','Tarjetas de CrÃ©dito','Tarjeta con beneficios exclusivos','CrÃ©dito','Activo','2022-06-01'),('PROD-003','CrÃ©ditos y PrÃ©stamo','CrÃ©dito rÃ¡pido sin garantÃ­a','CrÃ©dito','Activo','2023-03-10'),('PROD-004','Inversiones y Ahorros','InversiÃ³n diversificada en mercados internacionales','InversiÃ³n','Activo','2021-11-20'),('PROD-005','Seguros','Servicios de seguros','Seguro','Activo','2020-09-05'),('PROD-006','Servicios Especializados','AsesorÃ­as y servicios empresariales','Ahorro','Activo','2019-07-05'),('PROD-007','Prestamos','Ayuda a usuario','CrÃ©dito','Activo','2025-08-12'),('PROD-008','Tarjeta de dÃ©bito','Ayuda a usuario','CrÃ©dito','Activo','2025-08-14'),('PROD-010','Fondo InversiÂ¢n Global','InversiÂ¢n diversificada internacional','InversiÂ¢n','Activo','2019-04-01'),('PROD-011A','Seguro Vida Completo','Cobertura completa de vida','Seguro','Activo','2023-05-14'),('PROD-012','Cuenta Empresarial Pro','Cuenta para negocios con beneficios','Ahorro','Activo','2024-06-23'),('PROD-013','Crâ€šdito Hipotecario Flex','Crâ€šdito flexible para vivienda','Crâ€šdito','Activo','2018-07-08'),('PROD-014','Tarjeta Crâ€šdito Oro','Tarjeta premium con millas','Crâ€šdito','Activo','2025-08-02'),('PROD-015','Plan Pensiones Plus','Plan de retiro con aportaciones','InversiÂ¢n','Activo','2021-09-15');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_productos_after_insert` AFTER INSERT ON `productos` FOR EACH ROW BEGIN
    INSERT INTO bitacora_productos (
        Operacion,
        IP_Equipo,
        Usuario,
        FechaHora_operac,
        IDProducto_New,
        NombreProducto_New
    ) VALUES (
        'INSERT',
        COALESCE(@@hostname, 'Desconocido'),
        USER(),
        NOW(),
        NEW.IDProducto,
        NEW.NombreProducto
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_productos_after_update` AFTER UPDATE ON `productos` FOR EACH ROW BEGIN
    -- Solo registrar si hubo cambios reales en las columnas monitoreadas
    IF (OLD.IDProducto <> NEW.IDProducto OR
        OLD.NombreProducto <> NEW.NombreProducto) THEN
        
        INSERT INTO bitacora_productos (
            Operacion,
            IP_Equipo,
            Usuario,
            FechaHora_operac,
            IDProducto_Ant,
            NombreProducto_Ant,
            IDProducto_New,
            NombreProducto_New
        ) VALUES (
            'UPDATE',
            COALESCE(@@hostname, 'Desconocido'),
            USER(),
            NOW(),
            OLD.IDProducto,
            OLD.NombreProducto,
            NEW.IDProducto,
            NEW.NombreProducto
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_productos_after_delete` AFTER DELETE ON `productos` FOR EACH ROW BEGIN
    INSERT INTO bitacora_productos (
        Operacion,
        IP_Equipo,
        Usuario,
        FechaHora_operac,
        IDProducto_Ant,
        NombreProducto_Ant
    ) VALUES (
        'DELETE',
        COALESCE(@@hostname, 'Desconocido'),
        USER(),
        NOW(),
        OLD.IDProducto,
        OLD.NombreProducto
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `subproductos`
--

DROP TABLE IF EXISTS `subproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subproductos` (
  `IDSubproducto` varchar(10) NOT NULL,
  `IDProducto` varchar(10) DEFAULT NULL,
  `NombreSubproducto` varchar(50) DEFAULT NULL,
  `Estado` varchar(10) DEFAULT NULL,
  `Descripcion` text,
  PRIMARY KEY (`IDSubproducto`),
  KEY `IDProducto` (`IDProducto`),
  CONSTRAINT `subproductos_ibfk_1` FOREIGN KEY (`IDProducto`) REFERENCES `productos` (`IDProducto`),
  CONSTRAINT `ESTAD` CHECK (((`Estado` is null) or (`Estado` = _utf8mb4'Activo'))),
  CONSTRAINT `PRODUC01` CHECK ((`IDProducto` like _utf8mb4'PROD-%')),
  CONSTRAINT `SUBPRODUC` CHECK ((`IDSubproducto` like _utf8mb4'SUB-%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subproductos`
--

LOCK TABLES `subproductos` WRITE;
/*!40000 ALTER TABLE `subproductos` DISABLE KEYS */;
INSERT INTO `subproductos` VALUES ('SUB-001','PROD-001','Cuentas de cheques','Activo','Permiten depÃ³sitos y retiros frecuentes, y suelen estar asociados a tarjetas de dÃ©bito.'),('SUB-002','PROD-001','Cuentas Ahorro','Activo','DiseÃ±adas para fomentar el ahorro, ofreciendo rendimientos sobre el saldo mantenido.â€‹'),('SUB-003','PROD-001','Cuentas digitales','Activo','Operadas completamente en lÃ­nea, brindando acceso a travÃ©s de aplicaciones mÃ³viles o plataformas web.'),('SUB-004','PROD-001','Cuentas empresariales','Activo','Adaptadas para negocios, facilitando la gestiÃ³n de operaciones financieras comerciales.â€‹'),('SUB-005','PROD-002','Tarjetas de dÃ©bito','Activo','Vinculadas a cuenta de cheques, permiten realizar pagos y retiros directamente del saldo disponible.'),('SUB-006','PROD-002','Tarjetas de credito','Activo','Ofrecen una lÃ­nea de crÃ©dito para compras, con la posibilidad de pagar el saldo total o parcial mensualmente.â€‹'),('SUB-007','PROD-002','Tarjetas prepagadas','Activo','Cargadas con un monto especÃ­fico, Ãºtiles para controlar gastos o como alternativa para quienes no califican para tarjetas tradicionales.'),('SUB-008','PROD-003','PrÃ©stamos personales','Activo','Otorgados para diversos fines, como consolidaciÃ³n de deudas o gastos imprevistos.â€‹	'),('SUB-009','PROD-003','CrÃ©ditos hipotecarios','Activo','Financiamiento para la compra, construcciÃ³n o mejora de bienes inmuebles..'),('SUB-010','PROD-003','PrÃ©stamos automotrices','Activo','EspecÃ­ficas para la adquisiciÃ³n de vehÃ­culos.'),('SUB-011','PROD-003','CrÃ©ditos para PyMEs','Activo','DiseÃ±ados para apoyar a pequeÃ±as y medianas empresas en sus necesidades financieras..'),('SUB-012','PROD-003','LÃ­neas de crÃ©dito','Activo','Ofrecen un monto mÃ¡ximo disponible para ser utilizado segÃºn las necesidades del cliente.'),('SUB-013','PROD-004','DepÃ³sitos a plazo','Activo','Inversiones con una tasa de interÃ©s (la durante un periodo determinado).'),('SUB-014','PROD-004','Fondos de inversiÃ³n','Activo','Instrumentos que agrupan el capital de varios inversionistas para invertir en una cartera diversificada..'),('SUB-015','PROD-004','Certificados de depÃ³sito (CDs)','Activo','Productos de ahorro con un plazo fijo y una tasa de interÃ©s establecida.â€‹'),('SUB-016','PROD-005','Seguro de vida','Activo','Proporciona protecciÃ³n financiera a los beneficiarios en caso de fallecimiento del asegurado.'),('SUB-017','PROD-005','Seguro de automÃ³vil','Activo','Cubre daÃ±os o pÃ©rdidas relacionadas con vehÃ­culos'),('SUB-018','PROD-005','Seguro de hogar','Activo','Protege contra daÃ±os o pÃ©rdidas en la propiedad residencial.'),('SUB-019','PROD-005','Seguros para viajes','Activo','Ofrecen cobertura durante desplazamiento, incluyendo asistencia mÃ©dica y pÃ©rdida de equipaje.'),('SUB-020','PROD-006','AsesorÃ­a financiera','Activo','OrientaciÃ³n personalizada sobre inversiones, aÃ±orro y planificaciÃ³n financiera.'),('SUB-021','PROD-006','Servicios para empresas','Activo','Incluyen gestiÃ³n de treinta, financiamiento empresarial y soluciones de bancaria.'),('SUB-022','PROD-005','Asistencia para viajes','Activo','Servicios como seguros de viaje y tarjetas internacionales para facilitar desplazamientos al extranjero.');
/*!40000 ALTER TABLE `subproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `IDSucursal` varchar(4) NOT NULL,
  `NombreSucursal` varchar(50) DEFAULT NULL,
  `TipoBanco` varchar(20) DEFAULT NULL,
  `TipoRed` varchar(20) NOT NULL,
  `TelefonoGerente` bigint DEFAULT NULL,
  `Direccion_Calle` varchar(50) DEFAULT NULL,
  `Numero` bigint DEFAULT NULL,
  `Colonia` varchar(50) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDSucursal`,`TipoRed`),
  KEY `TelefonoGerente` (`TelefonoGerente`),
  CONSTRAINT `sucursales_ibfk_1` FOREIGN KEY (`TelefonoGerente`) REFERENCES `empleados` (`Telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES ('S001','Sucursal Reforma Centro','Comercial','Cajero',5542567890,'Reforma',123,'Centro','Ciudad de MÃ©xico, CDMX'),('S001','Sucursal Reforma Centro','Comercial','Digital',5542567890,'Reforma',123,'Centro','Ciudad de MÃ©xico, CDMX'),('S001','Sucursal Reforma Centro','Comercial','Sucursales',5542567890,'Reforma',123,'Centro','Ciudad de MÃ©xico, CDMX'),('S002','Sucursal Insurgentes Norte','Inversion','Cajero',5545678901,'Insurgentes Norte',456,'HipÃ³dromo','Ciudad de MÃ©xico, CDMX'),('S002','Sucursal Insurgentes Norte','Inversion','Digital',5545678901,'Insurgentes Norte',456,'HipÃ³dromo','Ciudad de MÃ©xico, CDMX'),('S002','Sucursal Insurgentes Norte','Inversion','Sucursales',5545678901,'Insurgentes Norte',456,'HipÃ³dromo','Ciudad de MÃ©xico, CDMX'),('S003','Sucursal Santa Fe Corporativo','Inversion','Empresarial',5589012345,'Santa Fe',789,'Santa Fe','Ciudad de MÃ©xico, CDMX'),('S004','Sucursal Guadalajara Andares','Desarrollo','Cajero',3312345678,'Andares',101,'Providencia','Guadalajara, Jalisco'),('S004','Sucursal Guadalajara Andares','Desarrollo','Sucursales',3312345678,'Andares',101,'Providencia','Guadalajara, Jalisco'),('S005','Sucursal Monterrey Valle Oriente','Comercial','Cajero',8112345678,'Valle Oriente',202,'Valle Oriente','Monterrey, Nuevo LeÃ³n'),('S005','Sucursal Monterrey Valle Oriente','Comercial','Empresarial',8112345678,'Valle Oriente',202,'Valle Oriente','Monterrey, Nuevo LeÃ³n'),('S005','Sucursal Monterrey Valle Oriente','Comercial','Sucursales',8112345678,'Valle Oriente',202,'Valle Oriente','Monterrey, Nuevo LeÃ³n');
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bd_datos'
--

--
-- Dumping routines for database 'bd_datos'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_iva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_iva`(
    p_monto DECIMAL(15,2),
    p_porcentaje_iva DECIMAL(5,2)
) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE iva DECIMAL(10,2);
    
    -- Calcular IVA: monto * (porcentaje / 100)
    SET iva = p_monto * (p_porcentaje_iva / 100);
    
    RETURN ROUND(iva, 2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validar_y_cargar_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validar_y_cargar_productos`()
BEGIN
    -- DeclaraciÃ³n de variables.
    
    -- Variable 'done': Se usarÃ¡ como bandera (flag) para saber cuÃ¡ndo el cursor ha terminado de leer todas las filas.
    DECLARE done INT DEFAULT FALSE;
    
    -- Variables para almacenar los datos de CADA FILA que lee el cursor.
    DECLARE v_IDProducto VARCHAR(10);
    DECLARE v_NombreProducto VARCHAR(50);
    DECLARE v_Descripcion TEXT;
    DECLARE v_TipoProducto VARCHAR(20);
    DECLARE v_Estado VARCHAR(10);
    DECLARE v_FechaLanzamiento DATE;
    
    -- Variables para el manejo de errores de validaciÃ³n por fila.
    DECLARE error_flag BOOLEAN DEFAULT FALSE; -- Bandera para marcar si la fila actual tiene un error.
    DECLARE error_message VARCHAR(500);     -- Variable para construir el mensaje de error especÃ­fico.
    DECLARE duplicate_count INT DEFAULT 0;    -- Variable para contar duplicados en el archivo de carga.
    
    -- DeclaraciÃ³n del CURSOR 'cur'.
    -- Un cursor es un puntero que permite iterar (recorrer) fila por fila el resultado de un SELECT.
    DECLARE cur CURSOR FOR 
        SELECT IDProducto, NombreProducto, Descripcion, TipoProducto, Estado, FechaLanzamiento
        FROM carga_bruta_productos; -- La tabla fuente de donde se leerÃ¡n los datos.
    
    -- DeclaraciÃ³n de un 'Handler' (manejador de condiciÃ³n).
    -- Le dice a MySQL: "Cuando ocurra la condiciÃ³n 'NOT FOUND' (es decir, el cursor intente leer y no haya mÃ¡s filas)..."
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE; -- "...ejecuta 'SET done = TRUE'".
    
    -- Paso de inicializaciÃ³n:
    -- Asegura que todas las filas en la tabla de carga tengan un estado inicial de 'pendiente'.
    UPDATE carga_bruta_productos SET estatus = 'pendiente' WHERE estatus IS NULL;
    
    -- Abre el cursor. Esto ejecuta el SELECT definido anteriormente y prepara el conjunto de resultados para ser recorrido.
    OPEN cur;
    
    -- Inicia un bucle (loop) etiquetado como 'read_loop'.
    read_loop: LOOP
        -- FETCH: Lee la siguiente fila del cursor y guarda sus valores en las variables declaradas.
        FETCH cur INTO v_IDProducto, v_NombreProducto, v_Descripcion, v_TipoProducto, v_Estado, v_FechaLanzamiento;
        
        -- Comprueba la bandera 'done'. Si 'done' es TRUE (porque el handler 'NOT FOUND' se disparÃ³)...
        IF done THEN
            LEAVE read_loop; -- ...sale del bucle 'read_loop'.
        END IF;
        
        -- --- INICIO DEL PROCESAMIENTO POR FILA ---
        
        -- Reinicia las banderas de error para cada nueva fila que se procesa.
        SET error_flag = FALSE;
        SET error_message = '';
        
        -- INICIO DE VALIDACIONES ---
        
        -- ValidaciÃ³n 1: IDProducto no puede ser nulo o vacÃ­o.
        IF v_IDProducto IS NULL OR v_IDProducto = '' THEN
            SET error_flag = TRUE;
            SET error_message = 'IDProducto nulo';
        
        -- ValidaciÃ³n 2: IDProducto debe tener un formato especÃ­fico (comenzar con 'PROD-').
        ELSEIF NOT v_IDProducto LIKE 'PROD-%' THEN
            SET error_flag = TRUE;
            SET error_message = 'Formato incorrecto';
        
        -- Si el ID tiene formato y no es nulo, se revisan duplicados.
        ELSE
            -- ValidaciÃ³n 2a: Verificar duplicados *dentro del mismo archivo de carga*.
            SELECT COUNT(*) INTO duplicate_count 
            FROM carga_bruta_productos 
            WHERE IDProducto = v_IDProducto;
            
            IF duplicate_count > 1 THEN
                SET error_flag = TRUE;
                SET error_message = 'Duplicado en archivo';
                
            -- ValidaciÃ³n 2b: Verificar si el ID *ya existe en la tabla de producciÃ³n* (productos).
            ELSEIF EXISTS (SELECT 1 FROM productos WHERE IDProducto = v_IDProducto) THEN
                SET error_flag = TRUE;
                SET error_message = 'Ya existe en BD';
            END IF;
                 -- ValidaciÃ³n 3: Si el estado se proporciona (no es nulo), DEBE ser 'Activo'.
        -- (Permite estados nulos, pero rechaza 'Inactivo' u otros).
			IF v_IDProducto IS NULL THEN
				SET error_flag = TRUE;
				SET error_message = ' Valor invÃ¡lido';
			END IF;
        END IF;
        
   
        
        -- --- FIN DE VALIDACIONES ---
        
        -- --- INICIO DE CARGA (INSERCIÃ“N) ---
        
        -- Comprueba la bandera 'error_flag'. Si es FALSE (significa que todas las validaciones pasaron)...
        IF NOT error_flag THEN
            -- Se inicia un bloque 'BEGIN...END' anidado.
            -- Esto es para crear un Ã¡mbito (scope) para el manejador de errores de la inserciÃ³n.
            BEGIN
                -- Manejador de errores *especÃ­fico para la inserciÃ³n*.
                -- Si ocurre cualquier error de SQL (SQLEXCEPTION) durante el INSERT (ej. una 'constraint' violada)...
                DECLARE EXIT HANDLER FOR SQLEXCEPTION 
                BEGIN
                    -- ...actualiza la tabla de carga marcando la fila como 'Error inserciÃ³n'.
                    UPDATE carga_bruta_productos 
                    SET estatus = 'no cargado - Error inserciÃ³n'
                    WHERE IDProducto = v_IDProducto;
                END;
                
                -- Si no hay errores de validaciÃ³n, intenta insertar la fila en la tabla de producciÃ³n 'productos'.
                INSERT INTO productos (IDProducto, NombreProducto, Descripcion, TipoProducto, Estado, FechaLanzamiento) 
                VALUES (
                    v_IDProducto, v_NombreProducto, v_Descripcion, 
                    v_TipoProducto, v_Estado, v_FechaLanzamiento
                );
                
                -- Si el INSERT fue exitoso (no disparÃ³ el 'EXIT HANDLER'), actualiza la tabla de carga como 'cargado'.
                UPDATE carga_bruta_productos 
                SET estatus = 'cargado'
                WHERE IDProducto = v_IDProducto;
                
            END; -- Fin del bloque anidado de inserciÃ³n.
        
        -- Si 'error_flag' era TRUE (la fila fallÃ³ la validaciÃ³n)...
        ELSE
            -- Actualiza la tabla de carga con el estado 'no cargado' y el mensaje de error especÃ­fico.
            UPDATE carga_bruta_productos 
            SET estatus = CONCAT('no cargado - ', error_message)
            WHERE IDProducto = v_IDProducto;
        END IF;
        
    -- Fin del bucle 'read_loop'. Vuelve al inicio del loop para el 'FETCH' de la siguiente fila.
    END LOOP;
    
    -- Cierra el cursor para liberar los recursos de memoria que estaba utilizando.
    CLOSE cur;
    
-- Fin del bloque del procedimiento.
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `eval`
--

/*!50001 DROP VIEW IF EXISTS `eval`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `eval` AS select `productos`.`IDProducto` AS `IDProducto`,`productos`.`NombreProducto` AS `NombreProducto`,`productos`.`Descripcion` AS `Descripcion`,`productos`.`TipoProducto` AS `TipoProducto`,`productos`.`Estado` AS `Estado`,`productos`.`FechaLanzamiento` AS `FechaLanzamiento`,'Algo' AS `x` from `productos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-25 21:10:56
