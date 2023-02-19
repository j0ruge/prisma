import {Request, Response } from 'express'
import {prismaClient} from '../database/prismaClient';


export class CreateCultoController{
    async handle(request: Request, response: Response){
        const { data_culto, dia_semana_culto, periodo_culto } = request.body;
        const datetime_converted_data_culto =  new Date(data_culto);
        const culto = await prismaClient.culto.create({
            data:{
                data_culto: datetime_converted_data_culto,
                dia_semana_culto,
                periodo_culto,              
            }
        });
        return response.json(culto);
    }
}