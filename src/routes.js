const { Router } = require('express');
const routes = Router();

const alunoController = require('./controllers/alunoController');
const FormularioController = require('./controllers/formularioController');
const sessionController = require('./controllers/sessionController');

const sessionMiddlware = require('./middleware/auth');

routes.post('/session', sessionController.login);

routes.post('/aluno', alunoController.insert);
routes.get('/aluno' , alunoController.index);
//routes.get('/usersid',sessionMiddlware.auth, usersController.getById);


routes.post('/formularios', sessionMiddlware.auth, FormularioController.store);
routes.get('/formularios/aluno', sessionMiddlware.auth, FormularioController.getStudent);
//formaularios/editar
routes.get('/formularios/professor',sessionMiddlware.auth, FormularioController.getProfessor);
routes.get('/formularios', sessionMiddlware.auth, FormularioController.getAll);
routes.delete('/formularios/:id', sessionMiddlware.auth, FormularioController.delete);
routes.put('/formularios', sessionMiddlware.auth, FormularioController.updateById);


module.exports = routes;