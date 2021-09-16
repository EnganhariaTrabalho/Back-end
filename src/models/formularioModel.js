const connection = require('../config/connection');
const queryExecuter = require('../helpers/queryExecuter');


module.exports = {
    insert({cod_formulario, numero_usp_aluno, numero_usp_professor, 
        semestre_curso, ultima_atualizacao_do_lattes, resultado_ultima_avaliação, aprovação_obrigatorias, 
        aprovação_optativas, conceitos, disciplinas_repovadas_curso, disciplinas_repovadas_semestre, 
        exame_proeficiencia, exame_de_qualificacao, limite_max_qualificacao, tempo_limete_deposito, 
        artigos_publicados, artigos_espera, artigo_preparacao, estagio_atual_pesquisa, congresso, 
        congresso_extorior, pesquisa_exterior, declaracao}) {

        let query  = "INSERT INTO formulario";
        query +=" (cod_formulario, numero_usp_aluno, numero_usp_professor, semestre_curso," + 
                   "ultima_atualizacao_do_lattes, resultado_ultima_avaliação, aprovação_obrigatorias, aprovação_optativas," + 
                   "conceitos, disciplinas_repovadas_curso, disciplinas_repovadas_semestre, exame_proeficiencia," + 
                   "exame_de_qualificacao,limite_max_qualificacao, tempo_limete_deposito, artigos_publicados, artigos_espera," + 
                   "artigo_preparacao, estagio_atual_pesquisa,congresso ,congresso_extorior, pesquisa_exterior, declaracao)" + 
                   "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        return queryExecuter(connection, query, [
            cod_formulario, numero_usp_aluno, numero_usp_professor, 
        semestre_curso, ultima_atualizacao_do_lattes, resultado_ultima_avaliação, aprovação_obrigatorias, 
        aprovação_optativas, conceitos, disciplinas_repovadas_curso, disciplinas_repovadas_semestre, 
        exame_proeficiencia, exame_de_qualificacao, limite_max_qualificacao, tempo_limete_deposito, 
        artigos_publicados, artigos_espera, artigo_preparacao, estagio_atual_pesquisa, congresso, 
        congresso_extorior, pesquisa_exterior, declaracao 
        ]);
    },

    getAll() {
        return queryExecuter(connection, "SELECT * FROM formulario", [])
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
            query +=" (semestre_curso = ?," + 
                   "ultima_atualizacao_do_lattes = ?, resultado_ultima_avaliação = ?, aprovação_obrigatorias= ?, aprovação_optativas= ?," + 
                   "conceitos= ?, disciplinas_repovadas_curso= ?, disciplinas_repovadas_semestre= ?, exame_proeficiencia= ?," + 
                   "exame_de_qualificacao= ?,limite_max_qualificacao= ?, tempo_limete_deposito= ?, artigos_publicados= ?, artigos_espera= ?," + 
                   "artigo_preparacao= ?, estagio_atual_pesquisa= ?,congresso = ?,congresso_extorior= ?, pesquisa_exterior= ?, declaracao= ?)" + 
                   "WHERE cod_formulario = ?";
            return queryExecuter(connection, query, [
            semestre_curso, ultima_atualizacao_do_lattes, resultado_ultima_avaliação, aprovação_obrigatorias, 
            aprovação_optativas, conceitos, disciplinas_repovadas_curso, disciplinas_repovadas_semestre, 
            exame_proeficiencia, exame_de_qualificacao, limite_max_qualificacao, tempo_limete_deposito, 
            artigos_publicados, artigos_espera, artigo_preparacao, estagio_atual_pesquisa, congresso, 
            congresso_extorior, pesquisa_exterior, declaracao, cod_formulario
            ]);
        } catch(e) {
            throw e;
        }
    }
}