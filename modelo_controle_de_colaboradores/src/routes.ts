import {Router} from 'express';
import {CreateColaboradorController} from './controllers/CreateColaboradorController';

const router = Router();
const createColaborador = new CreateColaboradorController();
router.post('/colaborador', createColaborador.handle);

export {router};