const connection = require('../config/connection');
const queryExecuter = require('../helpers/queryExecuter');

module.exports = {
    insert({nome_usuario, email, senha, nome, numero_usp, nivel}) { 
        return queryExecuter(connection, "INSERT INTO professor (nome_usuario, email, senha, nome, numero_usp, nivel) VALUES (?, ?, ?, ?, ?, ?)", [nome_usuario, email, senha, nome, numero_usp, nivel])
    },

    getAll() {
        return queryExecuter(connection, "SELECT * FROM professor", [])
    },  

    getByPK(numero_usp) {
        return queryExecuter(connection, "SELECT * FROM professor WHERE numero_usp = ?", [numero_usp])
    },

    getByEmail(email) {
        return queryExecuter(connection, "SELECT * FROM professor WHERE email = ?", [email])
    },

    delete(numero_usp) {
        try {
            return queryExecuter(connection, "DELETE FROM professor WHERE numero_usp = ?", [numero_usp]);
        } catch(e) {
            throw e;
        }
    }
}