use es1;

-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 31/08/2021 às 17:51
-- Versão do servidor: 8.0.26-0ubuntu0.20.04.2
-- Versão do PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `engenharia_db`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `numero_usp` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nome_usuario` varchar(255) NOT NULL,
  `nivel` varchar(255) NOT NULL DEFAULT 'ALUNO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `aluno`
--

INSERT INTO `aluno` (`numero_usp`, `nome`, `email`, `senha`, `nome_usuario`, `nivel`) VALUES
(1222, 'Nicolas', 'nicolas@nicolas', 'q1121awaasas', 'ncsmatias', 'ALUNO'),
(1010145, 'some', 'some2', '123', 'some', 'ALUNO'),
(1010178, 'some', 'some', '123', 'some', 'ALUNO'),
(1010179, 'some', 'some1', '123', 'some', 'ALUNO'),
(10101010, 'nicolas matias', 'tonho@ejcomp.com', '123', 'joão', 'ALUNO'),
(222222222, 'nicolas matias', 'tilt@ejcomp.com', '123', 'ncsmatias', 'ALUNO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `coordenadoria`
--

CREATE TABLE `coordenadoria` (
  `numero_usp` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nome_usuario` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nivel` varchar(255) NOT NULL DEFAULT 'COORDENADOR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `coordenadoria`
--

INSERT INTO `coordenadoria` (`numero_usp`, `nome`, `email`, `nome_usuario`, `senha`, `nivel`) VALUES
(22222222, 'juan', 'juan@ejcom.br', 'juan', '123', 'COORDENADOR');

-- --------------------------------------------------------

--
-- Estrutura para tabela `informacao_aluno`
--

CREATE TABLE `informacao_aluno` (
  `numero_usp_aluno` int NOT NULL,
  `numero_usp_professor` int NOT NULL,
  `lattes` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `curso` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `informacao_aluno`
--

INSERT INTO `informacao_aluno` (`numero_usp_aluno`, `numero_usp_professor`, `lattes`, `curso`) VALUES
(1010145, 333333333, 'http//', 'mestrado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor`
--

CREATE TABLE `professor` (
  `numero_usp` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nome_usuario` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nivel` varchar(255) NOT NULL DEFAULT 'PROFESSOR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `professor`
--

INSERT INTO `professor` (`numero_usp`, `nome`, `email`, `nome_usuario`, `senha`, `nivel`) VALUES
(333333333, 'nicolas matias', 'nicolas@ejsom.br', 'ncsmatias', '123', 'PROFESSOR');

--
-- �?ndices de tabelas apagadas
--

--
-- �?ndices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`numero_usp`);

--
-- �?ndices de tabela `coordenadoria`
--
ALTER TABLE `coordenadoria`
  ADD PRIMARY KEY (`numero_usp`);

--
-- �?ndices de tabela `informacao_aluno`
--
ALTER TABLE `informacao_aluno`
  ADD KEY `numero_usp_aluno` (`numero_usp_aluno`),
  ADD KEY `numero_usp_professor` (`numero_usp_professor`);

--
-- �?ndices de tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`numero_usp`);

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `informacao_aluno`
--
ALTER TABLE `informacao_aluno`
  ADD CONSTRAINT `numero_usp_aluno` FOREIGN KEY (`numero_usp_aluno`) REFERENCES `aluno` (`numero_usp`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `numero_usp_professor` FOREIGN KEY (`numero_usp_professor`) REFERENCES `professor` (`numero_usp`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
