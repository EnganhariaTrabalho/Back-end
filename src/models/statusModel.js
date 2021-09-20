const connection = require('../config/connection');
const queryExecuter = require('../helpers/queryExecuter');

module.exports = {
  insert({ cod_status, cod_formulario, status, data, avaliacao_professor, avaliacao_coordenadoria }) {
    return queryExecuter(connection, "INSERT INTO status ( cod_status, cod_formulario, status, data, avaliacao_professor, avaliacao_coordenadoria) VALUES (?, ?, ?, ?, ?, ?)", [ cod_status, cod_formulario, status, data, avaliacao_professor, avaliacao_coordenadoria ])
  },

  insertProfessor({status, data, avaliacao_professor, cod_formulario}) {
     return queryExecuter(connection, "UPDATE status SET status = ?, data = ?, avaliacao_professor = ? WHERE cod_formulario = ?", [status, data, avaliacao_professor, cod_formulario])
  },

  performanceProfessor({data, avaliacao_professor, cod_formulario}) {
    return queryExecuter(connection, "UPDATE status SET data = ?, avaliacao_professor = ? WHERE cod_formulario = ?", [data, avaliacao_professor, cod_formulario]);
  },

  insertCoordinator({status, data, avaliacao_coordenadoria, cod_formulario}) {
     return queryExecuter(connection, "UPDATE status SET status = ?, data = ?, avaliacao_coordenadoria = ? WHERE cod_formulario = ?", [status, data, avaliacao_coordenadoria, cod_formulario])
  },

  performanceCoordinator({data, avaliacao_coordenadoria, cod_formulario}) {
    return queryExecuter(connection, "UPDATE status SET data = ?, avaliacao_coordenadoria = ? WHERE cod_formulario = ?", [data, avaliacao_coordenadoria, cod_formulario]);
  },

  get(cod_formulario) {
    return queryExecuter(connection, "SELECT * FROM status WHERE cod_formulario = ?", [cod_formulario]);
  }
}