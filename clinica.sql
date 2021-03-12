-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 12/03/2021 às 12:15
-- Versão do servidor: 5.7.31
-- Versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `andar`
--

DROP TABLE IF EXISTS `andar`;
CREATE TABLE IF NOT EXISTS `andar` (
  `NumAndar` int(11) NOT NULL,
  `DecscricaoAndar` text,
  PRIMARY KEY (`NumAndar`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `enfermaria`
--

DROP TABLE IF EXISTS `enfermaria`;
CREATE TABLE IF NOT EXISTS `enfermaria` (
  `NumAndar` int(11) DEFAULT NULL,
  `CodEnfermaria` varchar(20) NOT NULL,
  `NomeInfermaria` varchar(30) DEFAULT NULL,
  `SituacaoInfermaria` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CodEnfermaria`),
  KEY `fk_AndarEnferm` (`NumAndar`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
CREATE TABLE IF NOT EXISTS `especialidade` (
  `CodEspecialidade` int(11) NOT NULL,
  `NomeEspecialidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CodEspecialidade`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `internado`
--

DROP TABLE IF EXISTS `internado`;
CREATE TABLE IF NOT EXISTS `internado` (
  `Registro` int(11) NOT NULL,
  `NumLeito` int(11) NOT NULL,
  `CRM` int(11) NOT NULL,
  `Naturaidade` varchar(20) DEFAULT ' BRASIL',
  `DataInternacao` date DEFAULT NULL,
  `DataAlta` date DEFAULT NULL,
  `QuantidadeDiasInternado` int(11) DEFAULT NULL,
  PRIMARY KEY (`Registro`,`NumLeito`,`CRM`),
  KEY `fk_NumLeitoInternado` (`NumLeito`),
  KEY `fk_CRMInternado` (`CRM`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `leito`
--

DROP TABLE IF EXISTS `leito`;
CREATE TABLE IF NOT EXISTS `leito` (
  `NumLeito` int(11) NOT NULL,
  `SituacaoLeito` text,
  `CodTipo` int(11) DEFAULT NULL,
  `CodEspecialidade` int(11) DEFAULT NULL,
  `NumAndar` int(11) DEFAULT NULL,
  `CodEnfermaria` varchar(30) DEFAULT NULL,
  `TipoEspecialidade` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`NumLeito`),
  KEY `fk_TipoLeito` (`CodTipo`),
  KEY `fk_CodespLeito` (`CodEspecialidade`),
  KEY `fk_AndarLeito` (`NumAndar`),
  KEY `fk_EnfrmLeito` (`CodEnfermaria`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

DROP TABLE IF EXISTS `medico`;
CREATE TABLE IF NOT EXISTS `medico` (
  `CRM` int(11) NOT NULL,
  `NomeMedico` varchar(30) DEFAULT NULL,
  `NomeDepto` varchar(30) DEFAULT NULL,
  `ChefeDepartamento` varchar(30) DEFAULT NULL,
  `CodEspecialidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`CRM`),
  KEY `fk_EspMedico` (`CodEspecialidade`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `Registro` int(11) NOT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `DataNascimento` date DEFAULT NULL,
  `Sexo` enum('M','F') DEFAULT NULL,
  `Rua` varchar(50) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`Registro`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefonepaciente`
--

DROP TABLE IF EXISTS `telefonepaciente`;
CREATE TABLE IF NOT EXISTS `telefonepaciente` (
  `Registro` int(11) DEFAULT NULL,
  `Telefone` varchar(10) NOT NULL,
  PRIMARY KEY (`Telefone`),
  KEY `fk_PaciTel` (`Registro`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo`
--

DROP TABLE IF EXISTS `tipo`;
CREATE TABLE IF NOT EXISTS `tipo` (
  `CodTipo` int(11) NOT NULL,
  `NomeTipo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CodTipo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
