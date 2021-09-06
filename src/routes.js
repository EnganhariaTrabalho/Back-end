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


routes.post('/formularios', FormularioController.store);
//routes.get('/formularios',sessionMiddlware.auth, FormularioController.getAll);

module.exports = routes;