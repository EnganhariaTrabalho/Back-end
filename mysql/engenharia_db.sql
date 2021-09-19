-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Set-2021 às 18:56
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `numero_usp` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nome_usuario` varchar(255) NOT NULL,
  `nivel` varchar(255) NOT NULL DEFAULT 'ALUNO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `aluno`
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
-- Estrutura da tabela `coordenadoria`
--

CREATE TABLE `coordenadoria` (
  `numero_usp` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nome_usuario` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nivel` varchar(255) NOT NULL DEFAULT 'COORDENADOR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `coordenadoria`
--

INSERT INTO `coordenadoria` (`numero_usp`, `nome`, `email`, `nome_usuario`, `senha`, `nivel`) VALUES
(22222222, 'juan', 'juan@ejcom.br', 'juan', '123', 'COORDENADOR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `formulario`
--

CREATE TABLE `formulario` (
  `cod_formulario` int(11) NOT NULL,
  `numero_usp_aluno` int(11) NOT NULL,
  `numero_usp_professor` int(11) NOT NULL,
  `numero_usp_coordenadoria` int(11) DEFAULT NULL,
  `semestre_curso` varchar(255) NOT NULL,
  `ultima_atualizacao_do_lattes` date NOT NULL COMMENT 'Data da última atualização do lattes',
  `resultado_ultima_avaliacao` varchar(255) NOT NULL COMMENT 'Qual foi o resultado da avaliação do seu último relatório?',
  `aprovacao_obrigatorias` int(11) NOT NULL COMMENT 'Em quantas disciplinas obrigatórias você já obteve aprovação?',
  `aprovacao_optativas` int(11) NOT NULL COMMENT 'Em quantas disciplinas optativas você já obteve aprovação?',
  `conceitos` varchar(255) NOT NULL COMMENT 'Todos os conceitos em disciplinas cursadas no último semestre já foram divulgados?',
  `disciplinas_repovadas_curso` int(11) NOT NULL COMMENT 'Em quantas disciplinas você foi reprovado desde o início do mestrado/doutorado?',
  `disciplinas_repovadas_semestre` int(11) NOT NULL COMMENT 'Em quantas disciplinas você foi reprovado no último semestre cursado?',
  `exame_proeficiencia` varchar(255) NOT NULL COMMENT 'Você já foi aprovado no exame de proficiência em idiomas?',
  `exame_de_qualificacao` varchar(255) NOT NULL COMMENT 'Você já realizou o exame de qualificação?',
  `limite_max_qualificacao` varchar(255) NOT NULL COMMENT 'Se não qualificou, quanto tempo falta para o limite máximo de qualificação?',
  `tempo_limete_deposito` varchar(255) NOT NULL COMMENT 'Se você já fez sua qualificação e foi aprovado, quanto tempo falta para o limite máximo do depósito da sua dissertação/tese?',
  `artigos_publicados` int(11) NOT NULL COMMENT 'Quantos artigos referentes a sua pesquisa de mestrado/doutorado você teve aceitos ou publicados? (Obs: Você deve inserir os artigos publicados no seu currículo Lattes)',
  `artigos_espera` int(11) NOT NULL COMMENT 'Quantos artigos você submeteu e ainda estão aguardando resposta?',
  `artigo_preparacao` varchar(255) NOT NULL COMMENT 'Você possui artigo em preparação para submissão? Qual o estágio dele?',
  `estagio_atual_pesquisa` text NOT NULL COMMENT 'Qual o estágio atual de sua pesquisa?',
  `congresso` text NOT NULL COMMENT 'Você participou de algum congressos no país? Se sim, indicar local, se houve apresentação de trabalho e se o congresso é ou não internacional.',
  `congresso_extorior` text NOT NULL COMMENT 'Você participou de algum congresso no exterior? Se sim, indicar local e se houve apresentação de trabalho.',
  `pesquisa_exterior` text NOT NULL COMMENT 'Você realizou algum estágio de pesquisa ou visita de pesquisa no exterior (incluindo sanduíche)? Se sim, indique o nome da universidade e o período.',
  `declaracao` text NOT NULL COMMENT 'Você tem algo a mais a declarar para a CCP - PPgSI?',
  `comentario_orientador` text DEFAULT NULL COMMENT 'Comentários finais do ORIENTANDO sobre seu desempenho no último semestre, considerando o relatório reapresentado:',
  `comentario_coordenadoria` text DEFAULT NULL COMMENT 'Comentários finais do COORDENADORIA sobre seu desempenho no último semestre, considerando o relatório reapresentado:'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `formulario`
--

INSERT INTO `formulario` (`cod_formulario`, `numero_usp_aluno`, `numero_usp_professor`, `numero_usp_coordenadoria`, `semestre_curso`, `ultima_atualizacao_do_lattes`, `resultado_ultima_avaliacao`, `aprovacao_obrigatorias`, `aprovacao_optativas`, `conceitos`, `disciplinas_repovadas_curso`, `disciplinas_repovadas_semestre`, `exame_proeficiencia`, `exame_de_qualificacao`, `limite_max_qualificacao`, `tempo_limete_deposito`, `artigos_publicados`, `artigos_espera`, `artigo_preparacao`, `estagio_atual_pesquisa`, `congresso`, `congresso_extorior`, `pesquisa_exterior`, `declaracao`, `comentario_orientador`, `comentario_coordenadoria`) VALUES
(1223333, 101, 333333333, NULL, '1', '1996-10-05', '1', 2, 2, '2', 2, 2, '2', '2', '2', '2', 2, 2, '2', '2', '2', '2', '2', '2', NULL, NULL),
(3439160, 222222222, 333333333, NULL, '', '0000-00-00', '', 0, 0, '', 0, 0, '', '', '', '', 0, 0, '', '', '', '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `informacao_aluno`
--

CREATE TABLE `informacao_aluno` (
  `numero_usp_aluno` int(11) NOT NULL,
  `numero_usp_professor` int(11) NOT NULL,
  `lattes` varchar(255) NOT NULL,
  `curso` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `informacao_aluno`
--

INSERT INTO `informacao_aluno` (`numero_usp_aluno`, `numero_usp_professor`, `lattes`, `curso`) VALUES
(1010145, 333333333, 'http//', 'mestrado'),
(1010149, 333333333, 'http//', 'mestrado'),
(101014912, 333333333, 'http//', 'mestrado'),
(10101, 333333333, 'http//', 'mestrado'),
(101, 333333333, 'http//', 'mestrado'),
(222222222, 333333333, 'http//', 'mestrado'),
(222222222, 333333333, 'http//', 'mestrado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `numero_usp` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nome_usuario` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nivel` varchar(255) NOT NULL DEFAULT 'PROFESSOR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`numero_usp`, `nome`, `email`, `nome_usuario`, `senha`, `nivel`) VALUES
(333333333, 'nicolas matias', 'nicolas@ejsom.br', 'ncsmatias', '123', 'PROFESSOR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `status`
--

CREATE TABLE `status` (
  `cod_status` int(11) NOT NULL,
  `cod_formulario` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `avaliacao_professor` varchar(255) DEFAULT NULL,
  `avaliacao_coordenadoria` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `status`
--

INSERT INTO `status` (`cod_status`, `cod_formulario`, `status`, `data`, `avaliacao_professor`, `avaliacao_coordenadoria`) VALUES
(3560793, 3439160, 'Enviado para o professor', '2021-09-19', '', '');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`numero_usp`);

--
-- Índices para tabela `coordenadoria`
--
ALTER TABLE `coordenadoria`
  ADD PRIMARY KEY (`numero_usp`);

--
-- Índices para tabela `formulario`
--
ALTER TABLE `formulario`
  ADD PRIMARY KEY (`cod_formulario`),
  ADD KEY `fk_professor_info_formulario` (`numero_usp_professor`),
  ADD KEY `fk_coordenadoria_info_formulario` (`numero_usp_coordenadoria`),
  ADD KEY `fk_aluno_info_formulario` (`numero_usp_aluno`);

--
-- Índices para tabela `informacao_aluno`
--
ALTER TABLE `informacao_aluno`
  ADD KEY `numero_usp_aluno` (`numero_usp_aluno`),
  ADD KEY `numero_usp_professor` (`numero_usp_professor`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`numero_usp`);

--
-- Índices para tabela `status`
--
ALTER TABLE `status`
  ADD KEY `fk_formulario_info_status` (`cod_formulario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `formulario`
--
ALTER TABLE `formulario`
  MODIFY `cod_formulario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3439161;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `formulario`
--
ALTER TABLE `formulario`
  ADD CONSTRAINT `fk_aluno_info_formulario` FOREIGN KEY (`numero_usp_aluno`) REFERENCES `aluno` (`numero_usp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_coordenadoria_info_formulario` FOREIGN KEY (`numero_usp_coordenadoria`) REFERENCES `coordenadoria` (`numero_usp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_professor_info_formulario` FOREIGN KEY (`numero_usp_professor`) REFERENCES `professor` (`numero_usp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `informacao_aluno`
--
ALTER TABLE `informacao_aluno`
  ADD CONSTRAINT `numero_usp_aluno` FOREIGN KEY (`numero_usp_aluno`) REFERENCES `aluno` (`numero_usp`),
  ADD CONSTRAINT `numero_usp_professor` FOREIGN KEY (`numero_usp_professor`) REFERENCES `professor` (`numero_usp`);

--
-- Limitadores para a tabela `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `fk_formulario_info_status` FOREIGN KEY (`cod_formulario`) REFERENCES `formulario` (`cod_formulario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
