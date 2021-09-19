const { isCoordinator, isProfessor, isStudent } = require('../config/level');
const { customAlphabet } = require('nanoid');
const Forms = require('../models/formularioModel');
const StudentInfo = require('../models/alunoInfosModel');
const Status = require('../models/statusModel');


class FormsController {
  async store(req, res) {

    try {

      const professor = await StudentInfo.getProfessor(req.userID);
      const numero_usp_professor = professor[0].numero_usp_professor;
      const cod_forms = parseInt(customAlphabet('1234567890', 7)());
      const cod_status = parseInt(customAlphabet('1234567890', 7)());

      const forms = await Forms.insert({ ...req.body, cod_formulario: cod_forms, 
       numero_usp_professor: numero_usp_professor, numero_usp_aluno: req.userID });
      
      const currenteDate = new Date();

      const status = await Status.insert({ cod_status: cod_status, cod_formulario: cod_forms, status: 'Enviado para o professor',
         data: `${currenteDate.getFullYear()}-${currenteDate.getMonth() + 1}-${currenteDate.getDate()}/`, 
         avaliacao_professor: '', avaliacao_coordenadoria:''});

      return res.status(200).json({forms, status});

    } catch (error) {
      console.log(error);
      return res.status(500).json({ msg: 'internal server error' });
    }
  }

  async storeProfessor(req, res) {
    if(!isProfessor(req.userLevel)){
      return res.status(403).json({ msg: 'forbidden' });
    }

    try {
      
      const forms = await Forms.getForms(req.body.cod_formulario);

      if(forms.length === 0) {
        return res.status(400).json({ msg: 'Forms dosent exists' });
      }

      const commentProfessor = await Forms.insertProfessor(req.body);

      const currenteDate = new Date();

      const status = await Status.insertProfessor({ cod_formulario:forms[0].cod_formulario, status: 'Enviado para a coordenadoria',
         data: `${currenteDate.getFullYear()}-${currenteDate.getMonth() + 1}-${currenteDate.getDate()}/`, 
         avaliacao_professor: req.body.avaliacao_professor});

      return res.status(200).json({commentProfessor, status});

    } catch (error) {
      console.log(error);
      return res.status(500).json({ msg: 'internal server error' });
    }
  }

    async storeCoordinator(req, res) {
    if(!isCoordinator(req.userLevel)){
      return res.status(403).json({ msg: 'forbidden' });
    }

    try {
      
      const forms = await Forms.getForms(req.body.cod_formulario);

      if(forms.length === 0) {
        return res.status(400).json({ msg: 'Forms dosent exists' });
      }

      const commentCoordinator = await Forms.insertCoordinator({...req.body, numero_usp_coordenadoria: req.userID});

      const currenteDate = new Date();

      const status = await Status.insertCoordinator({ cod_formulario:forms[0].cod_formulario, status: 'Finalizado',
         data: `${currenteDate.getFullYear()}-${currenteDate.getMonth() + 1}-${currenteDate.getDate()}/`, 
         avaliacao_coordenadoria: req.body.avaliacao_coordenador});

      return res.status(200).json({commentCoordinator, status});

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

      if(!getForms) {
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
      
      if(!isCoordinator(req.userLevel)) {
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
       console.log(error);
       return res.status(500).json({ msg: 'internal server error' });
     }
  }

  async updateById(req, res) {
    try {
      if(!isStudent(req.userLevel)) {
        return res.status(403).json({ msg: 'forbidden' });
      }

      const formulario = await Forms.getStudent(req.userID);
      let cod_forms = formulario[0].cod_formulario
      if(!formulario) {
        return res.status(400).json({ msg: 'Forms dosent exists' });
      }

      await Forms.update(req.body, cod_forms);

     return res.status(200).json({ msg: 'forms updated' });

    } catch (error) {
      console.log(error);
      return res.status(500).json({ msg: 'internal server error' });
    }
 }
}

module.exports = new FormsController();
