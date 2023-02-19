import {Request, Response } from 'express'
import {prismaClient} from '../database/prismaClient';


export class CreateColaboradorController{
    async handle(request: Request, response: Response){
        const { nome } = request.body;
        const colaborador = await prismaClient.colaborador.create({
            data:{
                nome,
            }
        });
        return response.json(colaborador);
    }
}