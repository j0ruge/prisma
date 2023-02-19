import {Router} from 'express';
import {CreateColaboradorController} from './controllers/CreateColaboradorController';
import { CreateCultoColaboradorController } from './controllers/CreateCultoColaboradorController';
import {CreateCultoController} from './controllers/CreateCultoController';
import { FindColaboradorController } from './controllers/FindColaboradorController';

const router = Router();
const createColaborador = new CreateColaboradorController();
const createCulto = new CreateCultoController();
const createCultoColaboradorController = new CreateCultoColaboradorController();
const findColaborador = new FindColaboradorController();

router.post('/colaborador', createColaborador.handle);
router.post('/culto', createCulto.handle);
router.post('/culto_colaborador', createCultoColaboradorController.handle);
router.get('/find_colaborador/:id', findColaborador.handle);

export {router};