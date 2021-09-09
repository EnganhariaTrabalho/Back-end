-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geraÃ§Ã£o: 06/09/2021 Ã s 18:03
-- VersÃ£o do servidor: 8.0.26-0ubuntu0.20.04.2
-- VersÃ£o do PHP: 7.4.3

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
(101, 'some', 'some4', '123', 'some', 'ALUNO'),
(1222, 'Nicolas', 'nicolas@nicolas', 'q1121awaasas', 'ncsmatias', 'ALUNO'),
(10101, 'some', 'some4', '123', 'some', 'ALUNO'),
(1010145, 'some', 'some2', '123', 'some', 'ALUNO'),
(1010149, 'some', 'some3', '123', 'some', 'ALUNO'),
(1010178, 'some', 'some', '123', 'some', 'ALUNO'),
(1010179, 'some', 'some1', '123', 'some', 'ALUNO'),
(10101010, 'nicolas matias', 'tonho@ejcomp.com', '123', 'joÃ£o', 'ALUNO'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `semestre_curso` varchar(255) CHARACTER SET utf8mb4,
  `ultima_atualizacao_do_lattes` date NOT NULL COMMENT 'Data da Ãºltima atualizaÃ§Ã£o do lattes',
  `resultado_ultima_avaliacao` varchar(255) NOT NULL COMMENT 'Qual foi o resultado da avaliaÃ§Ã£o do seu Ãºltimo relatÃ³rio?',
  `aprovacao_obrigatorias` int NOT NULL COMMENT 'Em quantas disciplinas obrigatÃ³rias vocÃª jÃ¡ obteve aprovaÃ§Ã£o?',
  `aprovacao_optativas` int NOT NULL COMMENT 'Em quantas disciplinas optativas vocÃª jÃ¡ obteve aprovaÃ§Ã£o?',
  `conceitos` varchar(255) NOT NULL COMMENT 'Todos os conceitos em disciplinas cursadas no Ãºltimo semestre jÃ¡ foram divulgados?',
  `disciplinas_repovadas_curso` int NOT NULL COMMENT 'Em quantas disciplinas vocÃª foi reprovado desde o inÃ­cio do mestrado/doutorado?',
  `disciplinas_repovadas_semestre` int NOT NULL COMMENT 'Em quantas disciplinas vocÃª foi reprovado no Ãºltimo semestre cursado?',
  `exame_proeficiencia` varchar(255) NOT NULL COMMENT 'VocÃª jÃ¡ foi aprovado no exame de proficiÃªncia em idiomas?',
  `exame_de_qualificacao` varchar(255) NOT NULL COMMENT 'VocÃª jÃ¡ realizou o exame de qualificaÃ§Ã£o?',
  `limite_max_qualificacao` varchar(255) NOT NULL COMMENT 'Se nÃ£o qualificou, quanto tempo falta para o limite mÃ¡ximo de qualificaÃ§Ã£o?',
  `tempo_limite_deposito` varchar(255) NOT NULL COMMENT 'Se vocÃª jÃ¡ fez sua qualificaÃ§Ã£o e foi aprovado, quanto tempo falta para o limite mÃ¡ximo do depÃ³sito da sua dissertaÃ§Ã£o/tese?',
  `artigos_publicados` int NOT NULL COMMENT 'Quantos artigos referentes a sua pesquisa de mestrado/doutorado vocÃª teve aceitos ou publicados? (Obs: VocÃª deve inserir os artigos publicados no seu currÃ­culo Lattes)',
  `artigos_espera` int NOT NULL COMMENT 'Quantos artigos vocÃª submeteu e ainda estÃ£o aguardando resposta?',
  `artigo_preparacao` varchar(255) NOT NULL COMMENT 'VocÃª possui artigo em preparaÃ§Ã£o para submissÃ£o? Qual o estÃ¡gio dele?',
  `estagio_atual_pesquisa` text NOT NULL COMMENT 'Qual o estÃ¡gio atual de sua pesquisa?',
  `congresso` text NOT NULL COMMENT 'VocÃª participou de algum congressos no paÃ­s? Se sim, indicar local, se houve apresentaÃ§Ã£o de trabalho e se o congresso Ã© ou nÃ£o internacional.',
  `congresso_exterior` text NOT NULL COMMENT 'VocÃª participou de algum congresso no exterior? Se sim, indicar local e se houve apresentaÃ§Ã£o de trabalho.',
  `pesquisa_exterior` text NOT NULL COMMENT 'VocÃª realizou algum estÃ¡gio de pesquisa ou visita de pesquisa no exterior (incluindo sanduÃ­che)? Se sim, indique o nome da universidade e o perÃ­odo.',
  `declaracao` text NOT NULL COMMENT 'VocÃª tem algo a mais a declarar para a CCP - PPgSI?',
  `comentario_orientador` text COMMENT 'ComentÃ¡rios finais do ORIENTANDO sobre seu desempenho no Ãºltimo semestre, considerando o relatÃ³rio reapresentado:',
  `comentario_coordenadoria` text COMMENT 'ComentÃ¡rios finais do COORDENADORIA sobre seu desempenho no Ãºltimo semestre, considerando o relatÃ³rio reapresentado:'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `formulario`
--

INSERT INTO `formulario` (`cod_formulario`, `numero_usp_aluno`, `numero_usp_professor`, `numero_usp_coordenadoria`, `semestre_curso`, `ultima_atualizacao_do_lattes`, `resultado_ultima_avaliacao`, `aprovacao_obrigatorias`, `aprovacao_optativas`, `conceitos`, `disciplinas_repovadas_curso`, `disciplinas_repovadas_semestre`, `exame_proeficiencia`, `exame_de_qualificacao`, `limite_max_qualificacao`, `tempo_limite_deposito`, `artigos_publicados`, `artigos_espera`, `artigo_preparacao`, `estagio_atual_pesquisa`, `congresso`, `congresso_exterior`, `pesquisa_exterior`, `declaracao`, `comentario_orientador`, `comentario_coordenadoria`) VALUES
(1223333, 101, 333333333, NULL, '2', '2010-09-20', 'aprovado', 10, 12, 'conceito', 10, 10, 'sim', 'nao', 'sim', '12', 2, 12, '222', 'aasasasassaasasasasasasassdfafsdf', 'skdhakjdnscmaskcnaskcbalkjaslcjkbaslcbALCN', 'KXKASHDKASJDKASJDASJDHASKJDASDAS', 'lksjaoshdoaskdsakjdsdjkadskjhaskdasd', 'sakdnoasihdlasdhkasjkjsdsjdas', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `informacao_aluno`
--

CREATE TABLE `informacao_aluno` (
  `numero_usp_aluno` int NOT NULL,
  `numero_usp_professor` int NOT NULL,
  `lattes` varchar(255) CHARACTER SET utf8mb4,
  `curso` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Ã�ndices de tabelas apagadas
--

--
-- Ã�ndices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`numero_usp`);

--
-- Ã�ndices de tabela `coordenadoria`
--
ALTER TABLE `coordenadoria`
  ADD PRIMARY KEY (`numero_usp`);

--
-- Ã�ndices de tabela `formulario`
--
ALTER TABLE `formulario`
  ADD PRIMARY KEY (`cod_formulario`),
  ADD KEY `fk_professor_info_formulario` (`numero_usp_professor`),
  ADD KEY `fk_coordenadoria_info_formulario` (`numero_usp_coordenadoria`),
  ADD KEY `fk_aluno_info_formulario` (`numero_usp_aluno`);

--
-- Ã�ndices de tabela `informacao_aluno`
--
ALTER TABLE `informacao_aluno`
  ADD KEY `numero_usp_aluno` (`numero_usp_aluno`),
  ADD KEY `numero_usp_professor` (`numero_usp_professor`);

--
-- Ã�ndices de tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`numero_usp`);

--
-- Ã�ndices de tabela `status`
--
ALTER TABLE `status`
  ADD KEY `fk_formulario_info_status` (`cod_formulario`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `formulario`
--
ALTER TABLE `formulario`
  MODIFY `cod_formulario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1223334;

--
-- RestriÃ§Ãµes para dumps de tabelas
--

--
-- RestriÃ§Ãµes para tabelas `formulario`
--
ALTER TABLE `formulario`
  ADD CONSTRAINT `fk_aluno_info_formulario` FOREIGN KEY (`numero_usp_aluno`) REFERENCES `aluno` (`numero_usp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_coordenadoria_info_formulario` FOREIGN KEY (`numero_usp_coordenadoria`) REFERENCES `coordenadoria` (`numero_usp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_professor_info_formulario` FOREIGN KEY (`numero_usp_professor`) REFERENCES `professor` (`numero_usp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- RestriÃ§Ãµes para tabelas `informacao_aluno`
--
ALTER TABLE `informacao_aluno`
  ADD CONSTRAINT `numero_usp_aluno` FOREIGN KEY (`numero_usp_aluno`) REFERENCES `aluno` (`numero_usp`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `numero_usp_professor` FOREIGN KEY (`numero_usp_professor`) REFERENCES `professor` (`numero_usp`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- RestriÃ§Ãµes para tabelas `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `fk_formulario_info_status` FOREIGN KEY (`cod_formulario`) REFERENCES `formulario` (`cod_formulario`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
