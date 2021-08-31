const connection = require('../config/connection');
const queryExecuter = require('../helpers/queryExecuter');

module.exports = {
  insert({ nome_usuario, email, senha, nome, numero_usp }) {
    return queryExecuter(connection, "INSERT INTO aluno (nome_usuario, email, senha, nome, numero_usp) VALUES (?, ?, ?, ?, ?)", [nome_usuario, email, senha, nome, numero_usp])
  },

  getAll() {
    return queryExecuter(connection, "SELECT * FROM aluno", [])
  },

  getById(id) {
    return queryExecuter(connection, "SELECT * FROM aluno WHERE id = ?", [id])
  },

  getByEmail(email) {
    return queryExecuter(connection, "SELECT * FROM aluno WHERE email = ?", [email])
  },

  delete(id) {
    try {
      return queryExecuter(connection, "DELETE FROM aluno WHERE id = ?", [id]);
    } catch (e) {
      throw e;
    }
  }
}