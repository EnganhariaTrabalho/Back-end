const { isCoordinator, isProfessor, isStudent } = require('../config/level');
const Forms = require('../models/formularioModel');
const StudentInfo = require('../models/alunoInfosModel');
const Status = require('../models/statusModel');

class StatusController {

  async get(req, res) {

    if(!isStudent(req.userLevel)) {
      return res.status(403).json({ msg: 'forbidden' });
    }

    try {
      const forms = await Forms.getStudent(req.userID);

      if(forms.length === 0) {
        return res.status(400).json({ msg: 'Forms dosent exists' });
      }

      const cod_formulario = forms[0].cod_formulario;

      console.log(cod_formulario)
      const status = await Status.get(cod_formulario);

      return res.status(200).json(status)


    } catch (error) {
      console.log(error);
      return res.status(500).json({ msg: 'internal server error' });
    }
  }
}

module.exports = new StatusController();