const connection = require('../config/connection');
const queryExecuter = require('../helpers/queryExecuter');

module.exports = {
    insert({nome_usuario, email, senha, nome, numero_usp, nivel}) { 
        console.log(nome_usuario)
        return queryExecuter(connection, "INSERT INTO coordenadoria (nome_usuario, email, senha, nome, numero_usp, nivel) VALUES (?, ?, ?, ?, ?, ?)", [nome_usuario, email, senha, nome, numero_usp, nivel])
    },

    getAll() {
        return queryExecuter(connection, "SELECT * FROM coordenadoria", [])
    },  

    getById(id) {
        return queryExecuter(connection, "SELECT * FROM coordenadoria WHERE id = ?", [id])
    },

    getByEmail(email) {
        console.log(email);
        return queryExecuter(connection, "SELECT * FROM coordenadoria WHERE email = ?", [email])
    },

    delete(id) {
        try {
            return queryExecuter(connection, "DELETE FROM coordenadoria WHERE id = ?", [id]);
        } catch(e) {
            throw e;
        }
    }
}