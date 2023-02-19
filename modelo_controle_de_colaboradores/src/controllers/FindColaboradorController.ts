import {Request, Response } from 'express'
import {prismaClient} from '../database/prismaClient';


export class FindColaboradorController{
    async handle(request: Request, response: Response){
        const { id } = request.params;
        const colaborador = await prismaClient.colaborador.findFirst({
            where:{
                id
            },             
            include:{
                CultoColaborador: true
            }                                     
        });
        return response.json(colaborador);
    }
}