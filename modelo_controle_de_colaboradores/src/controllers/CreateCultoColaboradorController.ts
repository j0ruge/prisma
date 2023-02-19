import {Request, Response } from 'express'
import {prismaClient} from '../database/prismaClient';


export class CreateCultoColaboradorController{
    async handle(request: Request, response: Response){
        const { id_culto,  id_colaborador, funcao_culto} = request.body;
        const cultoColaborador = await prismaClient.cultoColaborador.create({
            data:{
                id_culto,
                id_colaborador,
                funcao_culto
            }
        });
        return response.json(cultoColaborador);
    }
}