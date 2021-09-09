const connection = require('../config/connection');
const queryExecuter = require('../helpers/queryExecuter');


module.exports = {
    insert({cod_formulario, numero_usp_aluno, numero_usp_professor, 
        semestre_curso, ultima_atualizacao_do_lattes, resultado_ultima_avaliacao, aprovacao_obrigatorias, 
        aprovacao_optativas, conceitos, disciplinas_repovadas_curso, disciplinas_repovadas_semestre, 
        exame_proeficiencia, exame_de_qualificacao, limite_max_qualificacao, tempo_limite_deposito, 
        artigos_publicados, artigos_espera, artigo_preparacao, estagio_atual_pesquisa, congresso, 
        congresso_exterior, pesquisa_exterior, declaracao}) {

        let query  = "INSERT INTO formulario";
        query +=" (cod_formulario, numero_usp_aluno, numero_usp_professor, semestre_curso," + 
                   "ultima_atualizacao_do_lattes, resultado_ultima_avaliacao, aprovacao_obrigatorias, aprovacao_optativas," + 
                   "conceitos, disciplinas_repovadas_curso, disciplinas_repovadas_semestre, exame_proeficiencia," + 
                   "exame_de_qualificacao,limite_max_qualificacao, tempo_limite_deposito, artigos_publicados, artigos_espera," + 
                   "artigo_preparacao, estagio_atual_pesquisa,congresso ,congresso_exterior, pesquisa_exterior, declaracao)" + 
                   "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        console.log(query);

        return queryExecuter(connection, query, [
            cod_formulario, numero_usp_aluno, numero_usp_professor, 
        semestre_curso, ultima_atualizacao_do_lattes, resultado_ultima_avaliacao, aprovacao_obrigatorias, 
        aprovacao_optativas, conceitos, disciplinas_repovadas_curso, disciplinas_repovadas_semestre, 
        exame_proeficiencia, exame_de_qualificacao, limite_max_qualificacao, tempo_limite_deposito, 
        artigos_publicados, artigos_espera, artigo_preparacao, estagio_atual_pesquisa, congresso, 
        congresso_exterior, pesquisa_exterior, declaracao 
        ]);
    },

    getAll() {
        return queryExecuter(connection, "SELECT * FROM informacoes_aluno", [])
    },

    getById(id) {
        return queryExecuter(connection, "SELECT * FROM users WHERE id = ?", [id])
    },

    delete(id) {
        try {
            return queryExecuter(connection, "DELETE FROM users WHERE id = ?", [id]);
        } catch(e) {
            throw e;
        }
    }
}