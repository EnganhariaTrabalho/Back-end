'use strict'
const alunoInfosModel = require('../models/alunoInfosModel');
const alunoModel = require('../models/alunoModel');
const professorModel = require('../models/professorModel');

module.exports = {

  async insert(req, res) {
    try {
      const student = await alunoModel.getByPK(req.body.numero_usp);
      const professor = await professorModel.getByPK(req.body.numero_usp_professor)

      if (student.length !== 0) {
        return res.json({ msg: 'Student already exists' });
      }

      if(professor.length === 0) {
        return res.json({ msg:'Professor does not exist' });
      }

      const newStudent = await alunoModel.insert(req.body);
      const info = await alunoInfosModel.insert(req.body);

      return res.json({newStudent, info});
    } catch (error) {
      console.log(error);
      return res.status(500).json({ msg: 'internal server error' });
    }
  },

  async index(req, res) {
    try {
      const response = await alunoModel.getAll();
      if (response) return res.status(200).json({ users: response });
    } catch (erro) {
      console.log(error);
      return res.status(500).json({ msg: 'internal server error' });
    }
  },

  async getById(req, res) {
    try {
      const response = await alunoModel.getById(req.userID);
      if (response) return res.status(200).json(response);
    } catch (erro) {
      console.log(error);
      return res.status(500).json({ msg: 'internal server error' });
    }
  },

}
