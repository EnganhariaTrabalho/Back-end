const jwt = require('jsonwebtoken');
const authConfig = require('../config/auth');
const alunoModel = require('../models/alunoModel');
const professorModel = require('../models/professorModel');
const coordenadoriaModel = require('../models/coordenadoriaModel');

class SessionController {
    async login(req, res) {

      let user;
      if(req.body.nivel === 'aluno') {
        user = await alunoModel.getByEmail(req.body.email);
        
      } 
      else if (req.body.nivel === 'professor') {
        user = await professorModel.getByEmail(req.body.email);
      }
      else if(req.body.nivel === 'coordenadoria') {
        user = await coordenadoriaModel.getByEmail(req.body.email);
      }

      if(user.length === 0){
        return res.status(401).json({ error: 'User not found'});
      }

      if(user[0].senha !== req.body.senha) {
        return res.status(401).json({ error: 'Password does not match'});
      }

      const { numero_usp, nome, email, nivel} = user[0];

      return res.json({
        user:{
          numero_usp,
          nome,
          email,
          nivel,
        },
        token: jwt.sign({numero_usp, nivel}, authConfig.secret, {
          expiresIn: authConfig.expiresIn
        })
      })
  }
}

module.exports = new SessionController();