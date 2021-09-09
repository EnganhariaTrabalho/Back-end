const { isCoordinator, isProfessor, isStudent } = require('../config/level');
const { customAlphabet } = require('nanoid');
const Forms = require('../models/formularioModel');
const StudentInfo = require('../models/alunoInfosModel');


class FormsController {
  async store(req, res) {

    try {

      const professor = await StudentInfo.getProfessor(req.userID);
      const numero_usp_professor = professor[0].numero_usp_professor;
      const cod = parseInt(customAlphabet('1234567890', 7)());

      const forms = await Forms.insert({
        ...req.body, cod_formulario: cod,
        numero_usp_professor: numero_usp_professor, numero_usp_aluno: req.userID
      });

      return res.status(200).json(forms);

    } catch (error) {
      console.log(error);
      return res.status(500).json({ msg: 'internal server error' });
    }
  }

  async getStudent(req, res) {
    try {

      if(!isStudent(req.userLevel)) {
        return res.status(403).json({ msg: 'forbidden' });
      }

      const getForms = await Forms.getStudent(req.userID);

      if(!getForms) {
        return res.status(400).json({ msg: 'Forms dosent exists' });
      }

      return res.status(200).json(getForms);
      
    } catch (error) {
      console.log(error);
      return res.status(500).json({ msg: 'internal server error' });
    }
  }

  async getProfessor(req, res) {
    try {

      if(!isProfessor(req.userLevel)) {
        return res.status(403).json({ msg: 'forbidden' });
      }

      const getForms = await Forms.getProfessor(req.userID);

      if (!getForms) {
        return res.status(400).json({ msg: 'Forms dosent exists' });
      }

      return res.status(200).json(getForms);

    } catch (error) {
      console.log(error);
      return res.status(500).json({ msg: 'internal server error' });
    }
  }

  async getAll(req, res) {
    try {

      if (!isCoordinator(req.userLevel)) {
        return res.status(403).json({ msg: 'forbidden' });
      }

      const getAll = await Forms.getAll();

      return res.status(200).json(getAll);

    } catch (error) {
      console.log(error);
      return res.status(500).json({ msg: 'internal server error' });
    }
  }

  async delete(req, res) {
     try {

      const forms_cod = req.params.id;

      if(!isCoordinator(req.userLevel)) {
        return res.status(403).json({ msg: 'forbidden' });
      }

      await Forms.delete(forms_cod);

      return res.status(200).json({ msg: 'forms deleted' });

     } catch (error) {
       
     }
  }
}

module.exports = new FormsController();