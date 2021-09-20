const { Router } = require('express');
const routes = Router();

const alunoController = require('./controllers/alunoController');
const FormularioController = require('./controllers/formularioController');
const sessionController = require('./controllers/sessionController');
const statusController = require('./controllers/statusController');

const sessionMiddlware = require('./middleware/auth');

routes.post('/session', sessionController.login);

routes.post('/aluno', alunoController.insert);
routes.get('/aluno' , alunoController.index);
//routes.get('/usersid',sessionMiddlware.auth, usersController.getById);


routes.post('/formularios', sessionMiddlware.auth, FormularioController.store);
routes.get('/formularios/aluno', sessionMiddlware.auth, FormularioController.getStudent);
//formaularios/editar
routes.get('/formularios/professor',sessionMiddlware.auth, FormularioController.getProfessor);
routes.put('/formularios/professor',sessionMiddlware.auth, FormularioController.storeProfessor);
routes.get('/formularios', sessionMiddlware.auth, FormularioController.getAll);
routes.put('/formularios/coordenacao',sessionMiddlware.auth, FormularioController.storeCoordinator);
routes.delete('/formularios/:id', sessionMiddlware.auth, FormularioController.delete);
routes.put('/formularios', sessionMiddlware.auth, FormularioController.updateById);

//status
routes.get('/status', sessionMiddlware.auth, statusController.get);
routes.put('/status/professor', sessionMiddlware.auth, statusController.insertProfessor);
routes.put('/status/coordenador', sessionMiddlware.auth, statusController.insertCoordinator);


module.exports = routes;