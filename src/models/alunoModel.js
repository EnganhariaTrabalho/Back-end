const connection = require('../config/connection');
const queryExecuter = require('../helpers/queryExecuter');

module.exports = {
    insert({ nome_usuario, email, senha, nome, numero_usp }) {
        return queryExecuter(connection, "INSERT INTO aluno (nome_usuario, email, senha, nome, numero_usp) VALUES (?, ?, ?, ?, ?)", [nome_usuario, email, senha, nome, numero_usp])
    },

    getAll() {
        return queryExecuter(connection, "SELECT * FROM aluno", [])
    },

    getByPK(numero_usp) {
        return queryExecuter(connection, "SELECT * FROM aluno WHERE numero_usp = ?", [numero_usp])
    },

    getByEmail(email) {
    return queryExecuter(connection, "SELECT * FROM aluno WHERE email = ?", [email])
    },

    delete(numero_usp) {
        try {
            return queryExecuter(connection, "DELETE FROM aluno WHERE numero_usp = ?", [numero_usp]);
        } catch(e) {
            throw e;
        }
    }
}