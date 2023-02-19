import {Router} from 'express';
import {CreateColaboradorController} from './controllers/CreateColaboradorController';
import {CreateCultoController} from './controllers/CreateCultoController';

const router = Router();
const createColaborador = new CreateColaboradorController();
const createCulto = new CreateCultoController();

router.post('/colaborador', createColaborador.handle);
router.post('/culto', createCulto.handle);

export {router};