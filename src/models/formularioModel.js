const connection = require('../config/connection');
const queryExecuter = require('../helpers/queryExecuter');


module.exports = {
    insert({cod_formulario, numero_usp_aluno, numero_usp_professor, 
        semestre_curso, ultima_atualizacao_do_lattes, resultado_ultima_avaliacao, aprovacao_obrigatorias, 
        aprovacao_optativas, conceitos, disciplinas_repovadas_curso, disciplinas_repovadas_semestre, 
        exame_proeficiencia, exame_de_qualificacao, limite_max_qualificacao, tempo_limete_deposito, 
        artigos_publicados, artigos_espera, artigo_preparacao, estagio_atual_pesquisa, congresso, 
        congresso_extorior, pesquisa_exterior, declaracao}) {

        let query  = "INSERT INTO formulario";
        query +=" (cod_formulario, numero_usp_aluno, numero_usp_professor, semestre_curso," + 
                   "ultima_atualizacao_do_lattes, resultado_ultima_avaliacao, aprovacao_obrigatorias, aprovacao_optativas," + 
                   "conceitos, disciplinas_repovadas_curso, disciplinas_repovadas_semestre, exame_proeficiencia," + 
                   "exame_de_qualificacao,limite_max_qualificacao, tempo_limete_deposito, artigos_publicados, artigos_espera," + 
                   "artigo_preparacao, estagio_atual_pesquisa,congresso ,congresso_extorior, pesquisa_exterior, declaracao)" + 
                   "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        return queryExecuter(connection, query, [
            cod_formulario, numero_usp_aluno, numero_usp_professor, 
        semestre_curso, ultima_atualizacao_do_lattes, resultado_ultima_avaliacao, aprovacao_obrigatorias, 
        aprovacao_optativas, conceitos, disciplinas_repovadas_curso, disciplinas_repovadas_semestre, 
        exame_proeficiencia, exame_de_qualificacao, limite_max_qualificacao, tempo_limete_deposito, 
        artigos_publicados, artigos_espera, artigo_preparacao, estagio_atual_pesquisa, congresso, 
        congresso_extorior, pesquisa_exterior, declaracao 
        ]);
    },

    insertProfessor({comentario_orientador, cod_formulario}) {

        return queryExecuter(connection, "UPDATE formulario SET comentario_orientador = ? WHERE cod_formulario = ?", [comentario_orientador, cod_formulario])
    },
    
    insertCoordinator({comentario_coordenadoria, numero_usp_coordenadoria, cod_formulario}) {

        return queryExecuter(connection, "UPDATE formulario SET comentario_coordenadoria = ?, numero_usp_coordenadoria = ?  WHERE cod_formulario = ?", [comentario_coordenadoria, numero_usp_coordenadoria, cod_formulario])
    }, 

    getAll() {
        return queryExecuter(connection, "SELECT * FROM formulario", [])
    },

    getForms(cod_formulario) {
        return queryExecuter(connection, "SELECT * FROM formulario WHERE cod_formulario = ?", [cod_formulario])
    },

    getStudent(numero_usp_aluno) {
        return queryExecuter(connection, "SELECT * FROM formulario WHERE numero_usp_aluno = ?", [numero_usp_aluno])
    },

    getProfessor(numero_usp_professor) {
        return queryExecuter(connection, "SELECT * FROM formulario WHERE numero_usp_professor = ?", [numero_usp_professor])
    },

    delete(cod_formulario) {
        try {
            return queryExecuter(connection, "DELETE FROM formulario WHERE cod_formulario = ?", [cod_formulario]);
        } catch(e) {
            throw e;
        }
    },

    update(formulario, cod_formulario) {
        try {
            let query  = "UPDATE formulario SET";
            query +=" semestre_curso = ?," + 
                   "ultima_atualizacao_do_lattes = ?, resultado_ultima_avaliacao = ?, aprovacao_obrigatorias= ?, aprovacao_optativas= ?, " + 
                   "conceitos= ?, disciplinas_repovadas_curso= ?, disciplinas_repovadas_semestre= ?, exame_proeficiencia= ?, " + 
                   "exame_de_qualificacao= ?,limite_max_qualificacao= ?, tempo_limete_deposito= ?, artigos_publicados= ?, artigos_espera= ?, " + 
                   "artigo_preparacao= ?, estagio_atual_pesquisa= ?,congresso = ?,congresso_extorior= ?, pesquisa_exterior= ?, declaracao= ? " + 
                   "WHERE cod_formulario = ?";
            return queryExecuter(connection, query, [
            formulario.semestre_curso, formulario.ultima_atualizacao_do_lattes, formulario.resultado_ultima_avaliacao, formulario.aprovacao_obrigatorias, 
            formulario.aprovacao_optativas, formulario.conceitos, formulario.disciplinas_repovadas_curso, formulario.disciplinas_repovadas_semestre, 
            formulario.exame_proeficiencia, formulario.exame_de_qualificacao, formulario.limite_max_qualificacao, formulario.tempo_limete_deposito, 
            formulario.artigos_publicados, formulario.artigos_espera, formulario.artigo_preparacao, formulario.estagio_atual_pesquisa, formulario.congresso, 
            formulario.congresso_extorior, formulario.pesquisa_exterior, formulario.declaracao, cod_formulario
            ]);
        } catch(e) {
            throw e;
        }
    }
}