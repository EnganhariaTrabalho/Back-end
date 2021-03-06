const connection = require('../config/connection');
const queryExecuter = require('../helpers/queryExecuter');

module.exports = {
  insert({ numero_usp, numero_usp_professor, lattes, curso }) {
    return queryExecuter(connection, "INSERT INTO informacao_aluno (numero_usp_aluno, numero_usp_professor, lattes , curso) VALUES (?, ?, ?, ?)", [numero_usp, numero_usp_professor, lattes, curso])
  },

  getAll() {
    return queryExecuter(connection, "SELECT * FROM informacao_aluno", [])
  },

  getProfessor(numero_usp) {
    return queryExecuter(connection, "SELECT numero_usp_professor FROM informacao_aluno WHERE numero_usp_aluno = ?", [numero_usp])
  }

}