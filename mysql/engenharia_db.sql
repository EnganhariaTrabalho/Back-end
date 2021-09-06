-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 06/09/2021 às 16:46
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `aluno`
--

INSERT INTO `aluno` (`numero_usp`, `nome`, `email`, `senha`, `nome_usuario`, `nivel`) VALUES
(101, 'some', 'some4', '123', 'some', 'ALUNO'),
(1222, 'Nicolas', 'nicolas@nicolas', 'q1121awaasas', 'ncsmatias', 'ALUNO'),
(10101, 'some', 'some4', '123', 'some', 'ALUNO'),
(1010145, 'some', 'some2', '123', 'some', 'ALUNO'),
(1010149, 'some', 'some3', '123', 'some', 'ALUNO'),
(1010178, 'some', 'some', '123', 'some', 'ALUNO'),
(1010179, 'some', 'some1', '123', 'some', 'ALUNO'),
(10101010, 'nicolas matias', 'tonho@ejcomp.com', '123', 'joão', 'ALUNO'),
(101014912, 'some', 'some4', '123', 'some', 'ALUNO'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `coordenadoria`
--

INSERT INTO `coordenadoria` (`numero_usp`, `nome`, `email`, `nome_usuario`, `senha`, `nivel`) VALUES
(22222222, 'juan', 'juan@ejcom.br', 'juan', '123', 'COORDENADOR');

-- --------------------------------------------------------

--
-- Estrutura para tabela `formulario`
--

CREATE TABLE `formulario` (
  `cod_formulario` int NOT NULL,
  `numero_usp_aluno` int NOT NULL,
  `numero_usp_professor` int NOT NULL,
  `numero_usp_coordenadoria` int DEFAULT NULL,
  `ultima_atualizacao_do_lattes` date NOT NULL COMMENT 'Data da última atualização do lattes',
  `ultima_avaliação` date NOT NULL COMMENT 'Qual foi o resultado da avaliação do seu último relatório?',
  `aprovação_obrigatorias` int NOT NULL COMMENT 'Em quantas disciplinas obrigatórias você já obteve aprovação?',
  `aprovação_optativas` int NOT NULL COMMENT 'Em quantas disciplinas optativas você já obteve aprovação?',
  `conceitos` varchar(255) NOT NULL COMMENT 'Todos os conceitos em disciplinas cursadas no último semestre já foram divulgados?',
  `disciplinas_repovadas_curso` int NOT NULL COMMENT 'Em quantas disciplinas você foi reprovado desde o início do mestrado/doutorado?',
  `disciplinas_repovadas_semestre` int NOT NULL COMMENT 'Em quantas disciplinas você foi reprovado no último semestre cursado?',
  `exame_proeficiencia` varchar(255) NOT NULL COMMENT 'Você já foi aprovado no exame de proficiência em idiomas?',
  `exame_de_qualificacao` varchar(255) NOT NULL COMMENT 'Você já realizou o exame de qualificação?',
  `limite_max_qualificacao` varchar(255) NOT NULL COMMENT 'Se não qualificou, quanto tempo falta para o limite máximo de qualificação?',
  `tempo_limete_deposito` varchar(255) NOT NULL COMMENT 'Se você já fez sua qualificação e foi aprovado, quanto tempo falta para o limite máximo do depósito da sua dissertação/tese?',
  `artigos_publicados` int NOT NULL COMMENT 'Quantos artigos referentes a sua pesquisa de mestrado/doutorado você teve aceitos ou publicados? (Obs: Você deve inserir os artigos publicados no seu currículo Lattes)',
  `artigos_espera` int NOT NULL COMMENT 'Quantos artigos você submeteu e ainda estão aguardando resposta?',
  `artigo_preparacao` varchar(255) NOT NULL COMMENT 'Você possui artigo em preparação para submissão? Qual o estágio dele?',
  `estagio_atual_pesquisa` text NOT NULL COMMENT 'Qual o estágio atual de sua pesquisa?',
  `congresso` text NOT NULL COMMENT 'Você participou de algum congressos no país? Se sim, indicar local, se houve apresentação de trabalho e se o congresso é ou não internacional.',
  `congresso_extorior` text NOT NULL COMMENT 'Você participou de algum congresso no exterior? Se sim, indicar local e se houve apresentação de trabalho.',
  `pesquisa_exterior` text NOT NULL COMMENT 'Você realizou algum estágio de pesquisa ou visita de pesquisa no exterior (incluindo sanduíche)? Se sim, indique o nome da universidade e o período.',
  `declaracao` text NOT NULL COMMENT 'Você tem algo a mais a declarar para a CCP - PPgSI?',
  `comentario_orientador` text COMMENT 'Comentários finais do ORIENTANDO sobre seu desempenho no último semestre, considerando o relatório reapresentado:',
  `comentario_coordenadoria` text COMMENT 'Comentários finais do COORDENADORIA sobre seu desempenho no último semestre, considerando o relatório reapresentado:'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `informacao_aluno`
--

CREATE TABLE `informacao_aluno` (
  `numero_usp_aluno` int NOT NULL,
  `numero_usp_professor` int NOT NULL,
  `lattes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `curso` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `informacao_aluno`
--

INSERT INTO `informacao_aluno` (`numero_usp_aluno`, `numero_usp_professor`, `lattes`, `curso`) VALUES
(1010145, 333333333, 'http//', 'mestrado'),
(1010149, 333333333, 'http//', 'mestrado'),
(101014912, 333333333, 'http//', 'mestrado'),
(10101, 333333333, 'http//', 'mestrado'),
(101, 333333333, 'http//', 'mestrado');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `professor`
--

INSERT INTO `professor` (`numero_usp`, `nome`, `email`, `nome_usuario`, `senha`, `nivel`) VALUES
(333333333, 'nicolas matias', 'nicolas@ejsom.br', 'ncsmatias', '123', 'PROFESSOR');

-- --------------------------------------------------------

--
-- Estrutura para tabela `status`
--

CREATE TABLE `status` (
  `cod_status` int NOT NULL,
  `cod_formulario` int NOT NULL,
  `status` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `avaliacao_professor` varchar(255) DEFAULT NULL,
  `avaliacao_coordenadoria` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`numero_usp`);

--
-- Índices de tabela `coordenadoria`
--
ALTER TABLE `coordenadoria`
  ADD PRIMARY KEY (`numero_usp`);

--
-- Índices de tabela `formulario`
--
ALTER TABLE `formulario`
  ADD PRIMARY KEY (`cod_formulario`),
  ADD KEY `fk_professor_info_formulario` (`numero_usp_professor`),
  ADD KEY `fk_coordenadoria_info_formulario` (`numero_usp_coordenadoria`),
  ADD KEY `fk_aluno_info_formulario` (`numero_usp_aluno`);

--
-- Índices de tabela `informacao_aluno`
--
ALTER TABLE `informacao_aluno`
  ADD KEY `numero_usp_aluno` (`numero_usp_aluno`),
  ADD KEY `numero_usp_professor` (`numero_usp_professor`);

--
-- Índices de tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`numero_usp`);

--
-- Índices de tabela `status`
--
ALTER TABLE `status`
  ADD KEY `fk_formulario_info_status` (`cod_formulario`);

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `formulario`
--
ALTER TABLE `formulario`
  ADD CONSTRAINT `fk_aluno_info_formulario` FOREIGN KEY (`numero_usp_aluno`) REFERENCES `aluno` (`numero_usp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_coordenadoria_info_formulario` FOREIGN KEY (`numero_usp_coordenadoria`) REFERENCES `coordenadoria` (`numero_usp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_professor_info_formulario` FOREIGN KEY (`numero_usp_professor`) REFERENCES `professor` (`numero_usp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `informacao_aluno`
--
ALTER TABLE `informacao_aluno`
  ADD CONSTRAINT `numero_usp_aluno` FOREIGN KEY (`numero_usp_aluno`) REFERENCES `aluno` (`numero_usp`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `numero_usp_professor` FOREIGN KEY (`numero_usp_professor`) REFERENCES `professor` (`numero_usp`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `fk_formulario_info_status` FOREIGN KEY (`cod_formulario`) REFERENCES `formulario` (`cod_formulario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
